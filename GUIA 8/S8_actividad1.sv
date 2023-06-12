`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2023 16:15:12
// Design Name: 
// Module Name: S8_actividad2
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
module S8_actividad1#(parameter N_DEBOUNCER = 10)
    (input logic clk, resetN,Enter,Undo,
    input logic [15:0]DataIn,
    
    output logic[6:0]Segments,
    output logic[7:0]Anodes,
    output logic[4:0]Flags,
    output logic[2:0]Status);
  
  logic reset;
  assign reset=~resetN;
  
   S7_actividad3 #(.N_DEBOUNCER(N_DEBOUNCER)) Calculadora(
   .clk(clk),
   .reset(reset),
   .Enter(Enter),
   .Undo(Undo),
   .DataIn(DataIn),
   .Anodes(Anodes),
   .Segments(Segments),
   .Flags(Flags),
   .Status(Status));
endmodule