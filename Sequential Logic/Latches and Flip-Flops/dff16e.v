/*
 * Problem Name: Dff16e
 * Date: 8/2/2026, 8:09:00 PM
 * 
 * Problem Statement:
 * Create a 16-bit D flip-flop with active low synchronous reset and byte enable.
 */

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);
    always @(posedge clk) begin
        if (!resetn) begin
            q <= 16'h0000;
        end else begin
            if (byteena[1]) begin
                q[15:8] <= d[15:8];
            end
            if (byteena[0]) begin
                q[7:0] <= d[7:0];
            end
        end
    end
               
endmodule
