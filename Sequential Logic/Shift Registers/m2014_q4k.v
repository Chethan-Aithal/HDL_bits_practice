/*
 * Problem Name: Exams/m2014 q4k
 * Date: 9/2/2026, 10:19:49 PM
 * 
 * Problem Statement:
 * Implement a 4-bit shift register with active-low synchronous reset.
 */

module top_module (
    input clk,
    input resetn,
    input in,     
    output out    
);
    reg [3:0] q;
    
    always @(posedge clk) begin
        if (!resetn) begin         
            q <= 4'b0000;
        end else begin
            q <= {in, q[3:1]};
        end
    end
    
    assign out = q[0];

endmodule
