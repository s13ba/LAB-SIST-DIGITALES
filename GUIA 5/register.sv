`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 17:24:24
// Design Name: 
// Module Name: register
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
/*registro simple de 1 bit con carga condicional y seganles rst y load sincronos*/
module register(
    input logic D, reset, load, clock,
    output logic Q);
    always_ff@(posedge clock) begin
        if (reset)
            Q <= 1'b0;
        else if (load)
            Q <= D;
     end
   
endmodule
