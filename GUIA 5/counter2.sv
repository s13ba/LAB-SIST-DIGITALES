`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 15:41:06
// Design Name: 
// Module Name: counter2
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


module counter2#(parameter N=8)(
    input logic clock, reset,
    output logic [N-1:0]counter);
    
    logic [N-1:0] counter_next;
    
    always_comb begin
        counter_next = counter + 'd1;
    end
    
    always_ff@(posedge clock) begin 
    if (reset) 
        counter <= 'd0;
    else 
        counter <= counter_next;
    end
endmodule    

