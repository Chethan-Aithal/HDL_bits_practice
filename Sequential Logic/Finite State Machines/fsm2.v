/*
 * Problem Name: Fsm2
 * Date: 9/5/2026, 12:26:08 PM
 * 
 * Problem Statement:
 * Implement an asynchronous reset JK-like Moore state machine with two states (OFF, ON).
 */

module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
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

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= OFF;
        else
            state <= next_state;
    end

    assign out = (state == ON);

endmodule
