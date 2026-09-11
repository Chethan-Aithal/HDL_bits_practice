/*
 * Problem Name: Exams/ece241 2013 q4
 * Date: 9/11/2026, 7:53:46 PM
 * 
 * Problem Statement:
 * Design a Moore state machine for a water reservoir flow controller.
 */

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
);

    // State definitions using standard parameters
    parameter BELOW = 3'd0;
    parameter B_UP  = 3'd1;
    parameter B_DN  = 3'd2;
    parameter C_UP  = 3'd3;
    parameter C_DN  = 3'd4;
    parameter ABOVE = 3'd5;

    reg [2:0] state, next_state;

    // 1. Next State Combinational Logic
    always @(*) begin
        case (state)
            BELOW: begin
                if (s == 3'b001) next_state = B_UP;
                else             next_state = BELOW;
            end
            
            B_UP: begin
                if (s == 3'b011)      next_state = C_UP;
                else if (s == 3'b000) next_state = BELOW;
                else                  next_state = B_UP;
            end
            
            C_UP: begin
                if (s == 3'b111)      next_state = ABOVE;
                else if (s == 3'b001) next_state = B_DN;
                else                  next_state = C_UP;
            end
            
            ABOVE: begin
                if (s == 3'b011) next_state = C_DN;
                else             next_state = ABOVE;
            end
            
            C_DN: begin
                if (s == 3'b111)      next_state = ABOVE;
                else if (s == 3'b001) next_state = B_DN;
                else                  next_state = C_DN;
            end
            
            B_DN: begin
                if (s == 3'b011)      next_state = C_UP;
                else if (s == 3'b000) next_state = BELOW;
                else                  next_state = B_DN;
            end
            
            default: next_state = BELOW;
        endcase
    end

    // 2. State Memory Sequential Register (Synchronous Reset)
    always @(posedge clk) begin
        if (reset) begin
            state <= BELOW;
        end else begin
            state <= next_state;
        end
    end

    // 3. Moore Output Combinational Logic
    always @(*) begin
        case (state)
            BELOW: begin
                fr3 = 1'b1; fr2 = 1'b1; fr1 = 1'b1; dfr = 1'b1;
            end
            B_UP: begin
                fr3 = 1'b0; fr2 = 1'b1; fr1 = 1'b1; dfr = 1'b0;
            end
            B_DN: begin
                fr3 = 1'b0; fr2 = 1'b1; fr1 = 1'b1; dfr = 1'b1;
            end
            C_UP: begin
                fr3 = 1'b0; fr2 = 1'b0; fr1 = 1'b1; dfr = 1'b0;
            end
            C_DN: begin
                fr3 = 1'b0; fr2 = 1'b0; fr1 = 1'b1; dfr = 1'b1;
            end
            ABOVE: begin
                fr3 = 1'b0; fr2 = 1'b0; fr1 = 1'b0; dfr = 1'b0;
            end
            default: begin
                fr3 = 1'b1; fr2 = 1'b1; fr1 = 1'b1; dfr = 1'b1;
            end
        endcase
    end

endmodule
