
// 	Thu May  6 06:07:42 2021
//	vlsi
//	localhost.localdomain

module decompress (in1, in2, out, byteIndx, bitIndx, done, work);

output [3:0] bitIndx;
output [31:0] byteIndx;
output done;
output [7:0] out;
input [2:0] in1;
input [2:0] in2;
input work;
wire n_0_0_1;
wire n_0_0_0;
wire n_0_0_2;
wire n_0_2;
wire n_0_0;
wire n_0_1;
wire n_0_3;
wire n_0_0_3;
wire n_0_4;
wire n_0_0_4;
wire n_0_5;
wire n_0_0_5;
wire n_0_0_6;
wire n_0_6;
wire n_0_0_7;
wire n_0_7;
wire n_0_8;
wire n_0_9;
wire n_0_0_8;
wire n_0_10;
wire n_0_0_9;
wire n_0_11;
wire n_0_0_10;
wire n_0_0_11;
wire n_0_0_12;
wire n_0_0_13;

// WARNING . Detected multiport output net(s). Introducing ASSIGN statements.
// This may cause simulation/synthesis mismatches . 
assign bitIndx[3] = 1'b1 ;
assign byteIndx[31] = 1'b0 ;
assign byteIndx[30] = 1'b0 ;
assign byteIndx[29] = 1'b0 ;
assign byteIndx[28] = 1'b0 ;
assign byteIndx[27] = 1'b0 ;
assign byteIndx[26] = 1'b0 ;
assign byteIndx[25] = 1'b0 ;
assign byteIndx[24] = 1'b0 ;
assign byteIndx[23] = 1'b0 ;
assign byteIndx[22] = 1'b0 ;
assign byteIndx[21] = 1'b0 ;
assign byteIndx[20] = 1'b0 ;
assign byteIndx[19] = 1'b0 ;
assign byteIndx[18] = 1'b0 ;
assign byteIndx[17] = 1'b0 ;
assign byteIndx[16] = 1'b0 ;
assign byteIndx[15] = 1'b0 ;
assign byteIndx[14] = 1'b0 ;
assign byteIndx[13] = 1'b0 ;
assign byteIndx[12] = 1'b0 ;
assign byteIndx[11] = 1'b0 ;
assign byteIndx[10] = 1'b0 ;
assign byteIndx[9] = 1'b0 ;
assign byteIndx[8] = 1'b0 ;
assign byteIndx[7] = 1'b0 ;
assign byteIndx[6] = 1'b0 ;
assign byteIndx[5] = 1'b0 ;
assign byteIndx[4] = 1'b0 ;
assign byteIndx[3] = 1'b0 ;
assign byteIndx[2] = 1'b0 ;
assign byteIndx[1] = 1'b0 ;
assign byteIndx[0] = 1'b0 ;
assign done = 1'b1 ;
assign out[1] = 1'b0 ;
assign out[0] = 1'b0 ;

INV_X1 i_0_1 (.ZN (bitIndx[2]), .A (n_0_2));
INV_X1 i_0_0_25 (.ZN (n_0_0_13), .A (in1[1]));
INV_X1 i_0_0_24 (.ZN (n_0_0_12), .A (in1[0]));
INV_X1 i_0_0_23 (.ZN (bitIndx[0]), .A (n_0_0_1));
INV_X1 i_0_0_22 (.ZN (bitIndx[1]), .A (n_0_0_2));
NOR2_X1 i_0_0_21 (.ZN (n_0_0_11), .A1 (in2[1]), .A2 (in1[1]));
NOR2_X1 i_0_0_20 (.ZN (n_0_0_10), .A1 (in2[0]), .A2 (in1[0]));
NAND2_X1 i_0_0_19 (.ZN (n_0_11), .A1 (n_0_0_11), .A2 (n_0_0_10));
NAND2_X1 i_0_0_18 (.ZN (n_0_0_9), .A1 (in2[0]), .A2 (in1[0]));
NAND2_X1 i_0_0_17 (.ZN (n_0_10), .A1 (n_0_0_11), .A2 (n_0_0_9));
NAND2_X1 i_0_0_16 (.ZN (n_0_0_8), .A1 (in2[1]), .A2 (in1[1]));
AOI21_X1 i_0_0_15 (.ZN (n_0_9), .A (n_0_0_11), .B1 (n_0_0_10), .B2 (n_0_0_8));
NOR2_X1 i_0_0_14 (.ZN (n_0_8), .A1 (n_0_0_10), .A2 (n_0_0_8));
NOR2_X1 i_0_0_13 (.ZN (n_0_7), .A1 (n_0_0_9), .A2 (n_0_0_8));
OAI211_X1 i_0_0_12 (.ZN (n_0_0_7), .A (n_0_0_13), .B (n_0_0_12), .C1 (in2[1]), .C2 (in2[0]));
MUX2_X1 i_0_0_11 (.Z (n_0_6), .A (in2[2]), .B (in1[2]), .S (n_0_0_7));
NAND2_X1 i_0_0_10 (.ZN (n_0_0_6), .A1 (in1[2]), .A2 (in1[1]));
OAI21_X1 i_0_0_9 (.ZN (n_0_0_5), .A (in2[2]), .B1 (in2[1]), .B2 (in1[0]));
OAI21_X1 i_0_0_8 (.ZN (n_0_5), .A (n_0_0_6), .B1 (n_0_0_5), .B2 (in1[1]));
OAI211_X1 i_0_0_7 (.ZN (n_0_0_4), .A (n_0_9), .B (in2[2]), .C1 (n_0_0_13), .C2 (n_0_0_12));
OAI21_X1 i_0_0_6 (.ZN (n_0_4), .A (n_0_0_4), .B1 (n_0_0_6), .B2 (n_0_0_12));
OAI21_X1 i_0_0_5 (.ZN (n_0_0_3), .A (in2[2]), .B1 (in2[1]), .B2 (in1[1]));
AOI21_X1 i_0_0_4 (.ZN (n_0_3), .A (n_0_0_3), .B1 (n_0_0_8), .B2 (n_0_0_9));
AND2_X1 i_0_0_3 (.ZN (n_0_1), .A1 (in2[2]), .A2 (n_0_8));
AND2_X1 i_0_0_2 (.ZN (n_0_0), .A1 (in2[2]), .A2 (n_0_7));
FA_X1 i_0_0_1 (.CO (n_0_2), .S (n_0_0_2), .A (in2[1]), .B (in1[1]), .CI (n_0_0_0));
HA_X1 i_0_0_0 (.CO (n_0_0_0), .S (n_0_0_1), .A (in2[0]), .B (in1[0]));
DLH_X1 \tempOut_reg[2]  (.Q (out[2]), .D (n_0_0), .G (n_0_7));
DLH_X1 \tempOut_reg[3]  (.Q (out[3]), .D (n_0_1), .G (n_0_8));
DLH_X1 \tempOut_reg[4]  (.Q (out[4]), .D (n_0_3), .G (n_0_2));
DLH_X1 \tempOut_reg[5]  (.Q (out[5]), .D (n_0_4), .G (n_0_9));
DLH_X1 \tempOut_reg[6]  (.Q (out[6]), .D (n_0_5), .G (n_0_10));
DLH_X1 \tempOut_reg[7]  (.Q (out[7]), .D (n_0_6), .G (n_0_11));

endmodule //decompress


