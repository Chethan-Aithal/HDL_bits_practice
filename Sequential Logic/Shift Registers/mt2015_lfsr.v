/*
 * Problem Name: Mt2015 lfsr
 * Date: 9/2/2026, 9:52:08 PM
 * 
 * Problem Statement:
 * Write the Verilog code for a 3-bit LFSR on a DE1-SoC board.
 */

module df(
    input clk,
    input d,
    input load,
    input data,
    output reg q
);
    always@(posedge clk)
        begin
            if(load)
                q <= data;
            else 
                q <= d;
        end
endmodule

module top_module (
    input [2:0] SW,      // R
    input [1:0] KEY,     // L and clk
    output [2:0] LEDR    // Q
);

    df d1(.clk(KEY[0]), .d(LEDR[2]), .load(KEY[1]), .data(SW[0]), .q(LEDR[0]));
    df d2(.clk(KEY[0]), .d(LEDR[0]), .load(KEY[1]), .data(SW[1]), .q(LEDR[1]));
    df d3(.clk(KEY[0]), .d((LEDR[2] ^ LEDR[1])), .load(KEY[1]), .data(SW[2]), .q(LEDR[2]));

endmodule
