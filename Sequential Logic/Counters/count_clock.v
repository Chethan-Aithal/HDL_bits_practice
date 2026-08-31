/*
 * Problem Name: Count clock (12-hour clock)
 * Date: 8/31/2026, 7:38:40 PM
 * 
 * Problem Statement:
 * Create a set of counters suitable for use as a 12-hour clock (with am/pm indicator).
 */

module counter_60(
    input clk,
    input enable,
    input reset,
    output reg [7:0] count
);
    always@(posedge clk)
        begin
            if(reset)
            begin
                count <= 8'h00;
            end
            else if(enable)
                begin
                    if(count[3:0] == 4'd9)
                        begin
                        count[3:0] <= 4'd0;
                            if(count[7:4] == 4'd5)
                                begin
                                    count[7:4] <= 4'd0;
                                end
                            else
                               begin
                                   count[7:4] <= count[7:4] + 1'b1;
                               end
                        end
                    else
                        count[3:0] <= count[3:0] + 1'b1;
                end
        end
endmodule

module counter_bcd(
    input clk,
    input reset,
    input enable,
    output reg [7:0] count
);
    always @(posedge clk) begin
        if (reset) begin
            count <= 8'h12; 
        end 
        else if (enable) begin
            if (count == 8'h12) begin
                count <= 8'h01; 
            end 
            else if (count[3:0] == 4'd9) begin
                count[3:0] <= 4'h0;             
                count[7:4] <= count[7:4] + 1'b1;
            end 
            else begin
                count[3:0] <= count[3:0] + 1'b1; 
            end
        end
    end
endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
); 
    wire enable[2:0];
    assign enable[0] = ena;
    assign enable[1] = ena && (ss == 8'h59);
    assign enable[2] = ena && (ss == 8'h59) && (mm == 8'h59);
    
    counter_60 count_ss(.clk(clk), .reset(reset), .enable(enable[0]), .count(ss));
    counter_60 count_mm(.clk(clk), .reset(reset), .enable(enable[1]), .count(mm));
    counter_bcd count_hh(.clk(clk), .reset(reset), .enable(enable[2]), .count(hh));
    
    always @(posedge clk) 
        begin
        if (reset) begin
            pm <= 1'b0; 
        end else if (enable[2] && (hh == 8'h11)) begin
            pm <= ~pm;  
        end
    end
endmodule
