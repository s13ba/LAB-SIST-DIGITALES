`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2023 14:49:41
// Design Name: 
// Module Name: S7_actividad2
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

module S7_actividad2 #(parameter N_DEBOUNCER=10)(
    input logic clk,
    input logic reset,
    input logic Enter, Undo,
    input logic[15:0]DataIn,
    
    output logic[15:0]ToDisplay, //valor de salida para el Display
    output logic[4:0]Flags,  // V C Z N P
    output logic[2:0]Status);
    
    logic EnterPulse; // se crea esta variable intermedia para la salida del level to pulse
    logic UndoPulse; // para el pulso del undo
    
PB_Debouncer_FSM #(.DELAY(N_DEBOUNCER))PB_Debouncer_Enter( //modulo para el detector de pulzación 
    .clk(clk),
    .reset(reset),
    .PB(Enter),
    .PB_pressed_pulse(EnterPulse));    
  
PB_Debouncer_FSM #(.DELAY(N_DEBOUNCER))PB_Debouncer_Undo( //modulo para el detector de pulzación 
    .clk(clk),
    .reset(reset),
    .PB(Undo),
    .PB_pressed_pulse(UndoPulse));
    
logic updateRes, ToDisplaySel, LoadOpA, LoadOpB, LoadOpCode; // se crean variables intermedias para las salidad de la maquina de estados
Rev_pol_undo Rev_pol_undo( // maquina de estado que describe como se caragaran los datos a la ALU
    .clk(clk),
    .reset(reset), 
    .EnterPulse(EnterPulse),
    .UndoPulse(UndoPulse),
    .Status(Status),
    .LoadOpA(LoadOpA),
    .LoadOpB(LoadOpB),
    .LoadOpCode(LoadOpCode),
    .updateRes(updateRes),
    .ToDisplaySel(ToDisplaySel));

logic [15:0]OpA,OpB;
logic [1:0]OpCode; // variables intermedias para la salida de los registros previos a la ALU
register_Nbits opa_reg(
    .data_in(DataIn),
    .reset(reset),
    .load(LoadOpA),
    .clock(clk),
    .Q(OpA));

register_Nbits opb_reg(
    .data_in(DataIn),
    .reset(reset),
    .load(LoadOpB),
    .clock(clk),
    .Q(OpB));

register_Nbits #(.N(2)) opcode_reg(
    .data_in(DataIn),
    .reset(reset),
    .load(LoadOpCode),
    .clock(clk),
    .Q(OpCode));
    
logic [15:0]Result_alu;
logic[4:0]Flag_alu; // variable para salida de la ALU         
ALU #(.M(16)) ALU(
    .A(OpA),
    .B(OpB),
    .OpCode(OpCode),
    .Result(Result_alu),
    .Flags(Flag_alu));

logic [15:0]Result; // variable para salida del reg de la salida de la ALU
register_Nbits #(.N(5)) flag_reg(
    .data_in(Flag_alu),
    .reset(reset),
    .load(updateRes),
    .clock(clk),
    .Q(Flags));
    
register_Nbits res_reg(
    .data_in(Result_alu),
    .reset(reset),
    .load(updateRes),
    .clock(clk),
    .Q(Result));

always_comb begin
    if (ToDisplaySel)
        ToDisplay = Result;
    else 
        ToDisplay = DataIn;
end
    endmodule
