`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 17:42:30
// Design Name: 
// Module Name: registro de desplazamiento
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
/*registro de deslplazamiento de 1 bit de entrada y salida
con una linea de retardo*/

module registro_de_desplazamiento(
    input logic clock, D, enable, reset,
    output logic Q);
    
    logic [31:0] shift_reg;
    
    
    
    always_ff@(posedge clock) begin
        if (reset)begin 
            shift_reg <= 1'b0;
            end
        else if (enable)
            shift_reg <= {shift_reg[30:0], D};
        end
    assign Q = shift_reg[31];  
endmodule
