`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 23:48:19
// Design Name: 
// Module Name: testbench_fibb
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
NOMBRE MODULO: testbench_fibb
FECHA DE CREACIÓN: 29-3-2023
FECHA DE MODIFICACIÓN: 
FUNCIÓN: realizar una simulacion para el modulo Nro_fibbinario
*/

module testbench_fibb();
    logic A,B,C,D;
    logic F;
    
    Nro_fibbinario DUT(
        .A(A),
        .B(B),  
        .C(C),
        .D(D),
        .F(F)
        );
        
    initial begin
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;
        D = 1'b0;
        #2
        B = 1'b1;
        #4 
        A = 1'b1;
        D = 1'b1;
        C = 1'b1;
        #6
        B = 1'b0;
        C = 1'b0;
        end

    
endmodule
