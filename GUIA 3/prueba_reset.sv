`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 14:02:59
// Design Name: 
// Module Name: prueba_reset
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

module prueba_reset();
 logic reset, clk, data_in;
 logic data_out;
 
 reset_asincrono DUT(
    .reset(reset),
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out));
    
    always #5 clk=~clk;
    initial begin
    clk =1;
    data_in = 1;
    reset = 1;
    #3
    reset = 0;
    #20 reset = 1;
        
    end
endmodule
