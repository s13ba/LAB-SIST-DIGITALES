`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 15:59:30
// Design Name: 
// Module Name: test_decoder
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


module test_decoder();
    logic [1:0]in;
    logic [3:0]out;
    
    
    decoder DUT(
        .in(in),
        .out(out));
    
   initial begin
   in = 2'b00;
   #5
   in = 2'b01;
   #5
   in = 2'b10;
   #5
   in = 2'b11;
   end
endmodule
