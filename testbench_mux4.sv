`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 22:51:13
// Design Name: 
// Module Name: testbench_mux4
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
NOMBRE MODULO: testbench_mux4
FECHA DE CREACIÓN: 30-3-2023
FECHA DE MODIFICACIÓN:
FUNCION: pruebas para multiplexor 4:1 con entradas de 4 bits
*/
module testbench_mux4();
    logic [3:0] A,B,C,D,out; // establezco las señales 
    logic [1:0] sel;
    
    mux4_1 DUT(     //instancio el modulo 
        .A(A),
        .B(B),
        .C(C),
        .D(D),  
        .out(out),
        .sel(sel)
        );
        
   initial begin
   A = 4'd1; //defino los valores de A, B, C y D 
   B = 4'd2;
   C = 4'd3;
   D = 4'd4;
  
   sel = 2'b00; //Cambio el valor del selector para ver los distintos valores de out
   #3
   sel = 2'b01;
   #3
   sel = 2'b10;
   #3
   sel = 2'b11;
   end
   endmodule
   
 
              
           


