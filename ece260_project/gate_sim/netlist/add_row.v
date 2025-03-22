// sum the output of mac
module add_row (sum_in, sum_out, abs_out);

    parameter col = 8;
    parameter bw = 8;
    parameter bw_psum = 2*bw+4;
    

    input [col*bw_psum-1:0] sum_in;
    wire [col*bw_psum-1:0] abs;
    output [col*bw_psum-1:0] abs_out;
    output [bw_psum+3:0] sum_out;

    assign abs[bw_psum*1-1 : bw_psum*0] = (sum_in[bw_psum*1-1]) ?  (~sum_in[bw_psum*1-1 : bw_psum*0] + 1)  :  sum_in[bw_psum*1-1 : bw_psum*0];
    assign abs[bw_psum*2-1 : bw_psum*1] = (sum_in[bw_psum*2-1]) ?  (~sum_in[bw_psum*2-1 : bw_psum*1] + 1)  :  sum_in[bw_psum*2-1 : bw_psum*1];
    assign abs[bw_psum*3-1 : bw_psum*2] = (sum_in[bw_psum*3-1]) ?  (~sum_in[bw_psum*3-1 : bw_psum*2] + 1)  :  sum_in[bw_psum*3-1 : bw_psum*2];
    assign abs[bw_psum*4-1 : bw_psum*3] = (sum_in[bw_psum*4-1]) ?  (~sum_in[bw_psum*4-1 : bw_psum*3] + 1)  :  sum_in[bw_psum*4-1 : bw_psum*3];
    assign abs[bw_psum*5-1 : bw_psum*4] = (sum_in[bw_psum*5-1]) ?  (~sum_in[bw_psum*5-1 : bw_psum*4] + 1)  :  sum_in[bw_psum*5-1 : bw_psum*4];
    assign abs[bw_psum*6-1 : bw_psum*5] = (sum_in[bw_psum*6-1]) ?  (~sum_in[bw_psum*6-1 : bw_psum*5] + 1)  :  sum_in[bw_psum*6-1 : bw_psum*5];
    assign abs[bw_psum*7-1 : bw_psum*6] = (sum_in[bw_psum*7-1]) ?  (~sum_in[bw_psum*7-1 : bw_psum*6] + 1)  :  sum_in[bw_psum*7-1 : bw_psum*6];
    assign abs[bw_psum*8-1 : bw_psum*7] = (sum_in[bw_psum*8-1]) ?  (~sum_in[bw_psum*8-1 : bw_psum*7] + 1)  :  sum_in[bw_psum*8-1 : bw_psum*7];
            
    assign sum_out = 
        {4'b0, abs[bw_psum*1-1 : bw_psum*0]} + // Defined above, just doing 2's complement
        {4'b0, abs[bw_psum*2-1 : bw_psum*1]} +
        {4'b0, abs[bw_psum*3-1 : bw_psum*2]} +
        {4'b0, abs[bw_psum*4-1 : bw_psum*3]} +
        {4'b0, abs[bw_psum*5-1 : bw_psum*4]} +
        {4'b0, abs[bw_psum*6-1 : bw_psum*5]} +
        {4'b0, abs[bw_psum*7-1 : bw_psum*6]} +
        {4'b0, abs[bw_psum*8-1 : bw_psum*7]} ;

    assign abs_out = abs;

    // always @(posedge clk) begin
    //     if(reset) begin
    //         sum_out <= 0;
    //     end
    //     else begin
    //         sum_out <= 
    //             {4'b0, abs[bw_psum*1-1 : bw_psum*0]} + // Defined above, just doing 2's complement
    //             {4'b0, abs[bw_psum*2-1 : bw_psum*1]} +
    //             {4'b0, abs[bw_psum*3-1 : bw_psum*2]} +
    //             {4'b0, abs[bw_psum*4-1 : bw_psum*3]} +
    //             {4'b0, abs[bw_psum*5-1 : bw_psum*4]} +
    //             {4'b0, abs[bw_psum*6-1 : bw_psum*5]} +
    //             {4'b0, abs[bw_psum*7-1 : bw_psum*6]} +
    //             {4'b0, abs[bw_psum*8-1 : bw_psum*7]} ;
    //     end
    // end
endmodule