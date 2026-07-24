/*
 * Problem Name: Adder100
 * Date: 7/25/2026, 12:09:51 AM
 * 
 * Problem Statement:
 * Create a 100-bit binary adder.
 */

module fa(
    input a, b, cin,
    output s, ca
);
    assign s = a ^ b ^ cin;
    assign ca = (a & b) | (b & cin) | (cin & a);
endmodule

module top_module(
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum
);
    wire [100:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : fa_loop
            fa fa_inst (
                a[i],
                b[i],
                c[i],
                sum[i],
                c[i+1]
            );
        end
    endgenerate

    assign cout = c[100];
endmodule
