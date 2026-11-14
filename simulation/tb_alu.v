`timescale 1ns/1ps

module tb_alu;

reg [7:0] A, B;
reg [2:0] Sel;
wire [7:0] Result;
wire CarryOut, Zero;

alu uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result),
    .CarryOut(CarryOut),
    .Zero(Zero)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

    $monitor("Time=%0t | Sel=%b | A=%d | B=%d | Result=%d | CarryOut=%b | Zero=%b",
             $time, Sel, A, B, Result, CarryOut, Zero);

    A=15; B=10; Sel=3'b000; #10;
    A=20; B=5; Sel=3'b001; #10;
    A=204; B=170; Sel=3'b010; #10;
    A=204; B=170; Sel=3'b011; #10;
    A=204; B=170; Sel=3'b100; #10;
    A=0; B=0; Sel=3'b000; #10;
    A=255; B=1; Sel=3'b000; #10;
    A=5; B=10; Sel=3'b001; #10;

    $display("All test cases completed.");
    $finish;
end

endmodule
