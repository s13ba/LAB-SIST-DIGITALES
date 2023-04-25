`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2023 20:00:30
// Design Name: 
// Module Name: test_multemp
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


module test_multemp();
    logic clk_in;
    logic [3:0]dec;
    logic [6:0]sevenseg;
    logic reset;
    logic resetb;
    MultTemp DUT(
        .clk_in(clk_in),
        .dec(dec),
        .sevenseg(sevenseg),
        .reset(reset),
        .resetb(resetb));
        
  always #10 clk_in=~clk_in;
  
  initial begin 
    clk_in=0;
    reset=1;
    resetb=1;
    #10
    reset=0;
    #40000000
    resetb=0;
    
    
    end      
    endmodule
