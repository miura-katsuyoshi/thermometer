module thermometer #(
    parameter int WIDTH = 4
) (
    input [WIDTH-1:0] in,
    output [2**WIDTH-2:0] out
);

    generate
        genvar i;
        for(i=0; i<2**WIDTH-1; i++) begin: gen_thermometer
            assign out[i] = (in > i);
        end
    endgenerate

endmodule
