/*
 * Problem Name: Exams/m2014 q4j
 * Date: 7/23/2026, 12:06:18 AM
 * 
 * Problem Statement:
 * Create a 4-bit adder with carry out.
 */

module fa(x,y,c,s,ca);
    input x,y,c ;
    output s,ca;
    assign s=x^y^c;
    assign ca=(x&y|y&c|c&x);
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire[3:0] c;
    wire cin=1'b0;
    
    fa fa0(x[0],y[0],cin,sum[0],c[0]);
    fa fa1(x[1],y[1],c[0],sum[1],c[1]);
    fa fa2(x[2],y[2],c[1],sum[2],c[2]);
    fa fa3(x[3],y[3],c[2],sum[3],c[3]);
    assign sum[4]=c[3];   

endmodule
