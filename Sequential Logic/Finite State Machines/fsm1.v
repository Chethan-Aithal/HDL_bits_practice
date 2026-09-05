/*
 * Problem Name: Fsm1
 * Date: 9/4/2026, 11:43:28 PM
 * 
 * Problem Statement:
 * Implement an asynchronous reset Moore state machine with two states.
 */

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out
);  

    parameter A = 0, B = 1; 
    reg state, next_state;

    always @(*) begin 
        next_state = B;
        case(state)
            B: begin
                if(in == 1)
                    next_state = B;
                else
                    next_state = A;
            end
            
            A: begin
                if(in == 1)
                    next_state = A;
                else
                    next_state = B;
            end
            
            default: next_state = B;
        endcase                                    
    end

    always @(posedge clk, posedge areset) begin   
        if(areset)
            state <= B;
        else
            state <= next_state;
    end
    
    assign out = (state == B);

endmodule
