`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 13:34:32
// Design Name: 
// Module Name: reset_sincrono
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
/*
NOMBRE DEL MODULO: FF Con reset sincrono
FECHA DE CREACION:19-04-2023
FECHA DE MODIFICACION: 
FUNCION: FF Con reset sincrono
*/

module reset_sincrono(
    input logic clk, reset, data_in,
    output logic data_out
    );
    
    always_ff @(posedge clk) begin
    if(reset)
        data_out <= 'd0;
    else
        data_out <= data_in;
   end
endmodule


        
