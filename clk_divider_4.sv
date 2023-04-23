`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 01:32:29
// Design Name: 
// Module Name: clk_divider_4
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
NOMBRE DEL MODULO: clock divider 4
FECHA DE CREACION:22-04-2023
FECHA DE MODIFICACION: 
FUNCION: Mediante un contador se divide el clk original de manera de tener un nuevo clk a una frecuencia deseada.
Ahora se edita el clk divider anterior de manera de que el ususario ingrese una frecuecnia base de reloj y tambien la frecuencia que se espera tener 
a la salida*/
module frecuencias();
    logic clk_in;
    logic reset;
    logic clk_out_10M;
    logic clk_out_30M;
    logic clk_out_50M; 
    logic clk_out_1M;
    
    
    clock_divider_aula  #(.Frec_base(100),.Frec_deseada(10)) clock_10(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_10M)
        );
    
    clock_divider_aula  #(.Frec_base(100),.Frec_deseada(30)) clock_30(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_30M)
        );
    
    clock_divider_aula  #(.Frec_base(100),.Frec_deseada(50)) clock_50(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_50M)
        );
        
    clock_divider_aula  #(.Frec_base(100),.Frec_deseada(1)) clock_1(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_1M)
        );    
        
    always #5 clk_in=~clk_in;
    
    initial begin
    clk_in =1;
    reset = 1;
    
   #10 
   
    reset = 0;
    
    end
         
endmodule
