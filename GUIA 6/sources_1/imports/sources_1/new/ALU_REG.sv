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
/* EN EL INTERIOR DEL MODULO DRIVER QUE IDENTIFICA LOS 7SEG, SE MODIFICÓ EL CONTADOR A 2BITS DE MANERA QUE SOLO CUENTE HASTA 4, YA QUE SOLO 
SE OCUPARÁN LOS PRIMEROS 4 DISPLAYS, LUEGO TAMBIEN SE TUVO QUE MODIFICAR EL DECODER PARA FUNCIONAR SOLO CON 4 DISPLAYS.*/

/*TAMBIEN SE DEBIÓ AGREGAR UN CLOCK DIVIDER PARA CUMPLIR CON LA CONDICION DE ENCENDER 1 DISPLAY POR CADA 4 CICLOS DE RELOJ.
DICHO CLOCK DIVIDER ES EL DE LA GUIA 3 COMPARTIDO POR AULA*/

module S6_Actividad1 #(parameter N = 16)(
    input logic [N-1:0]data_in, // señal de entrada de 15 bits
    input logic load_A, load_B, load_Op, updateRes, reset, clk, // señales de entrada load (para A,B,OP), updateRes para los registros de las salidas 
    output logic [6:0] Segments, 
    output logic [7:0] Anodes,
    output logic [4:0]LEDs    //inidcador de los flags
    );
    logic [N-1:0]A; // se cran las variables intermedias para los valores que tendran A, B y OpCode
    logic [N-1:0]B;
    logic [1:0]OpCode;
    
        
       //Se añade el clock divider, que busca cumplir con lo esperado para la seleccion de los anodos
    clock_divider_2  #(.frec_base(100),.frec_salida(15)) clk_divider(
        .clk_in(clk),
        .reset(reset),
        .clk_out(clock));
        
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
        .segments(Segments),
        .anodes(Anodes));
        
   
        
                   
    
endmodule
