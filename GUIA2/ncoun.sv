`timescale 1ns / 1ps



module ncoun();
//    assign N = 4;
    logic clk, reset;
    logic [4:0] counter;
    
    contadorN #(.N(3)) DUT(
        .clk(clk),
        .reset(reset),
        .count(counter)
        );
        
    always #2 clk = ~clk;  
    initial begin 
        clk = 1;
        reset = 1;
        #30 reset =0;
        
    end
endmodule
