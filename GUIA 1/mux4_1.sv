`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 22:03:11
// Design Name: 
// Module Name: mux4_1
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
NOMBRE MODULO: mux4_1
FECHA DE CREACIÓN: 30-3-2023
FECHA DE MODIFICACIÓN:
FUNCION: multiplexor 4:1 con entradas de 4 bits
*/
module mux4_1(
    input logic [3:0] A,B,C,D,  //entradas de 4 bits
    input logic [1:0] sel,      //selector de 2 bits
    output logic [3:0] out      //salida de nombre out de 4
    );
    
    always_comb begin 
    case(sel)                   //sel será lo que se observará
        2'b00 : out = A;        //si sel es 00 entonces out es A
        2'b01 : out = B;
        2'b10 : out = C; 
        2'b11 : out = D;  
    default: out = 4'b1111;     //si nada de lo anterior se cumple entonces out es 1111
    endcase  
    end 
endmodule
