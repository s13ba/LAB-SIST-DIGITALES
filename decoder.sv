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


module decoder #(parameter n=2)(
    input logic [n-1:0] in, 
    output logic [(2**n)-1:0]out
    
    );
 
    always_comb begin 
    case(in)                   
        2'b00 : out = 4'b1000;        
        2'b01 : out = 4'b0100;
        2'b10 : out = 4'b0010; 
        2'b11 : out = 4'b0001;  
    default: out = 4'b1111;     
    endcase  
    end 
endmodule
