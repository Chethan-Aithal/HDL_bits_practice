/*
 * Problem Name: Exams/m2014 q4d
 * Date: 8/4/2026, 11:47:59 PM
 * 
 * Problem Statement:
 * Implement a D flip-flop where the next state is the XOR of the input and the current state.
 */

module top_module (
    input clk,
    input in,
    output reg out
);

    always@(posedge clk)
    begin
        out <= in ^ out;
    end

endmodule
