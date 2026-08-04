/*
 * Problem Name: Exams/m2014 q4a
 * Date: 8/4/2026, 11:39:56 PM
 * 
 * Problem Statement:
 * Implement the given D latch.
 */

module top_module (
    input d, 
    input ena,
    output reg q);
    
    always@(*)
        begin
            if(ena)
                q<=d;
        end

endmodule
