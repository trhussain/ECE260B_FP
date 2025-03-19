// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module ming_sfp_row (clk, inst, sfp_in, sfp_out, reset);

  parameter col = 8;
  parameter bw = 8;
  parameter bw_psum = 2*bw+4;

 
  input  clk, div, reset;
  input [1:0] inst;

  assign acc = inst[1];
  assign div = inst[0];

  input  [col*bw_psum-1:0] sfp_in; // is the input and it takes in all 8 numbers at once
  wire  [col*bw_psum-1:0] abs; // holds absolute value of input numbers
  output [col*bw_psum-1:0] sfp_out;
  
  reg signed [bw_psum-1:0] sfp_in_sign0;
  reg signed [bw_psum-1:0] sfp_in_sign1;
  reg signed [bw_psum-1:0] sfp_in_sign2;
  reg signed [bw_psum-1:0] sfp_in_sign3;
  reg signed [bw_psum-1:0] sfp_in_sign4;
  reg signed [bw_psum-1:0] sfp_in_sign5;
  reg signed [bw_psum-1:0] sfp_in_sign6;
  reg signed [bw_psum-1:0] sfp_in_sign7;

  reg signed [bw_psum-1:0] sfp_out_sign0;
  reg signed [bw_psum-1:0] sfp_out_sign1;
  reg signed [bw_psum-1:0] sfp_out_sign2;
  reg signed [bw_psum-1:0] sfp_out_sign3;
  reg signed [bw_psum-1:0] sfp_out_sign4;
  reg signed [bw_psum-1:0] sfp_out_sign5;
  reg signed [bw_psum-1:0] sfp_out_sign6;
  reg signed [bw_psum-1:0] sfp_out_sign7;

  reg [bw_psum+3:0] sum_q;
  wire [bw_psum+3:0] sum;

  assign sfp_out[bw_psum*1-1 : bw_psum*0] = sfp_out_sign0;
  assign sfp_out[bw_psum*2-1 : bw_psum*1] = sfp_out_sign1;
  assign sfp_out[bw_psum*3-1 : bw_psum*2] = sfp_out_sign2;
  assign sfp_out[bw_psum*4-1 : bw_psum*3] = sfp_out_sign3;
  assign sfp_out[bw_psum*5-1 : bw_psum*4] = sfp_out_sign4;
  assign sfp_out[bw_psum*6-1 : bw_psum*5] = sfp_out_sign5;
  assign sfp_out[bw_psum*7-1 : bw_psum*6] = sfp_out_sign6;
  assign sfp_out[bw_psum*8-1 : bw_psum*7] = sfp_out_sign7;

  assign abs[bw_psum*1-1 : bw_psum*0] = (sfp_in[bw_psum*1-1]) ?  (~sfp_in[bw_psum*1-1 : bw_psum*0] + 1)  :  sfp_in[bw_psum*1-1 : bw_psum*0];
  assign abs[bw_psum*2-1 : bw_psum*1] = (sfp_in[bw_psum*2-1]) ?  (~sfp_in[bw_psum*2-1 : bw_psum*1] + 1)  :  sfp_in[bw_psum*2-1 : bw_psum*1];
  assign abs[bw_psum*3-1 : bw_psum*2] = (sfp_in[bw_psum*3-1]) ?  (~sfp_in[bw_psum*3-1 : bw_psum*2] + 1)  :  sfp_in[bw_psum*3-1 : bw_psum*2];
  assign abs[bw_psum*4-1 : bw_psum*3] = (sfp_in[bw_psum*4-1]) ?  (~sfp_in[bw_psum*4-1 : bw_psum*3] + 1)  :  sfp_in[bw_psum*4-1 : bw_psum*3];
  assign abs[bw_psum*5-1 : bw_psum*4] = (sfp_in[bw_psum*5-1]) ?  (~sfp_in[bw_psum*5-1 : bw_psum*4] + 1)  :  sfp_in[bw_psum*5-1 : bw_psum*4];
  assign abs[bw_psum*6-1 : bw_psum*5] = (sfp_in[bw_psum*6-1]) ?  (~sfp_in[bw_psum*6-1 : bw_psum*5] + 1)  :  sfp_in[bw_psum*6-1 : bw_psum*5];
  assign abs[bw_psum*7-1 : bw_psum*6] = (sfp_in[bw_psum*7-1]) ?  (~sfp_in[bw_psum*7-1 : bw_psum*6] + 1)  :  sfp_in[bw_psum*7-1 : bw_psum*6];
  assign abs[bw_psum*8-1 : bw_psum*7] = (sfp_in[bw_psum*8-1]) ?  (~sfp_in[bw_psum*8-1 : bw_psum*7] + 1)  :  sfp_in[bw_psum*8-1 : bw_psum*7];
           
  always @ (posedge clk) begin
    if (reset) begin
    end
    else begin
       if (acc) begin

          sfp_in_sign0 <=  sfp_in[bw_psum*1-1 : bw_psum*0]; // holds signed input numbers
          sfp_in_sign1 <=  sfp_in[bw_psum*2-1 : bw_psum*1];
          sfp_in_sign2 <=  sfp_in[bw_psum*3-1 : bw_psum*2];
          sfp_in_sign3 <=  sfp_in[bw_psum*4-1 : bw_psum*3];
          sfp_in_sign4 <=  sfp_in[bw_psum*5-1 : bw_psum*4];
          sfp_in_sign5 <=  sfp_in[bw_psum*6-1 : bw_psum*5];
          sfp_in_sign6 <=  sfp_in[bw_psum*7-1 : bw_psum*6];
          sfp_in_sign7 <=  sfp_in[bw_psum*8-1 : bw_psum*7];

         sum_q <= 
           {4'b0, abs[bw_psum*1-1 : bw_psum*0]} + // Defined above, just doing 2's complement
           {4'b0, abs[bw_psum*2-1 : bw_psum*1]} +
           {4'b0, abs[bw_psum*3-1 : bw_psum*2]} +
           {4'b0, abs[bw_psum*4-1 : bw_psum*3]} +
           {4'b0, abs[bw_psum*5-1 : bw_psum*4]} +
           {4'b0, abs[bw_psum*6-1 : bw_psum*5]} +
           {4'b0, abs[bw_psum*7-1 : bw_psum*6]} +
           {4'b0, abs[bw_psum*8-1 : bw_psum*7]} ;
       end
       else begin
         if (div) begin
           sfp_out_sign0 <= $signed({sfp_in_sign0,20'b0}) / $signed(sum_q); // signed output from sfp need to shift by 8 bits
           sfp_out_sign1 <= $signed({sfp_in_sign1,20'b0}) / $signed(sum_q);
           sfp_out_sign2 <= $signed({sfp_in_sign2,20'b0}) / $signed(sum_q);
           sfp_out_sign3 <= $signed({sfp_in_sign3,20'b0}) / $signed(sum_q);
           sfp_out_sign4 <= $signed({sfp_in_sign4,20'b0}) / $signed(sum_q);
           sfp_out_sign5 <= $signed({sfp_in_sign5,20'b0}) / $signed(sum_q);
           sfp_out_sign6 <= $signed({sfp_in_sign6,20'b0}) / $signed(sum_q);
           sfp_out_sign7 <= $signed({sfp_in_sign7,20'b0}) / $signed(sum_q);

          //  $display("DIV: %d %d %d", $signed({sfp_in_sign0,20'b0}) / $signed(sum_q), sfp_in_sign0, sum_q);// Correct way to display signed numbers
         end
       end
   end
 end


endmodule

