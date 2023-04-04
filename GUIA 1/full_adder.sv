`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 23:41:20
// Design Name: 
// Module Name: full_adder
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
NOMBRE MODULO: full_adder
FECHA DE CREACIÓN: 30-3-2023
FECHA DE MODIFICACIÓN:
FUNCION: sumador de 2 bits
*/

    
module full_adder(
   input logic [1:0] A,B,C_in, //entradas de 2 bits
   output logic [1:0] S, C_out //salidas de 2 bits
    );
   
   always_comb begin 
   case(A || B || C_in)
   S = A + B +C_in;
    endcase
    end
endmodule
