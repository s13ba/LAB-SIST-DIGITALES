`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2023 22:13:05
// Design Name: 
// Module Name: prueba_registros
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


module prueba_registros();
    logic D, clock, reset, enable, load, shiftout,Q;
    
    register DUT1(
        .D(D),
        .clock(clock),
        .reset(reset),
        .load(load),
        .Q(Q));
        
    registro_de_desplazamiento DUT2(     
        .D(D),
        .clock(clock),
        .reset(reset),
        .enable(enable),
        .Q(shiftout));
        
 always#10 clock=~clock;
 
    initial begin
        clock = 0;
        reset = 1;
        D = 1'b1;
        
    #20
        load =1;
        enable=1;
        reset = 0;
        D = 1'b0;
   #20
        D = 1'b1; 
   #20
        D = 1'b0;  
   #40
        D = 1'b1;            
  end      
endmodule
