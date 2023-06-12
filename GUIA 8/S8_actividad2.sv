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


module S8_actividad2 #(parameter N_DEBOUNCER = 10)
    (input logic clk, resetN,Enter,Undo,DisplayFormat,
    input logic [15:0]DataIn,
    
    output logic[6:0]Segments,
    output logic[7:0]Anodes,
    output logic[4:0]Flags,
    output logic[2:0]Status);
    
    logic reset;
    assign reset = ~resetN;
    logic [15:0]ToDisplay; // variables creadas para poder hacer  padding entre la salida de la calculadora y la entrada al driver 7seg.
    logic [31:0]ToDisplay32;
    
    S7_actividad2 #(.N_DEBOUNCER(N_DEBOUNCER)) Calculadora(
        .clk(clk),
        .reset(reset),
        .Enter(Enter),
        .Undo(Undo),
        .DataIn(DataIn),
        .Status(Status),
        .Flags(Flags),
        .ToDisplay(ToDisplay));
        
    assign ToDisplay32 = {16'b0,ToDisplay}; // Padding    
    logic [31:0]bcd;
    
    unsigned_to_bcd u32_to_bcd_inst ( 
	.clk(clk),                       
	.reset(reset),                    
	.trigger(1'b1),                  
	.in(ToDisplay32),                                              
	.bcd(bcd));                                
    
    logic[31:0]ToDriver;
       
    always_comb begin
        if (DisplayFormat) 
            ToDriver = bcd;
        else
            ToDriver = ToDisplay;
    end
    
    driver_HEX_to7seg driver_HEX_to7seg(
    .HEX_in(ToDriver),
    .clock(clk),
    .reset(reset),
    .segments(Segments),
    .anodes(Anodes));            
            
endmodule
