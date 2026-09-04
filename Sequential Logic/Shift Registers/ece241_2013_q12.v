/*
 * Problem Name: Exams/ece241 2013 q12
 * Date: 9/4/2026, 11:21:01 PM
 * 
 * Problem Statement:
 * Implement an 8-to-1 LUT (Look-Up Table) circuit using an 8-bit shift register.
 */

module DF(
    input clk,
    input d,
    input en,
    output reg q
);
    always@(posedge clk)
        begin
            if(en)
                q <= d;
            else
                q <= q;
        end
endmodule

module shift8(
    input clk,
    input enable,
    input in,
    output [7:0] q
);
    DF D0(.clk(clk), .en(enable), .d(in),   .q(q[0]));
    DF D1(.clk(clk), .en(enable), .d(q[0]), .q(q[1]));
    DF D2(.clk(clk), .en(enable), .d(q[1]), .q(q[2]));
    DF D3(.clk(clk), .en(enable), .d(q[2]), .q(q[3]));
    DF D4(.clk(clk), .en(enable), .d(q[3]), .q(q[4]));
    DF D5(.clk(clk), .en(enable), .d(q[4]), .q(q[5]));
    DF D6(.clk(clk), .en(enable), .d(q[5]), .q(q[6]));
    DF D7(.clk(clk), .en(enable), .d(q[6]), .q(q[7]));
endmodule

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z
); 
    wire [7:0] mem;
    shift8 shft(.clk(clk), .enable(enable), .in(S), .q(mem));
    assign Z = mem[{A, B, C}];

endmodule
