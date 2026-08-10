/*
 * Problem Name: Exams/ece241 2013 q7
 * Date: 8/10/2026, 4:02:46 PM
 * 
 * Problem Statement:
 * Implement a JK flip-flop.
 */

module top_module (
    input clk,
    input j,
    input k,
    output reg Q
); 
    always @(posedge clk) begin
        case({j, k})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1'b1;
            2'b11: Q <= ~Q;
            default: Q <= 0;
        endcase
    end

endmodule
