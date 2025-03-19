// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module fullchip (clk, mem_in, inst, reset);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 8;

input  clk; 
input  [pr*bw-1:0] mem_in; 
input  [20:0] inst; 
input  reset;

output [bw_psum*col-1:0] core_out0; 
output [bw_psum*col-1:0] core_out1; 

assign sum_fifo_wr = inst[18]; 
assign sum_fifo_rd = inst[19]; 

wire [bw_psum+3:0] core_0_add_sum, core_1_add_sum;
wire [bw_psum+3:0] core_0_add_sum_fifo, core_1_add_sum_fifo;

wire core_0_fifo_empty, core_1_fifo_empty;
wire core_0_fifo_full, core_1_fifo_full;


core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance0 ( 
      .reset(reset), 
      .clk(clk), 
      .mem_in(mem_in), 
      .inst(inst),
      .out(core_out0),
      .core_sum_out(core_0_add_sum),
      .core_sum_in(core_1_add_sum_fifo) // Coming from the FIFO 
);

core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance1 (
      .reset(reset), 
      .clk(clk), 
      .mem_in(mem_in), 
      .inst(inst),
      .out(core_out1),
      .core_sum_out(core_1_add_sum),
      .core_sum_in(core_0_add_sum_fifo)
);

fifo_depth16 #(.bw(bw_psum+4))  fifo_core0_sum (
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

fifo_depth16 #(.bw(bw_psum+4))  fifo_core1_sum (
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

always @(posedge clk) begin
    if (inst[1]) begin
        $write("Core Output |");
        for (q = col*2-1; q >= 0; q = q - 1) begin  // Reverse the order to match expected output
            if (q < col-1)
                $write(" %6d |", $unsigned(core_out0[q*bw_psum +: bw_psum])); // Convert HEX to signed DECIMAL
            else
                $write(" %6d |", $unsigned(core_out1[(q%(col))*bw_psum +: bw_psum]));
        end
        $display(""); // Move to new line
        $display("---------------------------------------------------");
    end

    // if (sum_fifo_wr) begin
    //     $display("SUM: %d", core_1_add_sum);
    // end
end



endmodule
