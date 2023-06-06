`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2023 18:44:26
// Design Name: 
// Module Name: S7_actividad3
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


module S7_actividad3(
    input logic clk,
    input logic reset,
    input logic Enter,Undo,
    input logic [15:0]DataIn,
    
    output logic [6:0]Segments,
    output logic [7:0]Anodes,
    output logic [4:0]Flags,
    output logic [2:0]Status);
    
    logic[31:0]ToDisplay;
    
S7_actividad2 S7_actividad2(
    .clk(clk),
    .reset(reset),
    .Enter(Enter),
    .Undo(Undo),
    .DataIn(DataIn),
    .Status(Status),
    .Flags(Flags),
    .ToDisplay(ToDisplay));
     
driver_HEX_to7seg driver_HEX_to7seg(
    .HEX_in(ToDisplay),
    .clock(clk),
    .reset(reset),
    .segments(Segments),
    .anodes(Anodes)); 
endmodule
