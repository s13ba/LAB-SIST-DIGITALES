`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 15:14:26
// Design Name: 
// Module Name: decoder
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


module decoder #(parameter n=3)(
    input logic [n-1:0] count, 
    output logic [7:0]anodes
    
    );
 
    always_comb begin 
    case(count)                   
      3'd0 : anodes = 8'b11111110;        
      3'd1 : anodes = 8'b11111101;
      3'd2 : anodes = 8'b11111011; 
      3'd3 : anodes = 8'b11110111;
      3'd4 : anodes = 8'b11101111;        
      3'd5 : anodes = 8'b11011111;
      3'd6 : anodes = 8'b10111111; 
      3'd7 : anodes = 8'b01111111;
            default: anodes = 8'b11111111;     
    endcase  
    end 
endmodule
