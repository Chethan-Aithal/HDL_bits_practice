/*
 * Problem Name: Module name
 * Date: 7/14/2026, 7:13:34 PM
 * 
 * Problem Statement:
 * Instantiate mod_a by connecting ports by name (named mapping).
 */

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    // Instantiate mod_a and connect ports by name
    mod_a instance_name (
        .out1(out1), 
        .out2(out2),
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d)
    );

endmodule
