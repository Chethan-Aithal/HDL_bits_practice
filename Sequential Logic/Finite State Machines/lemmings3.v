/*
 * Problem Name: Lemmings3
 * Date: 9/18/2026
 * 
 * Problem Statement:
 * Implement a 6-state Moore FSM for Lemmings walking, falling, and digging.
 */

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);
    
    enum reg [2:0] {WL=3'b000, WR, FL, FR, LD, RD} state, next_state;
    // WL = walk left, WR = walk right
    // FL = fall left, FR = fall right
    // RD = right dig, LD = left dig
    
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= WL;
        else
            state <= next_state;
    end

    always @(*) begin
        case(state)
            WR: begin
                if(ground) begin
                    if(dig)
                        next_state = RD;
                    else begin
                        if(bump_right)
                            next_state = WL;
                        else
                            next_state = WR;
                    end
                end else
                    next_state = FR;
            end
            
            WL: begin
                if(ground) begin
                    if(dig)
                        next_state = LD;
                    else begin
                        if(bump_left)
                            next_state = WR;
                        else
                            next_state = WL;
                    end
                end else
                    next_state = FL;
            end
            
            RD: begin
                next_state = (ground) ? RD : FR;
            end
            
            LD: begin
                next_state = (ground) ? LD : FL;
            end
            
            FR: begin
                if(!ground)
                    next_state = FR;
                else
                    next_state = WR;
            end
            
            FL: begin
                if(!ground)
                    next_state = FL;
                else
                    next_state = WL;
            end
            
            default: next_state = WL;
        endcase
    end
    
    assign walk_left = (state == WL);
    assign walk_right = (state == WR);
    assign aaah = (state == FR || state == FL);
    assign digging = (state == LD || state == RD);

endmodule
