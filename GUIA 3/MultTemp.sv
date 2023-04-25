`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2023 13:57:32
// Design Name: 
// Module Name: MultTemp
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
/*
NOMBRE DEL MODULO: Multiplexación Temporal
FECHA DE CREACION:24-04-2023
FECHA DE MODIFICACION: 
FUNCION: Se implementa un modulo que instancia a otros modulos para utilizar un contador de 16 bits que se irá mostrando en el display. Para ello se tendran que ocupar 2
divisores de frecuencia, un decoder, un mux y 2 contadores. 
 */
module MultTemp(
    input logic clk_in,
    output logic [3:0] dec,
    output logic [6:0] sevenseg,
    input logic reset, resetb
    
    );
//variables internas (cables) que necesitan ser declarados para indicar las entradas y salidas del modulo

logic clkL;
logic clkR;
logic [15:0]count16; //contador de 16 bits en base binaria
logic [1:0]count2;//contador de 2 bits que sirve como selector del mux y como entrada para el decoder
logic [3:0]count;//salida del mux que luego se lleva a sevenseg
    clock_divider_2#(.frec_base(100_000_000),.frec_salida(30))  clk_lento( //Este clock será para poder que se realice la cuenta de 16 bits de una manera mas lenta de modo de que sea posible ver los cambios en el display.
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clkL));
    
    clock_divider_2#(.frec_base(100_000_000),.frec_salida(120)) clk_rapido(//Este clock es para el decoder de manera de ir encendiendo los displays y que se puedan ver todos encendidos. (30Hz en cada display)
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clkR));
   
   contadorN#(.N(16)) counter16( //contador de bits realizado a partir del clock rapido para luego aliemtar el mux
        .clk(clkL),
        .reset(resetb),
        .count(count16)
        );

    contadorN #(.N(2)) counter2( //contador de bits realizado a partir del clock lento para luego alimentar el decoder
        .clk(clkR),
        .reset(resetb),
        .count(count2));

    always_comb begin
        case(count2)  //segun el contador de 2 bits se indacara cual será el calor en 7 segmentos que se iluminará
            2'd0 : count = count16[3:0];       
            2'd1 : count = count16[7:4];
            2'd2 : count = count16[11:8]; 
            2'd3 : count = count16[15:12]; 
        default: count = 4'd0;     
        endcase  
    end 
    
    HexaTo7seg aDisplays(
        .Hexa(count),
        .sevenSeg(sevenseg));
    
    decoder deco(
        .in(count2),
        .out(dec));
   
        
     
    

endmodule
