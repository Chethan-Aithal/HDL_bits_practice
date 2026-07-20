/*
 * Problem Name: Module pos
 * Date: 7/14/2026, 7:09:48 PM
 * 
 * Problem Statement:
 * Instantiate mod_a by connecting ports by position (positional mapping).
 */

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    // Instantiate mod_a and connect ports by position
    mod_a instance_name ( out1, out2, a, b, c, d );

endmodule
