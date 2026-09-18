/*
 * Problem Name: Lemmings4
 * Date: 9/18/2026, 10:28:30 AM
 * 
 * Problem Statement:
 * Implement a Moore FSM for Lemmings with walking, falling, digging, and splattering (death after falling too long).
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
    
    enum reg [2:0] {WL=3'b000, WR, FL, FR, LD, RD, DEAD} state, next_state;
    reg [4:0] count;
    
    // State storage
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= WL;
        else
            state <= next_state;
    end
    
    // Death counter logic
    always @(posedge clk or posedge areset) begin
        if(areset)
            count <= 5'b0;
        else if(state == FL || state == FR) begin
            if(count <= 21) 
                count <= count + 1'b1;
        end else
            count <= 5'b0;
    end
    
    // Next-State Logic
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
                else begin
                    if(count > 19)
                        next_state = DEAD;
                    else
                        next_state = WR;
                end
            end
            
            FL: begin
                if(!ground)
                    next_state = FL;
                else begin
                    if(count > 19)
                        next_state = DEAD;
                    else
                        next_state = WL;
                end
            end
            
            DEAD: begin
                next_state = DEAD;
            end
            
            default: next_state = WL;
        endcase
    end
    
    assign walk_left = (state == WL) ? 1'b1 : 1'b0;
    assign walk_right = (state == WR) ? 1'b1 : 1'b0;
    assign aaah = (state == FR || state == FL) ? 1'b1 : 1'b0;
    assign digging = (state == LD || state == RD) ? 1'b1 : 1'b0;

endmodule
