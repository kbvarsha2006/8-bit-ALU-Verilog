`timescale 1ns/1ps

module tb_alu;

reg [7:0] A, B;
reg [2:0] Sel;
wire [7:0] Result;
wire CarryOut, Zero;

integer passed = 0;
integer failed = 0;

alu uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result),
    .CarryOut(CarryOut),
    .Zero(Zero)
);

task run_test;
    input [7:0] ta, tb;
    input [2:0] ts;
    input [7:0] expected_result;
    input expected_carry, expected_zero;

    begin
        A = ta;
        B = tb;
        Sel = ts;
        #10;

        if (Result === expected_result &&
            CarryOut === expected_carry &&
            Zero === expected_zero) begin
            $display("PASS: Sel=%b A=%d B=%d Result=%d",
                     Sel, A, B, Result);
            passed = passed + 1;
        end
        else begin
            $display("FAIL: Sel=%b A=%d B=%d Result=%d Expected=%d",
                     Sel, A, B, Result, expected_result);
            failed = failed + 1;
        end
    end
endtask

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

    run_test(15, 10, 3'b000, 25,  0, 0);
    run_test(255, 1, 3'b000, 0,   1, 1);
    run_test(20, 5, 3'b001, 15,   0, 0);
    run_test(5, 10, 3'b001, 251,  1, 0);
    run_test(204, 170, 3'b010, 136, 0, 0);
    run_test(204, 170, 3'b011, 238, 0, 0);
    run_test(204, 170, 3'b100, 102, 0, 0);
    run_test(0, 0, 3'b000, 0,     0, 1);
    run_test(42, 42, 3'b001, 0,   0, 1);
    run_test(5, 10, 3'b101, 0,    0, 1);

    $display("--------------------------------");
    $display("TOTAL PASSED: %0d", passed);
    $display("TOTAL FAILED: %0d", failed);
    $display("--------------------------------");

    if (failed == 0)
        $display("ALU VERIFICATION SUCCESSFUL");
    else
        $display("ALU VERIFICATION FAILED");

    $finish;
end

endmodule
