module thermometer #(
    parameter int WIDTH = 4
) (
    input [WIDTH-1:0] bin,
    output [2**WIDTH-2:0] thermometer
);

    generate
        genvar i;
        for(i=0; i<2**WIDTH-1; i++) begin: gen_thermometer
            assign thermometer[i] = (bin > i);
        end
    endgenerate

endmodule
