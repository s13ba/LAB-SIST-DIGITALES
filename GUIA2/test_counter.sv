`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 16:21:09
// Design Name: 
// Module Name: test_counter
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
NOMBRE DEL MODULO: test counter 4bit
FECHA DE CREACION:07-04-2023
FECHA DE MODIFICACION: 
FUNCION: test contador de bits (4bit)
*/

module test_counter();
    logic clk, reset;
    logic [3:0] count;
    
    counter_4bit DUT(
        .clk(clk),
        .reset(reset),
        .count(count)
        );
     
    always #5 clk = ~clk; // generacion de la señal de reloj
    
    initial begin 
        clk = 0;
        reset = 1;
        #10 reset =0;
    end
endmodule 
