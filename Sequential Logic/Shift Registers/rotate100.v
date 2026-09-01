/*
 * Problem Name: Rotate100
 * Date: 9/1/2026, 7:10:22 PM
 * 
 * Problem Statement:
 * Build a 100-bit left/right rotator, with synchronous load and left/right enable.
 */

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q
); 
    always@(posedge clk)
        begin
            if(load)
                q <= data;
            else 
                begin
                    case(ena)
                        2'b01: q <= {q[0], q[99:1]};
                        2'b10: q <= {q[98:0], q[99]};
                        default: q <= q;
                    endcase
                end
        end

endmodule
