`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2023 23:09:19
// Design Name: 
// Module Name: register_Nbits
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


module register_Nbits #(parameter N =16)(
    input logic [N-1:0]data_in,
    input logic reset, load, clock,
    output logic [N-1:0]Q);
    always_ff@(posedge clock) begin
        if (reset)
            Q <= 1'b0;
        else if (load)
            Q <= data_in;
     end
   
endmodule
