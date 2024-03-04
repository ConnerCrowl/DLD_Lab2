/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;

	logic [27:0] left_block, right_block;
	logic [27:0] C1, D1;
	logic [27:0] C2, D2;
	logic [27:0] C3, D3;
	logic [27:0] C4, D4;
	logic [27:0] C5, D5;
	logic [27:0] C6, D6;
	logic [27:0] C7, D7;
	logic [27:0] C8, D8;
	logic [27:0] C9, D9;
	logic [27:0] C10, D10;
	logic [27:0] C11, D11;
	logic [27:0] C12, D12;
	logic [27:0] C13, D13;
	logic [27:0] C14, D14;
	logic [27:0] C15, D15;
	logic [27:0] C16, D16;

   PC1 x (Key, left_block, right_block);

   assign C1 = {left_block[26:0], left_block[27]};
   assign D1 = {right_block[26:0], right_block[27]};
   PC2 y1 (C1, D1, SubKey1);
   
   assign C2 = {C1[26:0], C1[27]};
   assign D2 = {D1[26:0], D1[27]};
   PC2 y2 (C2, D2, SubKey2);

   assign C3 = {C2[25:0], C2[27:26]};
   assign D3 = {D2[25:0], D2[27:26]};
   PC2 y3 (C3, D3, SubKey3);

   assign C4 = {C3[25:0], C3[27:26]};
   assign D4 = {D3[25:0], D3[27:26]};
   PC2 y4 (C4, D4, SubKey4);

   assign C5 = {C4[25:0], C4[27:26]};
   assign D5 = {D4[25:0], D4[27:26]};
   PC2 y5 (C5, D5, SubKey5);

   assign C6 = {C5[25:0], C5[27:26]};
   assign D6 = {D5[25:0], D5[27:26]};
   PC2 y6 (C6, D6, SubKey6);

   assign C7 = {C6[25:0], C6[27:26]};
   assign D7 = {D6[25:0], D6[27:26]};
   PC2 y7 (C7, D7, SubKey7);

   assign C8 = {C7[25:0], C7[27:26]};
   assign D8 = {D7[25:0], D7[27:26]};
   PC2 y8 (C8, D8, SubKey8);

   assign C9 = {C8[26:0], C8[27]};
   assign D9 = {D8[26:0], D8[27]};
   PC2 y9 (C9, D9, SubKey9);

   assign C10 = {C9[25:0], C9[27:26]};
   assign D10 = {D9[25:0], D9[27:26]};
   PC2 y10 (C10, D10, SubKey10);

   assign C11 = {C10[25:0], C10[27:26]};
   assign D11 = {D10[25:0], D10[27:26]};
   PC2 y11 (C11, D11, SubKey11);

   assign C12 = {C11[25:0], C11[27:26]};
   assign D12 = {D11[25:0], D11[27:26]};
   PC2 y12 (C12, D12, SubKey12);

   assign C13 = {C12[25:0], C12[27:26]};
   assign D13 = {D12[25:0], D12[27:26]};
   PC2 y13 (C13, D13, SubKey13);

   assign C14 = {C13[25:0], C13[27:26]};
   assign D14 = {D13[25:0], D13[27:26]};
   PC2 y14 (C14, D14, SubKey14);

   assign C15 = {C14[25:0], C14[27:26]};
   assign D15 = {D14[25:0], D14[27:26]};
   PC2 y15 (C15, D15, SubKey15);

   assign C16 = {C15[26:0], C15[27]};
   assign D16 = {D15[26:0], D15[27]};
   PC2 y16 (C16, D16, SubKey16);

endmodule // GenerateKeys

