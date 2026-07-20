/*
 * Problem Name: Vector0
 * Date: 7/12/2026, 7:11:02 PM
 * 
 * Problem Statement:
 * Build a circuit that splits a 3-bit vector into 3 separate outputs and also outputs the vector itself.
 */

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); 
    
    // Module body starts after module declaration
    assign outv = vec;
    assign {o2, o1, o0} = vec;

endmodule
