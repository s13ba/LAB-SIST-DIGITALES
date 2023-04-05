`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 23:20:24
// Design Name: 
// Module Name: test_fulladder
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
NOMBRE MODULO: test full_adder
FECHA DE CREACIÓN: 04-04-2023
FECHA DE MODIFICACIÓN:04-04-2023
FUNCION: sumador de 1 bits
*/

module test_fulladder();
    logic A, B, C_in; //entredas para la suma
    logic S, C_out; //salidas
    
    full_adder DUT( //modulo a testear
    .A(A),
    .B(B),
    .C_in(C_in),
    .S(S),
    .C_out(C_out)
    );
    
    initial begin 
    A = 1'b0;
    B = 1'b0;
    C_in = 1'b0;
    #3
    A = 1'b1;
    B = 1'b0;
    C_in = 1'b0;
    #5
    A = 1'b1;
    B = 1'b1;
    C_in = 1'b0;
    #7
    A = 1'b1;
    B = 1'b1;
    C_in = 1'b1;
    end        
endmodule
