`include "vunit_defines.svh"

`define CUT CUT

module thermometer%WIDTH%_tb;
    timeunit 1ns;
    timeprecision 1ps;

    parameter WIDTH = %WIDTH%;

    logic [WIDTH-1:0] in;
    logic [2**WIDTH-2:0] out;

    `TEST_SUITE begin

        `TEST_SUITE_SETUP begin
        end

        `TEST_CASE_SETUP begin
            in = 0;
        end

        `TEST_CASE("normal_operation_test") begin
            int i;

            for(i=0; i<(2**WIDTH); i++) begin
                in = i;
                #10;
                `CHECK_EQUAL(out, {(2**WIDTH-1){1'b1}}>>(2**WIDTH-1-i));
            end
        end

        `TEST_CASE_CLEANUP begin
        end

        `TEST_SUITE_CLEANUP begin
        end
    end;

    `WATCHDOG(1ms);

    thermometer #(
        .WIDTH(WIDTH)
    )
    `CUT (
        .in(in),
        .out(out)
    );

endmodule
