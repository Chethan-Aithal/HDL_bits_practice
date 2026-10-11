/*
 * Problem Name: Fsm serial
 * Date: 10/11/2026, 10:55:15 AM
 * 
 * Problem Statement:
 * Implement a serial receiver FSM with start bit, 8 data bits, and stop bit verification.
 */

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    enum bit[2:0] {idle=3'b000, start, data, stop, wait_stop} state, next_state;
    reg [2:0] count;
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next_state;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            count <= 3'b000;
        end else begin
            if (state == data) begin
                count <= count + 1'b1;
            end else begin
                count <= 3'b000; 
            end
        end
    end
    
    always@(*) begin
        case(state)
            idle: begin
                next_state = in ? idle : start;
            end
            
            start: begin
                next_state = data;
            end
            
            data: begin
                if (count == 3'd7) begin
                    if(in)
                        next_state = stop;
                    else
                        next_state = wait_stop;
                end else
                    next_state = data;
            end
            
            stop: begin
                next_state = (in) ? idle : start;
            end
            
            wait_stop: begin
                next_state = (in) ? idle : wait_stop;
            end
            
            default: next_state = idle;
        endcase
    end
                
    assign done = (state == stop);                   
endmodule
