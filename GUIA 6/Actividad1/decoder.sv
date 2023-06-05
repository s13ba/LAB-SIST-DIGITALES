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
      2'b00 : anodes = 8'b11111110;        
      2'b01 : anodes = 8'b11111101;
      2'b10 : anodes = 8'b11111011; 
      2'b11 : anodes = 8'b11110111;
            default: anodes = 8'b11111111;     
    endcase  
    end 
endmodule
