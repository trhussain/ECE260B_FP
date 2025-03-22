// sum the output from the two fifos
module add_sum (inst, fifo1_in, fifo2_in, clk, sum_out);

    parameter bw = 8;
    parameter bw_psum = 2*bw+4;

    input inst;
    input clk;
    input [bw_psum+3:0] fifo1_in;
    input [bw_psum+3:0] fifo2_in;
    output reg [bw_psum+4:0] sum_out;

    always @(posedge clk) begin
        if (inst) begin
            sum_out <= fifo1_in + fifo2_in;
            // $display("(add_sum.v )%d %d %d", sum_out, fifo1_in, fifo2_in);
        end

    end

endmodule