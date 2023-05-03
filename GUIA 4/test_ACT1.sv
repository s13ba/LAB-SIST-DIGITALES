`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 02:46:40
// Design Name: 
// Module Name: test_ACT1
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


module test_ACT1();
    logic [31:0]HEX_in;
    logic clock;
    logic reset;
    
    logic [6:0]segments;
    logic [7:0]anodes;
    
    S4_actividad1 DUT(
        .HEX_in(HEX_in),
        .clock(clock),
        .reset(reset),
        .segments(segments),
        .anodes(anodes));
    
    always#10 clock = ~clock;
    
    initial begin 
        clock = 0;
        reset = 1;
       
        HEX_in = 32'h12345678;
        #15
        reset = 0;
        #500
        reset = 1;
        
        #30
        reset =0;
        
        #20
        reset =1;
        #20
        reset =0;
   end
endmodule
