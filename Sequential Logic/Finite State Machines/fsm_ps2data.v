/*
 * Problem Name: Fsm ps2data
 * Date: 10/9/2026, 10:22:53 PM
 * 
 * Problem Statement:
 * Implement a PS/2 packet parser and datapath that outputs the full 24-bit (3-byte) packet.
 */

module top_module(
    input clk,
    input [7:0] in,
    input reset,
    output [23:0] out_bytes,
    output done
);

    parameter B1   = 2'b00, 
              B2   = 2'b01, 
              B3   = 2'b10, 
              Done = 2'b11;

    reg [1:0] state, next_state;
    reg [23:0] out_bytes_reg;

    always @(posedge clk) begin
        if (reset) 
            state <= B1;
        else 
            state <= next_state;
    end

    always @(*) begin
        case (state)
            B1:   next_state = (in[3]) ? B2 : B1;
            B2:   next_state = B3;
            B3:   next_state = Done;
            Done: next_state = (in[3]) ? B2 : B1;
            default: next_state = B1;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            out_bytes_reg <= 24'b0;
        end else begin
            case (state)
                B1:   if (in[3]) out_bytes_reg[23:16] <= in;
                B2:   out_bytes_reg[15:8]  <= in;
                B3:   out_bytes_reg[7:0]   <= in;
                Done: if (in[3]) out_bytes_reg[23:16] <= in;
            endcase
        end
    end

    assign done = (state == Done);
    assign out_bytes = out_bytes_reg;

endmodule
