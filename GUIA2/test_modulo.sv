`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2023 13:45:23
// Design Name: 
// Module Name: test_modulo
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

module test_modulo();
    logic clk, reset;
    logic invfib;
    logic [6:0] invsevenSeg;
    logic ON;
  
    
    top_module DUT(
        .clk(clk),
        .reset(reset),
        .invfib(invfib),
        .invsevenSeg(invsevenSeg) 
    );
    
    always #5 clk =~ clk;
    
    initial begin //inicia clk
        assign ON = 1;
        clk = 1;
        reset = 1;
        #10 reset = 0;
    end
endmodule
