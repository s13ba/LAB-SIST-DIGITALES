`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 21:15:17
// Design Name: 
// Module Name: test_simple
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
NOMBRE MODULO: test_simple
FECHA DE CREACIÓN: 30-3-2023
FECHA DE MODIFICACIÓN:
FUNCION: realiza pruebas para el modulo fib_rec
*/
module test_simple();   //creación del modulo dummy
    logic [3:0] BCD_in; //definicion de conexiones virtuales
    logic fib;
    
    fib_rec DUT(        //instancia del modulo a testear
    .BCD_in(BCD_in),
    .fib (fib));
    
    initial begin       //aca se asignan valores de prueba o estimulos
    BCD_in = 4'b0000;   //4'b0000 es equivalente a 4'd0
    #3                  // restardo de 3 undidades de tiempo basadas en timescale
    BCD_in = 4'b0001;
    #3
    BCD_in = 4'b0011;   //es equivalente a 4'd3
    #3
    BCD_in = 4'b0111;
   end
endmodule
