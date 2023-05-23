`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2023 22:41:32
// Design Name: 
// Module Name: Pruebas de ALUs
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
/* Testbench para comparar el funcionamiento de la ALU de referencia con la ALU entregada en el guia 4*/

module Pruebas_de_ALUs();
    logic [7:0]A, B;
    logic [1:0]OpCode;
    logic [7:0]Result1, Result;
    logic [4:0]Flags1, Flags; 
    
    ALU_ref DUT1(
        .A(A),
        .B(B),
        .OpCode(OpCode),
        .Result(Result),
        .Flags(Flags));
        
    S4_actividad3 DUT2( 
        .A(A),
        .B(B),
        .OpCode(OpCode),
        .Result(Result1),
        .Flags(Flags1));
        
initial begin           
    A = 8'd2;
    B = 8'd4;
    OpCode = 2'b10;
 #20
     A = 8'd2;
    B = 8'd4;
    OpCode = 2'b11;
 #20
     A = 8'd3;
    B = 8'd6;
    OpCode = 2'b10;
 #20
     A = 8'd3;
    B = 8'd6;
    OpCode = 2'b11;
 #20
     A = 8'd8;
    B = 8'd3;
    OpCode = 2'b10;
 #20
     A = 8'd8;
    B = 8'd3;
    OpCode = 2'b11;
 #20
     A = 8'd1;
    B = 8'd0;
    OpCode = 2'b00;
 #20
     A = 8'd1;
    B = 8'd0;
    OpCode = 2'b01;
 end
 endmodule
