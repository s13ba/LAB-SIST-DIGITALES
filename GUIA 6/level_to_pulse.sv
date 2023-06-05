`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2023 23:43:01
// Design Name: 
// Module Name: level_to_pulse
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


module level_to_pulse(
    input logic clk,reset,L, //se definen las entradas, es este caso L será el indicador de la transición entre estados
    output logic P //P indica el valor de salida según el estado en el que se encuentre
    );
    //se comienza con la codificación del estado
    enum logic [2:0]{s0,s1,s2}state,next_state;
    
    always_ff @(posedge clk) begin // se crea el FF para almacenar y dar secuencialidad
        if(reset)
            state <= s0;
        else
            state <= next_state;
        end
    
    always_comb begin // se crea la lógica para el estado siguiente
        case (state)
            s0: begin
                if (L)
                    next_state = s1;
                else
                    next_state = s0;
            end
            s1: begin
                if (L)
                    next_state = s2;
                else
                    next_state = s0;
            end
            s2: begin 
                if (L)
                    next_state = s2;
                else
                    next_state = s0;
            end
            default : next_state =s0;            
        endcase
    end    
    always_comb begin //se dsecribe la lógica de salida
        case(state)
            s0: P = 0;
            s1: P = 1;
            s2: P = 0;
        default:P = 0;
        endcase
    end                                                                                                                                
endmodule
