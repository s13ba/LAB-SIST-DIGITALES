`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2023 23:02:06
// Design Name: 
// Module Name: ALU_REG
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


module ALU_REG #(parameter N = 16)(
    input logic [N-1:0]data_in, // señal de entrada de 15 bits
    input logic load_A, load_B, load_Op, updateRes, reset, clock, // señales de entrada load (para A,B,OP), updateRes para los registros de las salidas 
    output logic [6:0] segments, 
    output logic [7:0] anodes,
    output logic [4:0]LEDs    //inidcador de los flags
    );
    logic [N-1:0]A; // se cran las variables intermedias para los valores que tendran A, B y OpCode
    logic [N-1:0]B;
    logic [1:0]OpCode;
    
    register_Nbits REG_A(   //Registros de entrada 
        .data_in(data_in),
        .reset(reset),
        .load(load_A),
        .clock(clock),
        .Q(A));
   
    register_Nbits REG_B(
        .data_in(data_in),
        .reset(reset),
        .load(load_B),
        .clock(clock),
        .Q(B));
    
    register_Nbits #(.N(2))REG_OpCode( // registro de 2 bits para OpCode
        .data_in(data_in),
        .reset(reset),
        .load(load_Op),
        .clock(clock),
        .Q(OpCode));
        
    logic [N-1:0]Result; //variables intermedias para los valores de salida de la ALU       
    logic [4:0]Flags;
        
     ALU #(.M(16)) ALU(
        .A(A),
        .B(B),
        .OpCode(OpCode),   
        .Result(Result),
        .Flags(Flags));
        
    logic [N-1:0]reg_res;// variables intermedias para salidas de los registros de salida
    logic [4:0]reg_flag;   
      
    register_Nbits REG_Result( //Registros para las salidas de la ALU
        .data_in(Result),
        .reset(reset),
        .load(updateRes),
        .clock(clock),
        .Q(reg_res));
         
    register_Nbits REG_Flags(
        .data_in(Flags),
        .reset(reset),
        .load(updateRes),
        .clock(clock),
        .Q(reg_flags));
   
   assign LEDs = reg_flags;
   
   driver_HEX_to7seg driver(   //se toma la salida del registro de result q se utilizará como entrada al driver
        .HEX_in(reg_res),
        .clock(clock),
        .reset(reset),
        .segments(segments),
        .anodes(anodes));
              
    
endmodule