module PC1 (Key, left_block, right_block);

   input logic [63:0]  Key;
   output logic [27:0] left_block;
   output logic [27:0] right_block;
   
   logic [55:0]        out_block;


   assign out_block[55] = Key[64-57];
   assign out_block[54] = Key[64-49];   
   assign out_block[53] = Key[64-41];   
   assign out_block[52] = Key[64-33];
   assign out_block[51] = Key[64-25];
   assign out_block[50] = Key[64-17];
   assign out_block[49] = Key[64-9];
   assign out_block[48] = Key[64-1];
   assign out_block[47] = Key[64-58];
   assign out_block[46] = Key[64-50];
   assign out_block[45] = Key[64-42];
   assign out_block[44] = Key[64-34];   
   assign out_block[43] = Key[64-26];
   assign out_block[42] = Key[64-18];   
   assign out_block[41] = Key[64-10];
   assign out_block[40] = Key[64-2];
   assign out_block[39] = Key[64-59];
   assign out_block[38] = Key[64-51];
   assign out_block[37] = Key[64-43];
   assign out_block[36] = Key[64-35];
   assign out_block[35] = Key[64-27];
   assign out_block[34] = Key[64-19];   
   assign out_block[33] = Key[64-11];
   assign out_block[32] = Key[64-3];   
   assign out_block[31] = Key[64-60];
   assign out_block[30] = Key[64-52];
   assign out_block[29] = Key[64-44];
   assign out_block[28] = Key[64-36];
   assign out_block[27] = Key[64-63];
   assign out_block[26] = Key[64-55];
   assign out_block[25] = Key[64-47];   
   assign out_block[24] = Key[64-39];   
   assign out_block[23] = Key[64-31];
   assign out_block[22] = Key[64-23];   
   assign out_block[21] = Key[64-15];
   assign out_block[20] = Key[64-7];
   assign out_block[19] = Key[64-62];
   assign out_block[18] = Key[64-54];
   assign out_block[17] = Key[64-46];
   assign out_block[16] = Key[64-38];
   assign out_block[15] = Key[64-30];
   assign out_block[14] = Key[64-22];   
   assign out_block[13] = Key[64-14];
   assign out_block[12] = Key[64-6];   
   assign out_block[11] = Key[64-61];
   assign out_block[10] = Key[64-53];
   assign out_block[9] 	= Key[64-45];
   assign out_block[8] 	= Key[64-37];
   assign out_block[7] 	= Key[64-29];
   assign out_block[6] 	= Key[64-21];
   assign out_block[5] 	= Key[64-13];
   assign out_block[4]	= Key[64-5];   
   assign out_block[3] 	= Key[64-28];
   assign out_block[2]	= Key[64-20];    
   assign out_block[1] 	= Key[64-12];
   assign out_block[0] 	= Key[64-4];

   assign left_block = out_block[55:28];
   assign right_block = out_block[27:0];

endmodule // PC1

module PC2 (left_block, right_block, subkey);

   input logic [27:0] left_block;
   input logic [27:0] right_block;
   output logic [47:0] subkey;
   logic [55:0] out_block;

   assign out_block = {left_block,right_block};

   assign subkey[47] = out_block[56-14];
   assign subkey[46] = out_block[56-17];
   assign subkey[45] = out_block[56-11];
   assign subkey[44] = out_block[56-24];   
   assign subkey[43] = out_block[56-1];
   assign subkey[42] = out_block[56-5];   
   assign subkey[41] = out_block[56-3];
   assign subkey[40] = out_block[56-28];
   assign subkey[39] = out_block[56-15];
   assign subkey[38] = out_block[56-6];
   assign subkey[37] = out_block[56-21];
   assign subkey[36] = out_block[56-10];
   assign subkey[35] = out_block[56-23];
   assign subkey[34] = out_block[56-19];   
   assign subkey[33] = out_block[56-12];
   assign subkey[32] = out_block[56-4];   
   assign subkey[31] = out_block[56-26];
   assign subkey[30] = out_block[56-8];
   assign subkey[29] = out_block[56-16];
   assign subkey[28] = out_block[56-7];
   assign subkey[27] = out_block[56-27];
   assign subkey[26] = out_block[56-20];
   assign subkey[25] = out_block[56-13];   
   assign subkey[24] = out_block[56-2];   
   assign subkey[23] = out_block[56-41];
   assign subkey[22] = out_block[56-52];   
   assign subkey[21] = out_block[56-31];
   assign subkey[20] = out_block[56-37];
   assign subkey[19] = out_block[56-47];
   assign subkey[18] = out_block[56-55];
   assign subkey[17] = out_block[56-30];
   assign subkey[16] = out_block[56-40];
   assign subkey[15] = out_block[56-51];
   assign subkey[14] = out_block[56-45];   
   assign subkey[13] = out_block[56-33];
   assign subkey[12] = out_block[56-48];   
   assign subkey[11] = out_block[56-44];
   assign subkey[10] = out_block[56-49];
   assign subkey[9]	 = out_block[56-39];
   assign subkey[8]  = out_block[56-56];
   assign subkey[7]  = out_block[56-34];
   assign subkey[6]  = out_block[56-53];
   assign subkey[5]  = out_block[56-46];
   assign subkey[4]  = out_block[56-42];   
   assign subkey[3]  = out_block[56-50];
   assign subkey[2]  = out_block[56-36];    
   assign subkey[1]  = out_block[56-29];
   assign subkey[0]  = out_block[56-32];

