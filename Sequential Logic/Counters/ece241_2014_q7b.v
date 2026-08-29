/*
 * Problem Name: Exams/ece241 2014 q7b
 * Date: 8/29/2026, 7:54:07 PM
 * 
 * Problem Statement:
 * Derive a 1 Hz signal from a 1000 Hz clock using three BCD counters.
 */

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    
    wire [3:0] q0, q1, q2;
    
    assign c_enable[0] = 1'b1; // Always enabled to count ones digit
    assign c_enable[1] = (q0 == 4'd9);
    assign c_enable[2] = (q0 == 4'd9 && q1 == 4'd9);
    
    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);
    
    assign OneHertz = (q0 == 4'd9 && q1 == 4'd9 && q2 == 4'd9);

endmodule
