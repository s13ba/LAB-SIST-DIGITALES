`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 22:30:03
// Design Name: 
// Module Name: Nro_fibbinario
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
NOMBRE MODULO: NUMEROS FIBBINARIOS
FECHA DE CREACIÓN: 29-3-2023
FECHA DE MODIFICACIÓN:
FUNCIÓN: IDENTIFICAR CUANDO UN NUMERO TIENE 2 1S CONCECUTIVOS, EN DICHO CASO ENTREGARA UN 0 COMO SALIDA
*/

module Nro_fibbinario(
    input logic A, B, C, D,
    output logic F
    );
    
    assign F = (!A && !C) || (!B && !C) || (!B && !D); 
endmodule    
    
   

