`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 20:47:42
// Design Name: 
// Module Name: fib_rec
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
NOMBRE MODULO: fib_rec
FECHA DE CREACIÓN: 30-3-2023
FECHA DE MODIFICACIÓN:
FUNCION: realiza lo  mismo del modulo nro_fibbinario, pero con la utilizacion de unbloque always
*/

module fib_rec(
    inout logic [3:0] BCD_in,  //bcd 8421 input
    output logic fib //High if input is fibbinary
    );
    
    always_comb begin 
        if(BCD_in==4'd0 || BCD_in==4'd1 || BCD_in==4'd2 || BCD_in==4'd4 ||
           BCD_in==4'd5 || BCD_in==4'd8 || BCD_in==4'd9 || BCD_in==4'd10)
           fib = 1;
        else 
            fib = 0;
    end
endmodule
