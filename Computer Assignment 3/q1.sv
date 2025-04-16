module ALU (
    input signed [15:0] inM,
    input signed [15:0] inN,
    input inC,
    input [2:0] opc,
    output reg signed [15:0] outF,
    output reg zer,
    output reg neg
);

always @(inM, inN, inC, opc) begin
    case(opc)
        3'b000: outF = inM + inN + inC;
        3'b001: outF = inM + (inN >> 1);
        3'b010: outF = (inM > inN) ? inM : inN;
        3'b011: outF = inM * 3;
        3'b100: outF = inM & inN;
        3'b101: outF = inM | inN;
        3'b110: outF = ~inM;
        3'b111: outF = 16'bz;
        default: outF = 16'b0;
    endcase

    zer = (outF == 16'b0) ? 1 : 0;
    neg = (outF < 0) ? 1 : 0;
end

endmodule
