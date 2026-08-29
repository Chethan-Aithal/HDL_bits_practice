/*
 * Problem Name: Exams/ece241 2014 q7a
 * Date: 8/29/2026, 7:29:17 PM
 * 
 * Problem Statement:
 * Design a 1-12 counter using the provided 4-bit binary counter component.
 */

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 

    assign c_load = reset || (Q == 4'b1100 && enable);
    assign c_d = 4'b0001;
    assign c_enable = reset || enable; 
    
    count4 the_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

endmodule
