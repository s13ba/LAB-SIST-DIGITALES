`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 23:24:28
// Design Name: 
// Module Name: mux5
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
NOMBRE MODULO: mux5
FECHA DE CREACIÓN: 30-3-2023
FECHA DE MODIFICACIÓN:
FUNCION: multiplexor 5:1 con entradas de 4 bits
*/
module mux5(
    input logic [3:0] A,B,C,D,E, //entradas de 4 bits
    input logic [3:0] sel,      //selector de 3 bits
    output logic [3:0] out      //salida de nombre out de 4 bits
    );
    
    always_comb begin 
    case(sel)                   //sel será lo que se observará
        3'd0 : out = A;        //si sel es 00 entonces out es A
        3'd1 : out = B;
        3'd2 : out = C; 
        3'd3 : out = D;
        3'd4 : out = E;         
    default: out = 4'd0;     //si nada de lo anterior se cumple entonces out es 1111
    endcase  
    end 
endmodule