endmodule // PC2

// Straight Function
module SF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [31:0] out_block;

   assign out_block[31] = inp_block[32-16];
   assign out_block[30] = inp_block[32-7];
   assign out_block[29] = inp_block[32-20];
   assign out_block[28] = inp_block[32-21];
   assign out_block[27] = inp_block[32-29];
   assign out_block[26] = inp_block[32-12];
   assign out_block[25] = inp_block[32-28];   
   assign out_block[24] = inp_block[32-17];   
   assign out_block[23] = inp_block[32-1];
   assign out_block[22] = inp_block[32-15];   
   assign out_block[21] = inp_block[32-23];
   assign out_block[20] = inp_block[32-26];
   assign out_block[19] = inp_block[32-5];
   assign out_block[18] = inp_block[32-18];
   assign out_block[17] = inp_block[32-31];
   assign out_block[16] = inp_block[32-10];
   assign out_block[15] = inp_block[32-2];
   assign out_block[14] = inp_block[32-8];   
   assign out_block[13] = inp_block[32-24];
   assign out_block[12] = inp_block[32-14];   
   assign out_block[11] = inp_block[32-32];
   assign out_block[10] = inp_block[32-27];
   assign out_block[9]  = inp_block[32-3];
   assign out_block[8]  = inp_block[32-9];
   assign out_block[7]  = inp_block[32-19];
   assign out_block[6]  = inp_block[32-13];
   assign out_block[5]  = inp_block[32-30];
   assign out_block[4]  = inp_block[32-6];   
   assign out_block[3]  = inp_block[32-22];
   assign out_block[2]  = inp_block[32-11];    
   assign out_block[1]  = inp_block[32-4];
   assign out_block[0]  = inp_block[32-25];

endmodule // SF

// Expansion Function
module EF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [47:0] out_block;

   assign out_block[47] = inp_block[32-32];
   assign out_block[46] = inp_block[32-1];
   assign out_block[45] = inp_block[32-2];
   assign out_block[44] = inp_block[32-3];   
   assign out_block[43] = inp_block[32-4];
   assign out_block[42] = inp_block[32-5];   
   assign out_block[41] = inp_block[32-4];
   assign out_block[40] = inp_block[32-5];
   assign out_block[39] = inp_block[32-6];
   assign out_block[38] = inp_block[32-7];
   assign out_block[37] = inp_block[32-8];
   assign out_block[36] = inp_block[32-9];
   assign out_block[35] = inp_block[32-8];
   assign out_block[34] = inp_block[32-9];   
   assign out_block[33] = inp_block[32-10];
   assign out_block[32] = inp_block[32-11];   
   assign out_block[31] = inp_block[32-12];
   assign out_block[30] = inp_block[32-13];
   assign out_block[29] = inp_block[32-12];
   assign out_block[28] = inp_block[32-13];
   assign out_block[27] = inp_block[32-14];
   assign out_block[26] = inp_block[32-15];
   assign out_block[25] = inp_block[32-16];   
   assign out_block[24] = inp_block[32-17];   
   assign out_block[23] = inp_block[32-16];
   assign out_block[22] = inp_block[32-17];   
   assign out_block[21] = inp_block[32-18];
   assign out_block[20] = inp_block[32-19];
   assign out_block[19] = inp_block[32-20];
   assign out_block[18] = inp_block[32-21];
   assign out_block[17] = inp_block[32-20];
   assign out_block[16] = inp_block[32-21];
   assign out_block[15] = inp_block[32-22];
   assign out_block[14] = inp_block[32-23];   
   assign out_block[13] = inp_block[32-24];
   assign out_block[12] = inp_block[32-25];   
   assign out_block[11] = inp_block[32-24];
   assign out_block[10] = inp_block[32-25];
   assign out_block[9]  = inp_block[32-26];
   assign out_block[8]  = inp_block[32-27];
   assign out_block[7]  = inp_block[32-28];
   assign out_block[6]  = inp_block[32-29];
   assign out_block[5]  = inp_block[32-28];
   assign out_block[4]  = inp_block[32-29];   
   assign out_block[3]  = inp_block[32-30];
   assign out_block[2]  = inp_block[32-31];    
   assign out_block[1]  = inp_block[32-32];
   assign out_block[0]  = inp_block[32-1];

