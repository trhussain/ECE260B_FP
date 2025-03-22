// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module mac_col (clk, reset, out, q_in, q_out, i_inst, fifo_wr, o_inst);

parameter bw = 8;
parameter bw_psum = 2*bw+6;
parameter pr = 8;
parameter col_id = 0;

output signed [bw_psum-1:0] out;
input  signed [pr*bw-1:0] q_in;
output signed [pr*bw-1:0] q_out;
input  clk, reset;
input  [1:0] i_inst; // [1]: execute, [0]: load 
output [1:0] o_inst; // [1]: execute, [0]: load 
output fifo_wr;
reg    load_ready_q;
reg    [3:0] cnt_q;
reg    [1:0] inst_q;
reg    [1:0] inst_2q;
reg   signed [pr*bw-1:0] query_q;
reg   signed [pr*bw-1:0] key_q;
wire  signed [bw_psum-1:0] psum;

assign o_inst = inst_q;
assign fifo_wr = inst_2q[1];
assign q_out  = query_q;
assign out = psum;

mac_16in #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_16in_instance (
        .a(query_q), 
        .b(key_q),
	.out(psum)
); 


always @ (posedge clk or posedge reset) begin
  if (reset) begin
    cnt_q <= 0;
    load_ready_q <= 1;
    inst_q <= 0;
    inst_2q <= 0;
  end
  else begin
    inst_q <= i_inst;
    inst_2q <= inst_q;
    if (inst_q[0]) begin
       query_q <= q_in;
       if (cnt_q == 9-col_id)begin
         cnt_q <= 0;
         key_q <= q_in;
         load_ready_q <= 0;
        // $write("MAC COL INPUT1: %d %d %d %d %d %d %d %d", $signed(q_in[1*bw-1:0*bw]), $signed(q_in[2*bw-1:1*bw]), $signed(q_in[3*bw-1:2*bw]), $signed(q_in[4*bw-1:3*bw]), $signed(q_in[5*bw-1:4*bw]), $signed(q_in[6*bw-1:5*bw]), $signed(q_in[7*bw-1:6*bw]), $signed(q_in[8*bw-1:7*bw]));
	      // $display("");
       end
       else if (load_ready_q)
         cnt_q <= cnt_q + 1;
    end
    else if(inst_q[1]) begin
      //out     <= psum;
      query_q <= q_in;
      // $write("MAC COL INPUT2: %d %d %d %d %d %d %d %d", $signed(q_in[1*bw-1:0*bw]), $signed(q_in[2*bw-1:1*bw]), $signed(q_in[3*bw-1:2*bw]), $signed(q_in[4*bw-1:3*bw]), $signed(q_in[5*bw-1:4*bw]), $signed(q_in[6*bw-1:5*bw]), $signed(q_in[7*bw-1:6*bw]), $signed(q_in[8*bw-1:7*bw]));
	    // $display("");
    end
  end
end

endmodule
