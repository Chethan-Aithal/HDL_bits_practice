/*
 * Problem Name: Exams/m2014 q4b
 * Date: 8/4/2026, 11:43:24 PM
 * 
 * Problem Statement:
 * Implement a D flip-flop with asynchronous reset.
 */

module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output reg q);
    
    always@(posedge clk or posedge ar)
        begin
            if(ar==1)
                q<=0;
            else 
                q<=d;
        end

endmodule
