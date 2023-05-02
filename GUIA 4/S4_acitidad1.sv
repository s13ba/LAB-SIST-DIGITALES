`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2023 18:30:54
// Design Name: 
// Module Name: SA_actividad1
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
NOMBRE DEL MODULO: TOP MUDULE PARA ACTIVIDAD 1                                                                                                
FECHA DE CREACION:29-04-2023                                                                                                       
FECHA DE MODIFICACION:                                                                                                             
FUNCION: A partir de una se�al de entrada de base hexagecimal se describe el proceso para mostrar dicho numero en el display
para ello es necesario ocupar 1contador, 2mux, 1decoder y bloque que indique entregue como salida cuales seran los segmentos que se deberan encender  
*/                                                                                                                                 
module S4_actividad1(
    input logic [31:0] HEX_in, //se�al de entrada hexagecimal
    input logic clock, 
    input logic reset,// 1 reset para llevar todas las se�ales a 0 y otro para el contador
    output logic [6:0]segments, //se�al de salida que indica cuales ser�n los segmentos que se enceder�n
    output logic [7:0]anodes // se�al que indica cual ser� el display que se debe encender
    );
    
    logic [2:0]count; //se�al de salida del ocntador que servira de selector para 1 mux  y el deocder
    logic [3:0]hexa; // se crea esta se�al interna que ser� para idenfitificar la salida del mux que luego ira al bloque q indicar� cuales ser�n los segmentos a encender
    
    
    contadorN #(.N(3)) counter(
        .clock(clock),
        .reset(reset),
        .count(count));
            
   always_comb begin //MUX para seleccionar los 4 bits que representaran un numero que luego se mostrara en el display
        case (count)
            3'd0 : hexa = HEX_in[3:0];
            3'd1 : hexa = HEX_in[7:4];
            3'd2 : hexa = HEX_in[11:8];
            3'd3 : hexa = HEX_in[15:12];
            3'd4 : hexa = HEX_in[19:16];
            3'd5 : hexa = HEX_in[23:20];
            3'd6 : hexa = HEX_in[27:24];
            3'd7 : hexa = HEX_in[31:28];
        default hexa = 4'd0;
        endcase
   end
   
   hexa_to_sevenseg hexa_to_sevenseg ( //llamada al modulo que entrega como salida cuales seran los 7 segmentos
        .hexa(hexa),
        .segments(segments));
        
   decoder decoder(
        .count(count),
        .anodes(anodes));
        
                                   
endmodule
