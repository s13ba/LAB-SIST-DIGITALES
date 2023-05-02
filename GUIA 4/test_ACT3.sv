`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2023 22:52:10
// Design Name: 
// Module Name: test_ACT3
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


module test_ACT3();
    logic [3:0]A;
    logic [3:0]B;  
    logic [1:0]OpCode;
    logic [3:0]Result;
    logic [4:0]Flags;
    
 S4_actividad3#(.M(3)) dut(
    .A(A),
    .B(B),
    .OpCode(OpCode),
    .Result(Result),
    .Flags(Flags));
    
    initial begin
    A = 8'd15;
    B = 8'd6;
    OpCode = 2'b10;
    
    
   end 
         

endmodule
