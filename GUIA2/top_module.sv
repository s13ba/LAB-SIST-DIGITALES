`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 18:23:56
// Design Name: 
// Module Name: top_module
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
NOMBRE DEL MODULO: top module
FECHA DE CREACION:07-04-2023
FECHA DE MODIFICACION: 
FUNCION: modulo que contiene sub-modulos, que permiten tomar la cuenta del counter y representarlo en el display*/

module top_module(
    input logic clk, reset, //entradas (van al counter) y señal de on.off
    output logic invfib,  // salidas (desde elBCD_to_sevenseg y del fibb_rec)
    output logic [6:0]invsevenSeg,
    output logic ON
    );
    //se necesita establecer variables internas que van desde un modulo a otro
    logic [3:0]count; //(salida del contador y entradas a fibb_rec y bcd to 7seg)
    logic fib;
    logic [6:0]sevenSeg;
    
    counter_4bit counter_4bit( //instanciamos el modulo del counter y se asignan las variables in-out
        .clk(clk),
        .reset(reset),
        .count(count));
    
    BCD_to_sevenSeg bcd_to_sevenseg( //instanciamos el modulo que toma numero bcd y lo convierte a la repesentacion de 7 seg
        .BCD_in(count),
        .sevenSeg(sevenSeg));
        
    fib_rec fib_rec( //instaciamos el modulo que toma el numero bcd y lo reconoce como un numerofibbinario
        .BCD_in(count),
        .fib(fib));
    
    always_comb begin
        invfib =~fib;
        invsevenSeg =~sevenSeg;
    end 
endmodule
