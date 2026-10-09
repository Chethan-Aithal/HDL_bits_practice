/*
 * Problem Name: Fsm ps2
 * Date: 10/9/2026, 8:38:35 PM
 * 
 * Problem Statement:
 * Implement a PS/2 mouse protocol packet byte parser FSM.
 */

module top_module (
    input clk,
    input [7:0] in,
    input reset,
    output done
);

    typedef enum bit [1:0] {
        B1   = 2'b00,
        B2   = 2'b01,
        B3   = 2'b10,
        DONE = 2'b11
    } state_t;

    state_t current_state, next_state;

    always_comb begin
        case (current_state)
            B1:      next_state = in[3] ? B2 : B1;
            B2:      next_state = B3;
            B3:      next_state = DONE;
            DONE:    next_state = in[3] ? B2 : B1;
            default: next_state = B1;
        endcase
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            current_state <= B1;
        end else begin
            current_state <= next_state;
        end
    end

    assign done = (current_state == DONE);

endmodule
