/*
 * Problem Name: Exams/2014 q4b
 * Date: 9/3/2026, 4:32:25 PM
 * 
 * Problem Statement:
 * Implement a 4-bit shift register using MUXDFF submodules.
 */

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF D4(.clk(KEY[0]), .E(KEY[1]), .L(KEY[2]), .w(KEY[3]), .R(SW[3]), .Q(LEDR[3]));
    MUXDFF D3(.clk(KEY[0]), .E(KEY[1]), .L(KEY[2]), .w(LEDR[3]), .R(SW[2]), .Q(LEDR[2]));
    MUXDFF D2(.clk(KEY[0]), .E(KEY[1]), .L(KEY[2]), .w(LEDR[2]), .R(SW[1]), .Q(LEDR[1]));
    MUXDFF D1(.clk(KEY[0]), .E(KEY[1]), .L(KEY[2]), .w(LEDR[1]), .R(SW[0]), .Q(LEDR[0]));
  
endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire w1, w2;
    assign w2 = E ? w : Q;
    assign w1 = L ? R : w2;
    
    always@(posedge clk)
        Q <= w1;
endmodule
