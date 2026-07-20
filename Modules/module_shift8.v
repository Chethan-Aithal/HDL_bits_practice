/*
 * Problem Name: Module shift8
 * Date: 7/14/2026, 11:10:37 PM
 * 
 * Problem Statement:
 * Instantiate three my_dff8 modules (8-bit DFFs) and a 4-to-1 mux to create
 * a variable-length shift register where sel selects the output delay (0-3 cycles).
 */

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);

    reg [7:0] q1;
    reg [7:0] q2;
    reg [7:0] q3;

    my_dff8 dff1 (clk, d,  q1);
    my_dff8 dff2 (clk, q1, q2);
    my_dff8 dff3 (clk, q2, q3);

    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = q1;
            2'b10: q = q2;
            2'b11: q = q3;
        endcase
    end

endmodule
