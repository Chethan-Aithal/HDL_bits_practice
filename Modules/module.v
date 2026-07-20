/*
 * Problem Name: Module
 * Date: 7/14/2026, 12:10:44 AM
 * 
 * Problem Statement:
 * Instantiate mod_a and connect ports by name.
 */

module top_module ( 
    input a, 
    input b, 
    output out 
);

    // Instantiate mod_a and connect ports by name
    mod_a instance1 (
        .in1(a),
        .in2(b),
        .out(out)
    );

endmodule
