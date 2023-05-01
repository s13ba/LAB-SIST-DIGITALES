`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 16:31:54
// Design Name: 
// Module Name: S4_actividad2
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


module S4_actividad2 #(parameter N = 32)(
    input  logic            clock, reset,
    input  logic            dec, enable, load,
    input  logic [N-1:0]    Load_Ref_value,
    output logic [N-1:0]    counterN,
	output logic            threshold
    );
    
    logic [N-1:0]counter; // señal que se ocupará para generar la señal del contador
    
   always_ff @(posedge clock) begin //se indica que responde al canto positivo del clock
    if (reset)                      // si reset es 1 entonces el counter se va a 0      
      counter <= 'd0;
    else if (load)                  //si load es 1 entonces counter tomará el valor ingresado como Load_Ref_value
      counter <= Load_Ref_value;
    else if (enable)                //Si enable esta en 1 entonces se procede segun indique dec
      if (dec) 
        counter <= counter - 1; 
      else 
        counter <= counter + 1;
    else if(enable ==1'b0)          //si enable esta en 0 entonces se mantiene el ultimo valor del counter
      counter <= counter;
    end
  
   assign counterN=counter; 
   always_comb begin
    case (counterN)                 // si counterN es mayor que Load_Ref_value entonces threshold es 1
        counterN > Load_Ref_value : threshold = 1'b1;
        default threshold = 1'b0;
    endcase
   end
   
   
               
endmodule
