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
FUNCION: A partir de una señal de entrada de base hexagecimal se describe el proceso para mostrar dicho numero en el display
para ello es necesario ocupar 1contador, 2mux, 1decoder y bloque que indique entregue como salida cuales seran los segmentos que se deberan encender  
*/                                                                                                                                 
module driver_HEX_to7seg (
    input logic [15:0] HEX_in, //señal de entrada hexagecimal
    input logic clock, 
    input logic reset,
    output logic [6:0]segments, //señal de salida que indica cuales serán los segmentos que se encederán
    output logic [7:0]anodes // señal que indica cual será el display que se debe encender
    );
    
    logic [1:0]count; //señal de salida del ocntador que servira de selector para 1 mux  y el deocder
    logic [3:0]hexa; // se crea esta señal interna que será para idenfitificar la salida del mux que luego ira al bloque q indicará cuales serán los segmentos a encender
    logic [3:0]hexa_final;//creada para podere utilizar el reset y q si el reset está en alto se tenga como salida un 0 
    always_comb begin
    if (reset)
        hexa_final = 4'd0;
    else 
        hexa_final = hexa; 
    end   
    
    
    contadorN #(.N(2)) counter(
        .clock(clock),
        .reset(reset),
        .count(count));
            
   always_comb begin //MUX para seleccionar los 4 bits que representaran un numero que luego se mostrara en el display
        case (count)
            3'd0 : hexa = HEX_in[3:0];
            3'd1 : hexa = HEX_in[7:4];
            3'd2 : hexa = HEX_in[11:8];
            3'd3 : hexa = HEX_in[15:12];
           
        default hexa = 4'd0;
        endcase
   end
   
   hexa_to_sevenseg hexa_to_sevenseg ( //llamada al modulo que entrega como salida cuales seran los 7 segmentos
        .hexa(hexa_final),
        .segments(segments));
        
   decoder #(.n(2)) decoder(
        .count(count),
        .anodes(anodes));
        
                                   
endmodule
