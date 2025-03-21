// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module fullchip (clk, mem_in, inst, reset, full_out);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 8;

input  clk; 
input  [pr*bw-1:0] mem_in; 
input  [16:0] inst; 
input  reset;

output [bw_psum*col-1:0] full_out; 
wire [bw_psum*col-1:0] core_out; 
assign full_out = core_out;  

wire unused1, unused2;
core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance (
    .reset(reset), 
    .clk(clk), 
    .mem_in(mem_in), 
    .inst(inst),
    .out(core_out),
    .myFakeCoreInit(unused1),  // Just to satisfy port connection, debug signals
    .myFakeCoreNoNInit(unused2)
);

integer q; // Declare loop variable properly

always @(posedge clk) begin
    if (inst[1]) begin
        $write("Core Output |");
        for (q = col-1; q >= 0; q = q - 1) begin  // Reverse the order to match expected output
            $write(" %6d |", $signed(core_out[q*bw_psum +: bw_psum])); // Convert HEX to signed DECIMAL
        end
        $display(""); // Move to new line
        $display("---------------------------------------------------");
    end
end



endmodule
