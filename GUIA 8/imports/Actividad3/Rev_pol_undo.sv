`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2023 16:28:53
// Design Name: 
// Module Name: Rev_pol_undo
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


module Rev_pol_undo(
    input logic clk, reset, EnterPulse, UndoPulse,
    output logic [2:0]Status, 
    output logic LoadOpA, LoadOpB, LoadOpCode, updateRes, ToDisplaySel
    );
    
    enum logic[6:0]{Entering_OpA,Load_OpA,Load_OpB,Entering_OpB,Load_OpCode,Entering_OpCode,Show_Result} state,next_state;

always_ff @ (posedge clk) begin
    if (reset)
        state <= Entering_OpA;
    else
        state <= next_state;
end

always_comb begin
    next_state = state;
    case (state)
        Entering_OpA: begin
            if(EnterPulse)
                next_state = Load_OpA;
            else if(UndoPulse)
                next_state = Entering_OpA;
        end
        
        Load_OpA: next_state = Entering_OpB;
        
        Entering_OpB: begin
            if(EnterPulse)
                next_state = Load_OpB;
            else if (UndoPulse)
                next_state = Entering_OpA;
        end

        Load_OpB:next_state = Entering_OpCode;
        
        Entering_OpCode: begin
            if(EnterPulse)
                next_state = Load_OpCode;
            else if (UndoPulse)
                next_state = Entering_OpB;    
        end
        
        Load_OpCode: next_state = Show_Result;

        Show_Result: begin
                if(EnterPulse)
                    next_state = Entering_OpA;
                else if (UndoPulse)
                    next_state = Entering_OpCode;     
        end    
        default: next_state = Entering_OpA;
    endcase
end

always_comb begin
      case(state)
        Entering_OpA: begin
            Status = 3'd0;
            LoadOpA = 1'b0;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
        Load_OpA: begin
            Status = 3'd1;
            LoadOpA = 1'b1;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
        Entering_OpB: begin
            Status = 3'd2;
            LoadOpA = 1'b0;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
        Load_OpB: begin
            Status = 3'd3;
            LoadOpA = 1'b0;
            LoadOpB = 1'b1;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
        Entering_OpCode: begin
            Status = 3'd4;
            LoadOpA = 1'b0;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
        Load_OpCode: begin
            Status = 3'd5;
            LoadOpA = 1'b0;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b1;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
        Show_Result: begin
            Status = 3'd6;
            LoadOpA = 1'b0;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b1; 
            updateRes = 1'b1;
        end    
        default: begin
            Status = 3'd0;
            LoadOpA = 1'b0;
            LoadOpB = 1'b0;
            LoadOpCode = 1'b0;
            ToDisplaySel = 1'b0; 
            updateRes = 1'b0;
        end
    endcase   
end 
endmodule
