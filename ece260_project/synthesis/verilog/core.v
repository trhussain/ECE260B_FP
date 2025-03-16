// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
//module core (clk, sum_out, mem_in, out, inst, reset);
module core (clk, mem_in, out, inst, reset, core_sum_in, core_sum_out);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 8;

parameter bw_sum = bw_psum+3;

//output [bw_psum+3:0] sum_out;
output [bw_psum*col-1:0] out;
wire   [bw_psum*col-1:0] pmem_out;
input  [pr*bw-1:0] mem_in;
input  clk;
input  [20:0] inst; 
input  reset;

input  [bw_psum+3:0] core_sum_in; //input sum from the other core
output [bw_psum+3:0] core_sum_out; //output sum from add_row

wire  [pr*bw-1:0] mac_in;
wire  [pr*bw-1:0] kmem_out;
wire  [pr*bw-1:0] qmem_out;
wire  [bw_psum*col-1:0] pmem_in;
wire  [bw_psum*col-1:0] fifo_mac_out; // fifo output from mac_col

// add_row
wire  [bw_psum+3:0] add_row_sum_out;    //sum output from add_row
wire  [bw_psum*col-1:0] add_row_abs_out; //abs output from add_row

// add_row fifo param
wire  [bw_psum+3:0] fifo_add_row_sum_out; // fifo output from add_row_sum
wire  [bw_psum*col-1:0] fifo_add_row_abs_out; // fifo output from add_row_abs

//add_sum param
wire  [bw_psum+4:0] add_sum_out; // output from add_sum

wire  [bw_psum*col-1:0] sfp_out;
wire  [bw_psum*col-1:0] array_out;
wire  [col-1:0] fifo_wr;
wire  ofifo_rd;
wire [3:0] qkmem_add;
wire [3:0] pmem_add;

wire  qmem_rd;
wire  qmem_wr; 
wire  kmem_rd;
wire  kmem_wr; 
wire  pmem_rd;
wire  pmem_wr; 

wire sum_fifo_rd, sum_fifo_wr, norm_execute, add_sum;

assign norm_execute = inst[20];
assign sum_fifo_rd = inst[19];
assign sum_fifo_wr = inst[18];
assign add_sum = inst[17];
assign ofifo_rd = inst[16];
assign qkmem_add = inst[15:12];
assign pmem_add = inst[11:8];

assign qmem_rd = inst[5];
assign qmem_wr = inst[4];
assign kmem_rd = inst[3];
assign kmem_wr = inst[2];
assign pmem_rd = inst[1];
assign pmem_wr = inst[0];

assign mac_in  = inst[6] ? kmem_out : qmem_out;
assign pmem_in = sfp_out;

assign out = pmem_out; // Delay by 1 cycle to ensure data is stable

//the out put sum of this core is the sum from add_row
assign core_sum_out = add_row_sum_out;

wire sum_fifo_full;
wire sum_fifo_empty;
wire abs_fifo_full;
wire abs_fifo_empty;


mac_array #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) mac_array_instance (
        .in(mac_in), 
        .clk(clk), 
        .reset(reset), 
        .inst(inst[7:6]),     
        .fifo_wr(fifo_wr),     
	.out(array_out)
);

ofifo #(.bw(bw_psum), .col(col))  ofifo_mac ( //from mac array
        .reset(reset),
        .clk(clk),
        .in(array_out),
        .wr(fifo_wr),
        .rd(ofifo_rd),
        .o_valid(fifo_valid),
        .out(fifo_mac_out)
);

//write into pmem somewhere here, begin the norm process when the pmem_rd is high

/*
Notes:
        fifo depth could be much lower than 16, set this high for testing
        pmem rd and write not used atm
*/

//stores the sum output of the add_row
fifo_depth16 #(.bw(bw_psum+4), .simd(1))  fifo_sum ( //should hold enough for sum of the abs numbers from the mac
        .reset(reset),
        .rd_clk(clk),
        .wr_clk(clk),
        .in(add_row_sum_out),
        .wr(sum_fifo_wr),
        .rd(sum_fifo_rd),
        .o_full(sum_fifo_full),
        .o_empty(sum_fifo_empty),
        .out(fifo_add_row_sum_out)
);

//stores the abs outputs of the add_row
fifo_depth16 #(.bw(col*bw_psum), .simd(1))  fifo_abs ( //should hold enough for all 8 abs numbers from the mac
        .reset(reset),
        .rd_clk(clk),
        .wr_clk(clk),
        .in(add_row_abs_out),
        .wr(sum_fifo_wr),
        .rd(sum_fifo_rd),
        .o_full(abs_fifo_full),
        .o_empty(abs_fifo_empty),
        .out(fifo_add_row_abs_out)
);


add_row #() add_row_instance ( //should be fed 8 numbers from pmem
        .sum_in(fifo_mac_out), 
        .sum_out(add_row_sum_out), 
        .abs_out(add_row_abs_out)
);

// add_sum #() add_sum_instance (
//         .inst(add_sum),
//         .fifo1_in(fifo_add_row_sum_out),
//         .fifo2_in(core_sum_in), 
//         .sum_out(add_sum_out),
//         .clk(clk)
// );

assign add_sum_out = fifo_add_row_sum_out + core_sum_in;

