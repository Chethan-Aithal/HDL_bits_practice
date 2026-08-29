/*
 * Problem Name: Countbcd
 * Date: 8/29/2026, 8:15:31 PM
 * 
 * Problem Statement:
 * Build a 4-digit BCD (binary-coded decimal) counter.
 */

module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[3:0] == 4'd9 && q[7:4] == 4'd9);
    assign ena[3] = (q[3:0] == 4'd9 && q[7:4] == 4'd9 && q[11:8] == 4'd9);

    bcd_digit u_ones (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .Q(q[3:0])
    );

    bcd_digit u_tens (
        .clk(clk),
        .reset(reset),
        .enable(ena[1]),
        .Q(q[7:4])
    );

    bcd_digit u_hundreds (
        .clk(clk),
        .reset(reset),
        .enable(ena[2]),
        .Q(q[11:8])
    );

    bcd_digit u_thousands (
        .clk(clk),
        .reset(reset),
        .enable(ena[3]),
        .Q(q[15:12])
    );

endmodule

module bcd_digit (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q
);

    always @(posedge clk) begin
        if (reset) begin
            Q <= 4'd0;
        end else if (enable) begin
            if (Q == 4'd9) begin
                Q <= 4'd0;
            end else begin
                Q <= Q + 1'b1;
            end
        end
    end

endmodule
