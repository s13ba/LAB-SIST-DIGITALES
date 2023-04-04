`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 21:01:38
// Design Name: 
// Module Name: mod34
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
Nombre modulo: 3.4 combinacional simple
Fecha de creación:29-03-2023
Fecha de modificación:
Función: circuito basico de 3 entradas y 3 salidas
*/

module logica_simple(
    input logic A, B, C,
    output logic X, Y, Z
    );
    
    assign X = A; 
    assign Y = -A;  
    assign Z = B & C; 
endmodule
