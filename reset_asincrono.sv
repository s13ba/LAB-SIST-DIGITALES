`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 13:51:00
// Design Name: 
// Module Name: reset_asincrono
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
NOMBRE DEL MODULO: FF Con reset asincrono
FECHA DE CREACION:19-04-2023
FECHA DE MODIFICACION: 
FUNCION: FF Con reset sincrono
*/

module reset_asincrono(
    input logic clk, reset, data_in,
    output logic data_out
    );
    
    always_ff @(posedge clk or reset) begin
    if(reset)
        data_out <= 'd0;
    else
        data_out <= data_in;
   end
endmodule
