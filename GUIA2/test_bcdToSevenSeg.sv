`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 01:46:51
// Design Name: 
// Module Name: test_bcdToSevenSeg
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
NOMBRE DEL MODULO: test BCD TO SEVENSEG
FECHA DE CREACION:07-04-2023
FECHA DE MODIFICACION: 
FUNCION: 
*/

module test_bcdToSevenSeg();
        logic [3:0] BCD_in;
        logic [6:0] sevenSeg;
    BCD_to_sevenSeg DUT(
        .BCD_in(BCD_in),
        .sevenSeg(sevenSeg)
        
        );
        initial begin 
            BCD_in = 4'd1;
            #2
            BCD_in = 4'd2;
            #2
            BCD_in = 4'd3;
            #2
            BCD_in = 4'd4;
            #2
            BCD_in = 4'd5;
            #2
            BCD_in = 4'd6;
            #2
            BCD_in = 4'd7;
            #2
            BCD_in = 4'd8;
            #2
            BCD_in = 4'd9;
            #2
            BCD_in = 4'd0;
       end

endmodule
