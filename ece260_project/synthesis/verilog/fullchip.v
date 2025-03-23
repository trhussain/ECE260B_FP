// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module fullchip (clk, mem0_in, mem1_in, inst, reset, core_out0, core_out1, vmem0_in, vmem1_in);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 8;

input  clk; 
input  [pr*bw-1:0] mem0_in; 
input  [pr*bw-1:0] mem1_in;
input  [31:0] inst; 
input  reset;
input [pr*bw_psum-1:0] vmem0_in;
input [pr*bw_psum-1:0] vmem1_in;

output [(bw_psum+bw+4)*col-1:0] core_out0; 
output [(bw_psum+bw+4)*col-1:0] core_out1; 

wire sum_fifo_wr, sum_fifo_rd;

assign sum_fifo_wr = inst[18]; 
assign sum_fifo_rd = inst[19]; 

wire [bw_psum+3:0] core_0_add_sum, core_1_add_sum;
wire [bw_psum+3:0] core_0_add_sum_fifo, core_1_add_sum_fifo;

wire core_0_fifo_empty, core_1_fifo_empty;
wire core_0_fifo_full, core_1_fifo_full;


core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance0 ( 
      .reset(reset), 
      .clk(clk), 
      .mem_in(mem0_in), 
      .inst(inst),
      .out(core_out0),
      .core_sum_out(core_0_add_sum),
      .core_sum_in(core_1_add_sum_fifo), // Coming from the FIFO 
      .vmem_in(vmem0_in)
);

core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance1 (
      .reset(reset), 
      .clk(clk), 
      .mem_in(mem1_in), 
      .inst(inst),
      .out(core_out1),
      .core_sum_out(core_1_add_sum),
      .core_sum_in(core_0_add_sum_fifo),
      .vmem_in(vmem1_in)
);

fifo_depth8 #(.bw(bw_psum+4))  fifo_core0_sum (
        .reset(reset),
        .rd_clk(clk),
        .wr_clk(clk),
        .in(core_0_add_sum),
        .wr(sum_fifo_wr), // 1 = execute, 0 = don't write
        .rd(sum_fifo_rd), // 1 = read, 0 = don't read 
        .o_empty(core_0_fifo_empty), // Valid when there is data to be read 
        .o_full(core_0_fifo_full), 
        .out(core_0_add_sum_fifo)
);

fifo_depth8 #(.bw(bw_psum+4))  fifo_core1_sum (
        .reset(reset),
        .rd_clk(clk),
        .wr_clk(clk),
        .in(core_1_add_sum),
        .wr(sum_fifo_wr),
        .rd(sum_fifo_rd),
        .o_empty(core_1_fifo_empty),
        .o_full(core_1_fifo_full),
        .out(core_1_add_sum_fifo)
);

integer q; // Declare loop variable properly

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // core_0_add_sum_fifo <= 0;
        // core_1_add_sum_fifo <= 0;
        // core_0_add_sum <= 0;
        // core_1_add_sum <= 0;
        // core_0_fifo_empty <= 0;
        // core_1_fifo_empty <= 0;
        // core_0_fifo_full <= 0; 
        // core_1_fifo_full <= 0;
    end
    else begin
        if (inst[31]) begin
            $write("Core Output |");
            for (q = 7; q >= 0; q = q - 1) begin
                $write(" %d |", $signed(core_out1[q*32 +: 32]));
            end
            
            for (q = 7; q >= 0; q = q - 1) begin
                $write(" %d |", $signed(core_out0[q*32 +: 32]));
            end
            
            // for (q = col*2-1; q >= 0; q = q - 1) begin  // Reverse the order to match expected output
            //     if (q < col)
            //         $write(" %d |", $signed(core_out0[q*32 +: 32])); // Convert HEX to signed DECIMAL
            //     else
            //         $write(" %d |", $signed(core_out1[(q%(col))*32 +: 32]));
            // end
            $display(""); // Move to new line
            $display("---------------------------------------------------");
        end

    // if (sum_fifo_wr) begin
    //     $display("SUM: %d", core_1_add_sum);
    end
end



endmodule
