`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 11:36:50
// Design Name: 
// Module Name: ncoun
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


module ncoun();
//    assign N = 4;
    logic clk, reset;
    logic [4:0] counter;
    
    contadorN #(.N(5)) DUT(
        .clk(clk),
        .reset(reset),
        .count(counter)
        );
        
    always #2 clk = ~clk;  
    initial begin 
        clk = 1;
        reset = 1;
        #10 reset =0;
        
    end
endmodule
