
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

module hexa_to_sevenseg(
    input logic [3:0] hexa, //hexagesimal
    output logic [6:0] segments //OUT SEGMENTOS QUE SE ENCEDERAN 
    );
    
    always_comb begin 
        case(hexa)
            4'd0: segments =~7'b1111110; // si la entrada es 0 en bcd la salida  será abcdef
            4'd1: segments =~7'b0110000; // bc
            4'd2: segments =~7'b1101101; // abdeg
            4'd3: segments =~7'b1111001; // abcdg
            4'd4: segments =~7'b0110011; // bcfg
            4'd5: segments =~7'b1011011; // acdfg
            4'd6: segments =~7'b1011111; // acdefg
            4'd7: segments =~7'b1110000; // abc
            4'd8: segments =~7'b1111111; // abcdefg
            4'd9: segments =~7'b1111011; // abcdfg
            4'ha: segments =~7'b1110111;
            4'hb: segments =~7'b0011111;
            4'hc: segments =~7'b1001110;
            4'hd: segments =~7'b0111101;
            4'he: segments =~7'b1101111;
            4'hf: segments =~7'b1000111;
                default segments = ~7'b1111110;
            endcase
    end
endmodule
        
          


