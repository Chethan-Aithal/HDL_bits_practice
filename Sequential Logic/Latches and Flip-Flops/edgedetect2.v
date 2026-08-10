/*
 * Problem Name: Edgedetect2
 * Date: 8/10/2026, 4:38:13 PM
 * 
 * Problem Statement:
 * Detect any edge (positive or negative) on an 8-bit signal.
 */

module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    reg [7:0] last;
    
    always @(posedge clk) begin 
        last <= in;
        anyedge <= in ^ last;
    end

endmodule
