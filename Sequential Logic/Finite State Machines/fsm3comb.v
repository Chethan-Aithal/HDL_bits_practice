/*
 * Problem Name: Fsm3comb
 * Date: 9/5/2026, 7:27:29 PM
 * 
 * Problem Statement:
 * Implement state transition logic and output logic for a 4-state Moore FSM.
 */

module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output reg out
);

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    
    always @(*) begin
        case(state)
            A: begin
                if(in)
                    next_state = B;
                else
                    next_state = A;
            end
            
            B: begin
                if(in)
                    next_state = B;
                else
                    next_state = C;
            end
            
            C: begin
                if(in)
                    next_state = D;
                else
                    next_state = A;
            end
            
            D: begin
                if(in)
                    next_state = B;
                else
                    next_state = C;
            end
            
            default: next_state = A;
        endcase
    end
    
    always @(*) begin
        case (state)
            A, B, C: out = 1'b0;
            D:       out = 1'b1;
            default: out = 1'b0;
        endcase
    end

endmodule
