`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2023 00:18:30
// Design Name: 
// Module Name: semaforo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module semaforo(
    input logic clk,reset,TA,TB,
    output logic [2:0]LA,LB
    );
    
//se definen variables internas para los colores del semaforo
localparam yellow = 3'b001;
localparam red = 3'b010;
localparam green = 3'b100;

enum logic[3:0]{s0,s1,s2,s3}state,next_state;

always_ff @ (posedge clk) begin
    if (reset)
        state <= s0;
    else
        state <= next_state;
end

always_comb begin
    next_state = state;
    case (state)
        s0: begin
            if(~TA)
                next_state = s1;
        end
        s1: next_state = s2;
        s2: begin
            if(~TB)
                next_state = s3;
        end
        s3: next_state = s0;
        default: next_state = s0;
    endcase
end

always_comb begin
    LA = red;
    LB = red;
    
    case(state)
        s0: begin
            LA = green;
        end
        s1: begin
            LA = yellow;
        end
        s2: begin
            LB = green;
        end
        s3: begin
            LB = yellow;
        end
        default: begin
            LA = green;
        end
    endcase   
end                                                             
endmodule
