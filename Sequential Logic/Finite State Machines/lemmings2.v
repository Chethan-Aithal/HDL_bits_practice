/*
 * Problem Name: Lemmings2
 * Date: 9/17/2026, 10:13:26 PM
 * 
 * Problem Statement:
 * Implement a 4-state Moore FSM for Lemmings walking and falling.
 */

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah
); 
    enum reg [1:0] {Walk_left=2'b00, Walk_right, fall_left, fall_right} state, next_state;
 
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                state <= Walk_left;
            else
                state <= next_state;
        end
    
    always@(*)
        begin
            case(state)
                Walk_left:
                    begin
                        if(ground)
                            next_state = (bump_left) ? Walk_right : Walk_left;
                        else
                            next_state = fall_left;
                    end
                
                Walk_right:
                    begin
                        if(ground)
                            next_state = (bump_right) ? Walk_left : Walk_right;
                        else
                            next_state = fall_right;
                    end
                
                fall_right:
                    begin
                        if(!ground)
                            next_state = fall_right;
                        else
                            next_state = Walk_right;
                    end
                
                fall_left:
                    begin
                        if(!ground)
                            next_state = fall_left;
                        else
                            next_state = Walk_left;
                    end
                
                default: next_state = Walk_left;
            endcase
        end
    
    assign walk_left = (state == Walk_left);
    assign walk_right = (state == 2'b01);
    assign aaah = (state == fall_right || state == fall_left);
                                
endmodule
