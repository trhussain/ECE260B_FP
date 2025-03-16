// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module normalization (clk, execute, abs_in, abs_sum_in, normalization_out);

  parameter col = 8;
  parameter bw = 8;
  parameter bw_psum = 2*bw+4;
  parameter bw_out = 2*bw+9;

  input  clk, execute;
  input [col*bw_psum-1:0] abs_in;
  input [bw_psum+4:0] abs_sum_in;
  output reg [col*bw_psum-1:0] normalization_out;

  wire [bw_psum-1:0] abs_in_0, abs_in_1, abs_in_2, abs_in_3, abs_in_4, abs_in_5, abs_in_6, abs_in_7;

  assign abs_in_0 = abs_in[bw_psum*1-1 : bw_psum*0];
  assign abs_in_1 = abs_in[bw_psum*2-1 : bw_psum*1];
  assign abs_in_2 = abs_in[bw_psum*3-1 : bw_psum*2];
  assign abs_in_3 = abs_in[bw_psum*4-1 : bw_psum*3];
  assign abs_in_4 = abs_in[bw_psum*5-1 : bw_psum*4];
  assign abs_in_5 = abs_in[bw_psum*6-1 : bw_psum*5];
  assign abs_in_6 = abs_in[bw_psum*7-1 : bw_psum*6];
  assign abs_in_7 = abs_in[bw_psum*8-1 : bw_psum*7];

  always @ (posedge clk) begin
    if (execute) begin
      // $display("(normalization.v) div_result = %d abs_in_0 : %d abs_sum_in : %d", {abs_in_0,23'b0} / abs_sum_in, abs_in_0, abs_sum_in);

      normalization_out[bw_psum*1-1 : bw_psum*0] <= {abs_in_0,22'b0} / abs_sum_in; 
      normalization_out[bw_psum*2-1 : bw_psum*1] <= {abs_in_1,22'b0} / abs_sum_in;
      normalization_out[bw_psum*3-1 : bw_psum*2] <= {abs_in_2,22'b0} / abs_sum_in;
      normalization_out[bw_psum*4-1 : bw_psum*3] <= {abs_in_3,22'b0} / abs_sum_in;
      normalization_out[bw_psum*5-1 : bw_psum*4] <= {abs_in_4,22'b0} / abs_sum_in;
      normalization_out[bw_psum*6-1 : bw_psum*5] <= {abs_in_5,22'b0} / abs_sum_in;
      normalization_out[bw_psum*7-1 : bw_psum*6] <= {abs_in_6,22'b0} / abs_sum_in;
      normalization_out[bw_psum*8-1 : bw_psum*7] <= {abs_in_7,22'b0} / abs_sum_in;
      // $display("DIV: %d %d %d", $signed({sfp_in_sign0,20'b0}) / $signed(sum_q), sfp_in_sign0, sum_q);// Correct way to display signed numbers
      // $display("DIV(NORM.V): checking first normalization %d ", $unsigned({abs_in_0,20'b0}) / $unsigned(abs_sum_in));// Correct way to display signed numbers
     
    end
 end


endmodule

