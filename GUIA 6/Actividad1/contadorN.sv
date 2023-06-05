`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2023 17:33:21
// Design Name: 
// Module Name: contadorN
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


module contadorN #(parameter  N = 3)(
    input logic clock, reset,
    output logic [N-1:0]  count );        
     
     always_ff @ (posedge clock) begin 
        if (reset) 
         count <= 'b0;
        else
            count <= count+1;
   end   

endmodule
