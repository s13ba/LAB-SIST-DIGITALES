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
FECHA DE MODIFICACIÓN:4-04-2023
FUNCION: sumador de 1 bits
*/

    
module full_adder(
   input logic  A,B,C_in, //entradas de 1 bits
   output logic S, C_out //salidas de 1 bits
    );
   
   always_comb begin 
   case(C_in)
   1'b0: {C_out,S} = A + B; //si cin es 0 suma a y b  
   1'b1: {C_out,S} = A + B + C_in; // si cin es 1 suma a, b y cin
    endcase
    end
endmodule
