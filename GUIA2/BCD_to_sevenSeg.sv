`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2023 23:34:40
// Design Name: 
// Module Name: BCD_to_sevenSeg
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
NOMBRE DEL MODULO: BCD TO SEVENSEG
FECHA DE CREACION:07-04-2023
FECHA DE MODIFICACION: 
FUNCION: TOMA COMO ENTRADA NUMEROS EN BASE BCD8421 Y PERMITE INDICAR CUALES SON LOS SEGMENTOS NECESARIOS PARA ENCENDER EL DISPLAY
*/

module BCD_to_sevenSeg(
    input logic [3:0] BCD_in, //ENTRADA EN BASE BCD8421
    output logic [6:0] sevenSeg //OUT SEGMENTOS QUE SE ENCEDERAN 
    );
    
    always_comb begin 
        case(BCD_in)
            4'd0: sevenSeg = 7'b1111110; // si la entrada es 0 en bcd la salida  será abcdef
            4'd1: sevenSeg = 7'b0110000; // bc
            4'd2: sevenSeg = 7'b1101101; // abdeg
            4'd3: sevenSeg = 7'b1111001; // abcdg
            4'd4: sevenSeg = 7'b0110011; // bcfg
            4'd5: sevenSeg = 7'b1011011; // acdfg
            4'd6: sevenSeg = 7'b1011111; // acdefg
            4'd7: sevenSeg = 7'b1110000; // abc
            4'd8: sevenSeg = 7'b1111111; // abcdefg
            4'd9: sevenSeg = 7'b1111011; // abcdfg
                default sevenSeg = 7'b1111111;
            endcase
    end
endmodule
        
          


