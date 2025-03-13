module ming_sfp_row_8 (
    input  clk, reset,
    input  [6:0] inst,  // 7-bit instruction: bits [3:0] = operation, bits [6:4] = read select
    input  [col*bw_psum-1:0] sfp_in,  // 8-row input, each row is bw_psum bits
    output reg [bw_psum-1:0] sfp_out  // Output one row at a time based on inst[6:4]
);
    parameter col = 8;
    parameter bw = 8;
    parameter bw_psum = 2*bw+4;

    // Temporary signals for each row input/output
    wire [bw_psum-1:0] sfp_in_temp [col-1:0];  // Holds 8 inputs
    wire [bw_psum-1:0] sfp_out_temp [col-1:0]; // Holds 8 outputs

    // Extract read select bits (upper 3 bits of inst) to determine output row
    wire [2:0] read_index = inst[6:4];  

    // Extract operation mode (lower 4 bits of inst)
    wire [3:0] inst_op = inst[3:0];  // 1-8 for ADD, 9-16 for DIV

    // Assign sfp_in slices to array format
    genvar i;
    generate
        for (i = 0; i < col; i = i + 1) begin : sfp_row_instances
            assign sfp_in_temp[i] = sfp_in[(i+1)*bw_psum-1 : i*bw_psum];

            // Determine if this instance should perform ADD or DIV
            wire is_add = (inst_op == i + 1);   // Match inst_op (1-8) to instance #
            wire is_div = (inst_op == i + 9);   // Match inst_op (9-16) to instance #

            // Instantiate 8 copies of ming_sfp_row with correct instruction
            ming_sfp_row ming_sfp_inst (
                .clk(clk),
                .inst({is_add, is_dev}),
                .sfp_in(sfp_in_temp[i]),
                .sfp_out(sfp_out_temp[i]),
                .reset(reset)
            );

            // Display instance operation
            always @(posedge clk) begin
                if (reset)
                    $display("Cycle %0d: Instance %0d RESET", $time, i);
                else if (is_add)
                    $display("Cycle %0d: Instance %0d ADD Mode: sfp_in[%0d] = %0d, sfp_out[%0d] = %0d", 
                              $time, i, i, sfp_in_temp[i], i, sfp_out_temp[i]);
                else if (is_div)
                    $display("Cycle %0d: Instance %0d DIV Mode: sfp_in[%0d] = %0d, sfp_out[%0d] = %0d", 
                              $time, i, i, sfp_in_temp[i], i, sfp_out_temp[i]);
            end
        end
    endgenerate

    // Output selected row based on inst[6:4] (read_index)
    always @(*) begin
        sfp_out = sfp_out_temp[read_index];
    end

    // Display read output behavior
    always @(posedge clk) begin
        if (!reset) begin
            $display("Cycle %0d: READ sfp_out[%0d] = %0d", $time, read_index, sfp_out);
        end
    end

endmodule
