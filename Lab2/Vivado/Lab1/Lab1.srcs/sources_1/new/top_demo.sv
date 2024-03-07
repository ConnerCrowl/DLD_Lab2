`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
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


module top_demo
(
  // input
  input  logic [7:0] sw,
  input  logic [3:0] btn,
  input  logic       sysclk_125mhz,
  input  logic       rst,

  // output  
  output logic [7:0] led,
  output logic sseg_ca,
  output logic sseg_cb,
  output logic sseg_cc,
  output logic sseg_cd,
  output logic sseg_ce,
  output logic sseg_cf,
  output logic sseg_cg,
  output logic sseg_dp,
  output logic [3:0] sseg_an
);

  logic [16:0]  CURRENT_COUNT;
  logic [16:0]  NEXT_COUNT;
  logic         smol_clk;
  logic [63:0]  key;
  logic [63:0]  plaintext;
  logic         encrypt;
  logic [63:0]  ciphertext ;
  logic [63:0]  IV;
  logic         cbc;
  logic [15:0]  dispOut;
  
  assign key = 64'h133457799bbcdff1;
  assign plaintext = 64'h123456abcd132536;
  assign IV =  64'h0;
  assign encrypt = sw[7];
  assign cbc = sw[6];

  //Das Parity Bits, ya
  assign led[0] = key[7]^key[15]^key[23]^key[31]^key[39]^key[47]^key[55]^key[63]; //a-boum
  
  always_comb
     begin
    case(sw[3:0])
        4'b0000     :  dispOut = plaintext[63:48];
        4'b0001     :  dispOut = plaintext[47:32];
        4'b0010     :  dispOut = plaintext[31:16];
        4'b0011     :  dispOut = plaintext[15:0]; 
        4'b0100     :  dispOut = key[63:48];
        4'b0101     :  dispOut = key[47:32];
        4'b0110     :  dispOut = key[31:16];
        4'b0111     :  dispOut = key[15:0] ;
        4'b1000     :  dispOut = ciphertext[63:48];
        4'b1001     :  dispOut = ciphertext[47:32];
        4'b1010     :  dispOut = ciphertext[31:16];
        4'b1011     :  dispOut = ciphertext[15:0] ;
        4'b1100     :  dispOut = IV[63:48];
        4'b1101     :  dispOut = IV[47:32];
        4'b1110     :  dispOut = IV[31:16];
        4'b1111     :  dispOut = IV[15:0]; 
        default     :  dispOut = 64'h0;
    endcase
   end
  
  // Place DES instantiation here
   DES dut (key, plaintext, encrypt, ciphertext, IV, cbc);
  
  // 7-segment display
  segment_driver driver(
  .clk(smol_clk),
  .rst(btn[3]),
  .digit0(dispOut[3:0]),
  .digit1(dispOut[7:4]),
  .digit2(dispOut[11:8]),
  .digit3(dispOut[15:12]),
  .decimals({1'b0, btn[2:0]}),
  .segment_cathodes({sseg_dp, sseg_cg, sseg_cf, sseg_ce, sseg_cd, sseg_cc, sseg_cb, sseg_ca}),
  .digit_anodes(sseg_an)
  );

// Register logic storing clock counts
  always@(posedge sysclk_125mhz)
  begin
    if(btn[3])
      CURRENT_COUNT = 17'h00000;
    else
      CURRENT_COUNT = NEXT_COUNT;
  end
  
  // Increment logic
  assign NEXT_COUNT = CURRENT_COUNT == 17'd100000 ? 17'h00000 : CURRENT_COUNT + 1;

  // Creation of smaller clock signal from counters
  assign smol_clk = CURRENT_COUNT == 17'd100000 ? 1'b1 : 1'b0;

endmodule
