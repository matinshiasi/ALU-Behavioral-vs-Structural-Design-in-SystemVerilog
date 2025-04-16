`timescale 1ns / 1ns

module tb2;
 
  logic signed [15:0] inM, inN;
  logic inC;
  logic [2:0] opc;
  wire signed [15:0] outF;
  wire zer, neg;
 
  ALU_struct uut (
    .inM(inM),
    .inN(inN),
    .inC(inC),
    .opc(opc),
    .outF(outF),
    .zer(zer),
    .neg(neg)
  );
 
  initial begin
    $randomize;
   
    repeat(10) begin
      inM = $random;
      inN = $random;
      inC = $random % 2;
      opc = $random % 8;
     
      $display("Test case %0d:", $stime);
      $display("inM = %d, inN = %d, inC = %b, opc = %b", inM, inN, inC, opc);
      #100;
      $display("outF = %d, zer = %b, neg = %b", outF, zer, neg);
      #100;

    end
    $stop;
  end
 
endmodule
