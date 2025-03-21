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
reg    renamedLoadReadyQ;
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

// always @(posedge clk) begin
//   $write("Q_in Q: %h\n", q_in);
// end
reg    [3:0] myFakeSignal;
always @(posedge clk or posedge reset) begin
  if (reset) begin
    cnt_q <= 4'b0000;
    renamedLoadReadyQ <= 1;
    inst_q <= 0;
    inst_2q <= 0;
    myFakeSignal <= 0;
    // q_out <= 0; // RST signal -> if 0 then NOT pnr(likely verilog), if not 0 then pnr 
  end
  else begin
    // $write("MAC 16IN PSUM: %h ", psum);
    // $display("");
    myFakeSignal <= ~myFakeSignal;

    inst_q <= i_inst;
    inst_2q <= inst_q;
    if (inst_q[0]) begin
       query_q <= q_in;
       if (cnt_q == 9-col_id)begin
         cnt_q <= 0;
         key_q <= q_in;
         renamedLoadReadyQ <= 0;
       end
       else if (renamedLoadReadyQ)
         cnt_q <= cnt_q + 1;
    end
    else if(inst_q[1]) begin
      //out     <= psum;
      query_q <= q_in;
    end
  end
end

endmodule
