`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 15:21:37
// Design Name: 
// Module Name: counter1
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


module counter1#(parameter N=8)(
    input logic clock, reset,
    output logic [N-1:0]counter);
    
    always_ff@(posedge clock) begin
        if (reset) 
            counter <= 'd0;
        else
            counter <=counter + 'd1;
    end
endmodule