sram_w16 #(.sram_bit(pr*bw)) qmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(qmem_out),
        .CEN(!(qmem_rd||qmem_wr)), // Chip Enable, 0 = read or Write, 1 = ignore all inptus
        .WEN(!qmem_wr), // WEN logic is inversed, WEN = 0 -> READ
        .A(qkmem_add)
);

sram_w16 #(.sram_bit(pr*bw)) kmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(kmem_out),
        .CEN(!(kmem_rd||kmem_wr)),
        .WEN(!kmem_wr), 
        .A(qkmem_add)
);

// partial sum memory, pmemin = fifo_out 
sram_w16 #(.sram_bit(col*bw_psum)) psum_mem_instance (
        .CLK(clk),
        .D(pmem_in),
        .Q(pmem_out),
        .CEN(!(pmem_rd||pmem_wr)), // one of rd OR wr == 1
        .WEN(!pmem_wr), //!WEN = write to mem -> pmem_wr needs to be 1 !1 -> 0 -> !WEN -> 1, WEN = read from mem
        .A(pmem_add)
);

normalization normalization_instance(
        .clk(clk),
        .execute(norm_execute),
        .abs_in(fifo_add_row_abs_out),
        .abs_sum_in(add_sum_out),
        .normalization_out(pmem_in)
);


  //////////// For printing purpose ////////////
//   always @(posedge clk) begin
//       if(pmem_wr)
//          $display("Memory write to PSUM mem add %x %x ", pmem_add, pmem_in); 
//   end
integer i;
integer fi;

always @(posedge clk) begin
    if (sum_fifo_wr) begin
            $display("FIFO_ADD_ROW_SUM_OUT: %d", add_row_sum_out);
    end

    // if (sum_fifo_rd) begin
    //         $display("ADD SUM OUT (Core.v): %d", add_sum_out);
    // end

    // if (pmem_wr) begin
    //     $write("PMEM WRITE: addr=%d | ", pmem_add);
    //     for (i = 0; i < pr; i = i + 1) begin
    //         $write(" %6d |", $signed(pmem_in[i*bw_psum +: bw_psum]));  // 20-bit chunks
    //     end
    //     $display(""); 
    // end


    // $display("Mem in: %h", mem_in);
//     if (qmem_wr) begin
//         $write("QMEM WRITE: addr=%d | ", qkmem_add);
//         for (i = 0; i < pr; i = i + 1) begin
//             $write("%4d ", $signed(mem_in[(i+1)*bw-1 -: bw]));  // 8-bit chunks
//         end
//         $display(""); 
//     end

//     if (qmem_rd) begin
//         $write("QMEM RD: addr=%d | ", qkmem_add);
//         for (i = 0; i < pr; i = i + 1) begin
//             $write("%4d ", $signed(qmem_out[(i+1)*bw-1 -: bw]));  // 8-bit chunks
//         end
//         $display(""); 
//     end
//     if (kmem_wr) begin
//         $write("KMEM WRITE: addr=%d | ", qkmem_add);
//         for (i = 0; i < pr; i = i + 1) begin
//             $write("%4d ", $signed(mem_in[(i+1)*bw-1 -: bw]));  // 8-bit chunks
//         end
//         $display("");   
//     end
//     if (kmem_rd) begin
//         $write("KMEM RD: addr=%d | ", qkmem_add);
//         for (i = 0; i < pr; i = i + 1) begin
//             $write("%4d ", $signed(kmem_out[(i+1)*bw-1 -: bw]));  // 8-bit chunks
//         end
//         $display(""); 
//     end
//     if (!pmem_wr && pmem_rd) begin
//         $write("PMEME OUT: addr=%d | ", pmem_add);
//         for (i = 0; i < pr; i = i + 1) begin
//             $write("%4d ", $signed(out[(i+1)*bw-1 -: bw]));  // 8-bit chunks
//         end
//         $display(""); 
//     end
//     if (pmem_wr && ofifo_rd) begin

//         $write("PMEME WRITE: addr=%d | ", pmem_add);
//         for (i = 0; i < pr; i = i + 1) begin
//             $write("%4d ", $signed(pmem_in[(i+1)*bw-1 -: bw]));  // 8-bit chunks
//         end
//         $display(""); 
//     end
                // $display("PMEM WRITING: pmem_wr=%b | pmem_add=%d | ofifo_rd=%b", pmem_wr, pmem_add, ofifo_rd);

//     if (|fifo_wr) begin  // If any bit of fifo_wr is high, meaning a valid write
//         $write("MAC ARRAY OUT/FIFO IN: ");
//         for (fi = 0; fi < col; fi= fi + 1) begin
//             $write("%6d ", $signed(array_out[(fi+1)*bw_psum-1 -: bw_psum])); // Extract each column's result
//         end
//         $display("");  // New line
//     end
//     if (ofifo_rd) begin
//         $write("FIFO OUT: ");
//         for (fi = 0; fi < col; fi = fi + 1) begin
//             $write("%6d ", $signed(fifo_out[(fi+1)*bw_psum-1 -: bw_psum])); 
//         end
//         $display("");  
//         end
        // if (!pmem_rd) begin
        // $write("PMEM OUT: ");
        // for (fi = 0; fi < col; fi = fi + 1) begin
        //         $write("%6d ", $signed(pmem_out[(fi+1)*bw_psum-1 -: bw_psum])); 
        // end
        // $display("");  
        // end

//$display("PSUM WRITE: addr=%d, data=%h", pmem_add, pmem_in);
end




endmodule
