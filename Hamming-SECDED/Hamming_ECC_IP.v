// Generator : SpinalHDL v1.12.3    git head : 591e64062329e5e2e2b81f4d52422948053edb97
// Component : Hamming_ECC_IP
// Git hash  : 0ad1bef6b1efb4f294b02161125c19e7f7fdc301

`timescale 1ns/1ps

module Hamming_ECC_IP (
  input  wire [31:0]   io_data_in,
  output wire [38:0]   io_data_out
);

  wire                _zz_P0;
  wire                _zz_P0_1;
  wire                _zz_P1;
  wire                _zz_P1_1;
  wire                _zz_P2;
  wire                _zz_P2_1;
  wire                P0;
  wire                P1;
  wire                P2;
  wire                P3;
  wire                P4;
  wire                P5;
  wire                P6;

  assign _zz_P0 = ((((((io_data_in[0] ^ io_data_in[1]) ^ io_data_in[3]) ^ io_data_in[4]) ^ io_data_in[6]) ^ io_data_in[8]) ^ io_data_in[10]);
  assign _zz_P0_1 = io_data_in[11];
  assign _zz_P1 = (io_data_in[0] ^ io_data_in[2]);
  assign _zz_P1_1 = io_data_in[3];
  assign _zz_P2 = (io_data_in[1] ^ io_data_in[2]);
  assign _zz_P2_1 = io_data_in[3];
  assign P0 = (((((((((((_zz_P0 ^ _zz_P0_1) ^ io_data_in[13]) ^ io_data_in[15]) ^ io_data_in[17]) ^ io_data_in[19]) ^ io_data_in[21]) ^ io_data_in[23]) ^ io_data_in[25]) ^ io_data_in[26]) ^ io_data_in[28]) ^ io_data_in[30]);
  assign P1 = ((((((((((((((((_zz_P1 ^ _zz_P1_1) ^ io_data_in[5]) ^ io_data_in[6]) ^ io_data_in[9]) ^ io_data_in[10]) ^ io_data_in[12]) ^ io_data_in[13]) ^ io_data_in[16]) ^ io_data_in[17]) ^ io_data_in[20]) ^ io_data_in[21]) ^ io_data_in[24]) ^ io_data_in[25]) ^ io_data_in[27]) ^ io_data_in[28]) ^ io_data_in[31]);
  assign P2 = ((((((((((((((((_zz_P2 ^ _zz_P2_1) ^ io_data_in[7]) ^ io_data_in[8]) ^ io_data_in[9]) ^ io_data_in[10]) ^ io_data_in[14]) ^ io_data_in[15]) ^ io_data_in[16]) ^ io_data_in[17]) ^ io_data_in[22]) ^ io_data_in[23]) ^ io_data_in[24]) ^ io_data_in[25]) ^ io_data_in[29]) ^ io_data_in[30]) ^ io_data_in[31]);
  assign P3 = ((((((((((((((io_data_in[4] ^ io_data_in[5]) ^ io_data_in[6]) ^ io_data_in[7]) ^ io_data_in[8]) ^ io_data_in[9]) ^ io_data_in[10]) ^ io_data_in[18]) ^ io_data_in[19]) ^ io_data_in[20]) ^ io_data_in[21]) ^ io_data_in[22]) ^ io_data_in[23]) ^ io_data_in[24]) ^ io_data_in[25]);
  assign P4 = ((((((((((((((io_data_in[11] ^ io_data_in[12]) ^ io_data_in[13]) ^ io_data_in[14]) ^ io_data_in[15]) ^ io_data_in[16]) ^ io_data_in[17]) ^ io_data_in[18]) ^ io_data_in[19]) ^ io_data_in[20]) ^ io_data_in[21]) ^ io_data_in[22]) ^ io_data_in[23]) ^ io_data_in[24]) ^ io_data_in[25]);
  assign P5 = (((((io_data_in[26] ^ io_data_in[27]) ^ io_data_in[28]) ^ io_data_in[29]) ^ io_data_in[30]) ^ io_data_in[31]);
  assign P6 = (((((((^io_data_in) ^ P0) ^ P1) ^ P2) ^ P3) ^ P4) ^ P5);
  assign io_data_out = {{{{{{{P6,P5},P4},P3},P2},P1},P0},io_data_in};

endmodule