endmodule // EF

module feistel (inp_block, subkey, out_block);

   input logic [31:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [31:0] out_block;

   logic [47:0] out_ef;
   logic [47:0] xor1;
   logic [31:0] out_sbox;

   EF exBlock1 (inp_block, out_ef);

   assign xor1 = out_ef ^ subkey;

   S8_Box s8 (xor1[5:0], out_sbox[3:0]);

   S7_Box s7 (xor1[11:6], out_sbox[7:4]);

   S6_Box s6 (xor1[17:12], out_sbox[11:8]);

   S5_Box s5 (xor1[23:18], out_sbox[15:12]);

   S4_Box s4 (xor1[29:24], out_sbox[19:16]);

   S3_Box s3 (xor1[35:30], out_sbox[23:20]);

   S2_Box s2 (xor1[41:36], out_sbox[27:24]);

   S1_Box s1 (xor1[47:42], out_sbox[31:28]);

   SF straightF1 (out_sbox[31:0], out_block[31:0]);

endmodule // Feistel

// DES block round
module round (inp_block, subkey, out_block);

   input logic [63:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;

   logic [31:0] in_left;
   logic [31:0] in_right;
   logic [31:0] out_fei;
   //logic [31:0] out_left;
   //logic [31:0] out_right;
   //these two lines were for xor and in_right

   assign in_left = inp_block [63:32];
   assign in_right = inp_block [31:0];

   feistel inFeiBlock (in_right, subkey, out_fei);

   assign out_block [31:0] = out_fei ^ in_left;

   assign out_block [63:32] = in_right;

endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9]  = inp_block[64-13];
   assign out_block[8]  = inp_block[64-5];
   assign out_block[7]  = inp_block[64-63];
   assign out_block[6]  = inp_block[64-55];
   assign out_block[5]  = inp_block[64-47];
   assign out_block[4]  = inp_block[64-39];   
   assign out_block[3]  = inp_block[64-31];
   assign out_block[2]  = inp_block[64-23];    
   assign out_block[1]  = inp_block[64-15];
   assign out_block[0]  = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9]  = inp_block[64-58];
   assign out_block[8]  = inp_block[64-26];   
   assign out_block[7]  = inp_block[64-33];
   assign out_block[6]  = inp_block[64-1];
   assign out_block[5]  = inp_block[64-41];   
   assign out_block[4]  = inp_block[64-9];
   assign out_block[3]  = inp_block[64-49];    
   assign out_block[2]  = inp_block[64-17];
   assign out_block[1]  = inp_block[64-57];
   assign out_block[0]  = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (input logic [63:0] key, input logic [63:0] plaintext, 
	    input logic encrypt, output logic [63:0] ciphertext, input logic [63:0] IV, input logic cbc);

   logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
   logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
   logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
   logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;

   logic [63:0]	ip_in;
   logic [63:0] ip_out;
   logic [63:0]	ip_out2;

   logic [63:0]	r1_out;
   logic [63:0]	r2_out;
   logic [63:0]	r3_out;
   logic [63:0]	r4_out;
   logic [63:0]	r5_out;
   logic [63:0]	r6_out;
   logic [63:0]	r7_out;
   logic [63:0]	r8_out;
   logic [63:0]	r9_out;
   logic [63:0]	r10_out;
   logic [63:0]	r11_out;
   logic [63:0]	r12_out;
   logic [63:0]	r13_out;
   logic [63:0]	r14_out;
   logic [63:0]	r15_out;
   logic [63:0] r16_out;

   assign  ip_in = cbc ? (encrypt ? (IV^plaintext):(plaintext)):(plaintext);

   // SubKey generation
   GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
		    SubKey5, SubKey6, SubKey7, SubKey8,
		    SubKey9, SubKey10, SubKey11, SubKey12,
		    SubKey13, SubKey14, SubKey15, SubKey16);

   // encrypt (encrypt=1) or decrypt (encrypt=0)

   // Initial Permutation (IP)
   IP b1 (ip_in, ip_out);

   // round 1
   logic [47:0] mux1;
   assign mux1 = encrypt ? SubKey1 : SubKey16;
   round rd1 (ip_out, mux1, r1_out);

   // round 2
   logic [47:0] mux2;
   assign mux2 = encrypt ? SubKey2 : SubKey15;
   round rd2 (r1_out, mux2, r2_out);

   // round 3
   logic [47:0] mux3;
   assign mux3 = encrypt ? SubKey3 : SubKey14;
   round rd3 (r2_out, mux3, r3_out);

   // round 4
   logic [47:0] mux4;
   assign mux4 = encrypt ? SubKey4 : SubKey13;
   round rd4 (r3_out, mux4, r4_out);

   // round 5
   logic [47:0] mux5;
   assign mux5 = encrypt ? SubKey5 : SubKey12;
   round rd5 (r4_out, mux5, r5_out);

   // round 6
   logic [47:0] mux6;
   assign mux6 = encrypt ? SubKey6 : SubKey11;
   round rd6 (r5_out, mux6, r6_out);

   // round 7
   logic [47:0] mux7;
   assign mux7 = encrypt ? SubKey7 : SubKey10;
   round rd7 (r6_out, mux7, r7_out);

   // round 8
   logic [47:0] mux8;
   assign mux8 = encrypt ? SubKey8 : SubKey9;
   round rd8 (r7_out, mux8, r8_out);

   // round 9
   logic [47:0] mux9;
   assign mux9 = encrypt ? SubKey9 : SubKey8;
   round rd9 (r8_out, mux9, r9_out);

   // round 10
   logic [47:0] mux10;
   assign mux10 = encrypt ? SubKey10 : SubKey7;
   round rd10 (r9_out, mux10, r10_out);

   // round 11
   logic [47:0] mux11;
   assign mux11 = encrypt ? SubKey11 : SubKey6;
   round rd11 (r10_out, mux11, r11_out);

   // round 12
   logic [47:0] mux12;
   assign mux12 = encrypt ? SubKey12 : SubKey5;
   round rd12 (r11_out, mux12, r12_out);

   // round 13
   logic [47:0] mux13;
   assign mux13 = encrypt ? SubKey13 : SubKey4;
   round rd13 (r12_out, mux13, r13_out);

   // round 14
   logic [47:0] mux14;
   assign mux14 = encrypt ? SubKey14 : SubKey3;
   round rd14 (r13_out, mux14, r14_out);

   // round 15
   logic [47:0] mux15;
   assign mux15 = encrypt ? SubKey15 : SubKey2;
   round rd15 (r14_out, mux15, r15_out);

   // round 16
   logic [47:0] mux16;
   assign mux16 = encrypt ? SubKey16 : SubKey1;
   round rd16 (r15_out, mux16, r16_out);

   // Final Permutation (IP^{-1}) (swap output of round16)
   FP FP({r16_out[31:0], r16_out[63:32]}, ip_out2);

   assign ciphertext = cbc ? (encrypt ? (ip_out2):(IV^ip_out2)) : (ip_out2);

   
endmodule // DES