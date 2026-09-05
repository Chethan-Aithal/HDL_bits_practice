/*
 * Problem Name: Fsm2s
 * Date: 9/5/2026, 12:28:39 PM
 * 
 * Problem Statement:
 * Implement a synchronous reset JK-like Moore state machine with two states (OFF, ON).
 */

module top_module(
    input clk,
    input reset,   
    input j,
    input k,
    output out
);

    parameter OFF = 0, ON = 1; 
    reg state, next_state;

    always @(*) begin
        case(state)
            OFF: begin
                if(j == 1'b1)
                    next_state = ON;
                else
                    next_state = OFF;
            end
            
            ON: begin
                if(k == 1'b1)
                    next_state = OFF;
                else
                    next_state = ON;
            end
            
            default: next_state = OFF;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            state <= OFF;
        else
            state <= next_state;
    end

    assign out = (state == ON);

endmodule
