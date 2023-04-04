`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 21:25:10
// Design Name: 
// Module Name: testbench_simple
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
NOMBRE MODULO: testbench_simple 
FECHA DE CREACIÓN:29-3-2023
FECHA DE MODIFICACIÓN:
FUNCIÓN:realizar una simulacion del modulo logica simple
*/
module testbench_simple(); // creación del modulo

    logic A, B, C;      //definicion de conexiones virtuales
    logic X, Y, Z;
    
    logica_simple DUT( //instancia el modulo a testear
        .A (A),
        .B (B),
        .C (C), 
        .X (X),
        .Y (Y), 
        .Z (Z) 
        );
        
        initial begin // se agregan valores de prueba o estimulos
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            #3      //retardo de 3 unidades de tiempo basadas en timescale
            A = 1'b1;
            #6
            B = 1'b1;
            #4
            C = 1'b1;
      end 
endmodule
            
            
           
    

    

