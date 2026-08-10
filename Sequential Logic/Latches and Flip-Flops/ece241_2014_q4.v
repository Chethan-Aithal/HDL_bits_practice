/*
 * Problem Name: Exams/ece241 2014 q4
 * Date: 8/8/2026, 5:33:27 PM
 * 
 * Problem Statement:
 * Implement a sequential circuit with three D flip-flops.
 */

module dfff(
    input clk,
    input in,
    output reg q,
    output nq
);
    assign nq = ~q;

    always @(posedge clk) begin
        q <= in;
    end
endmodule
    
module top_module (
    input clk,
    input x,
    output z
); 
   
    wire q1, q2, q3;
    wire nq1, nq2, nq3;

    dfff df1(.clk(clk), .in(x ^ q1), .q(q1), .nq(nq1));
    dfff df2(.clk(clk), .in(x & nq2), .q(q2), .nq(nq2));
    dfff df3(.clk(clk), .in(x | nq3), .q(q3), .nq(nq3));

    assign z = ~(q1 | q2 | q3);

endmodule
