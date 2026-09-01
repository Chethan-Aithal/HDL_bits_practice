/*
 * Problem Name: Shift4
 * Date: 9/1/2026, 6:59:22 PM
 * 
 * Problem Statement:
 * Build a 4-bit shift register (right shift), with asynchronous reset, synchronous load, and enable.
 */

module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q
); 
    
    always@(posedge clk or posedge areset)
        begin
            if(areset == 1'b1)
                begin
                    q <= 4'b0000;
                end
            else if(load)
                begin
                    q <= data;
                end
            else if(ena)
                begin
                    q[3] <= 0;
                    q[2] <= q[3];
                    q[1] <= q[2];
                    q[0] <= q[1];
                end
        end

endmodule
