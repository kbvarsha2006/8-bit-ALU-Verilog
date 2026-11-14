module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] Sel,
    output reg [7:0] Result,
    output reg CarryOut,
    output Zero
);

always @(*) begin
    CarryOut = 0;
    Result = 0;

    case (Sel)
        3'b000: {CarryOut, Result} = A + B;
        3'b001: {CarryOut, Result} = {1'b0, A} - {1'b0, B};
        3'b010: Result = A & B;
        3'b011: Result = A | B;
        3'b100: Result = A ^ B;
        default: begin
            Result = 0;
            CarryOut = 0;
        end
    endcase
end

assign Zero = (Result == 8'b0);

endmodule
