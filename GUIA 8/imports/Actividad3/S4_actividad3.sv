`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2023 20:14:42
// Design Name: 
// Module Name: S4_actividad3
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
module ALU #(parameter M = 8)(
    input  logic [M-1:0]    A, B,
    input  logic [1:0]      OpCode,       
    output logic [M-1:0]    Result,
    output logic [4:0]      Flags
    );
    
  logic V; // creacion de concexiones que luego tendran el valor de los flaga
  logic C;
  logic Z;
  logic N;
  logic P;
  assign Flags = {V,C,Z,N,P} ;
  
  logic signoA; //se crean variables que permitan identificar el signo
  logic signoB;
  logic signoR;//signo resultado 
  assign signoA = A[M-1]; 
  assign signoB = B[M-1]; 
  assign signoR = Result[M-1];
  assign N = (signoR);// N entrega 1 si el resultado de la operacion es negativo
  
  // se describe la logica combinacional para las distinttas operaciones
  always_comb begin
    case (OpCode)
        2'b00: Result= (~(A|B));
        2'b01: Result= (~(A&B));
        2'b10: Result= A+B;
        2'b11: Result= A-B;
    endcase
    end
    always_comb begin
    if (Result==0) // se analiza que se cumpla la condicion para Z
        Z = 1;
    else 
        Z = 0;
    end
    
    always_comb begin
    // Se analiza que se cumpla C, donde para la suma si A+B produce un valor menor que A entonces hay un acarreo y en el caso de la resta el acarreo se produce si A-B es mayor que A. se ocupa or para verificar q se cumpla una u otra
    if(((OpCode==2'b10)&&(A+B<A))||(((OpCode==2'b11)&&(A-B>A))))  
        C=1;
    else
        C=0;
    end    
    
    always_comb begin     
    // se analiza el comportamiento para V    
    if ((OpCode==2'b10 && (signoA&&signoB) && signoR==0)||(OpCode==2'b10&& (~signoA&&~signoB)&& signoR==1)||(OpCode==2'b11 && ((signoA==1)&&(signoB==0))&& signoR==0) ||(OpCode==2'b11 && ((signoA==0)&&(signoB==1))&& signoR==1))    
    V=1;
    else
    V=0;
    end
    
   
    always_comb begin
    // se analiza si hay numero par de unos
    if (^Result == 0)
        P=1;
    else if(Result == 'b0)
        P=0;
    else 
        P=0;
    end
    
   
             
endmodule