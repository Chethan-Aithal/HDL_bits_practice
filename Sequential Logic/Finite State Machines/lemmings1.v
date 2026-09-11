/*
 * Problem Name: Lemmings1
 * Date: 9/11/2026, 9:30:30 PM
 * 
 * Problem Statement:
 * Implement a simple 2-state Moore FSM for Lemmings walking left and right.
 */

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right
);

    parameter LEFT = 0, RIGHT = 1;
    reg state, next_state;

    always @(*) begin
        case(state)
            LEFT: begin
                if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            
            RIGHT: begin
                if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
