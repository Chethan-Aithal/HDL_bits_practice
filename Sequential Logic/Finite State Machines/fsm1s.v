/*
 * Problem Name: Fsm1s
 * Date: 9/5/2026, 12:19:55 PM
 * 
 * Problem Statement:
 * Implement a synchronous reset Moore state machine with two states.
 */

module top_module(clk, reset, in, out);
    input clk;
    input reset;    
    input in;
    output out;  
    reg out;  
    parameter A = 1'b0, B = 1'b1;
    reg present_state, next_state;
    
    always @(posedge clk) begin
        if (reset) begin  
            present_state <= B;
            out <= 1'b1; 
        end else begin
            case (present_state)
                A: begin
                    if (in == 1'b1)
                        next_state = A;
                    else 
                        next_state = B;
                end
                
                B: begin
                    if (in == 1'b1)
                        next_state = B;
                    else 
                        next_state = A;
                end
                
                default: next_state = B;
            endcase
            
            present_state = next_state;   

            case (present_state)
                A:       out = 1'b0;
                B:       out = 1'b1;
                default: out = 1'b1;
            endcase
        end
    end

endmodule
