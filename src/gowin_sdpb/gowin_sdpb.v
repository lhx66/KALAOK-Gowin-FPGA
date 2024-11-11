//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.9 (64-bit)
//Part Number: GW5A-LV25UG324C2/I1
//Device: GW5A-25
//Device Version: A
//Created Time: Wed Oct 23 23:08:04 2024

module Gowin_SDPB (dout, clka, cea, clkb, ceb, oce, reset, ada, din, adb);

output [15:0] dout;
input clka;
input cea;
input clkb;
input ceb;
input oce;
input reset;
input [14:0] ada;
input [15:0] din;
input [14:0] adb;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire lut_f_4;
wire lut_f_5;
wire lut_f_6;
wire lut_f_7;
wire lut_f_8;
wire lut_f_9;
wire lut_f_10;
wire lut_f_11;
wire lut_f_12;
wire lut_f_13;
wire lut_f_14;
wire lut_f_15;
wire [26:0] sdpx9b_inst_0_dout_w;
wire [8:0] sdpx9b_inst_0_dout;
wire [26:0] sdpx9b_inst_1_dout_w;
wire [8:0] sdpx9b_inst_1_dout;
wire [26:0] sdpx9b_inst_2_dout_w;
wire [8:0] sdpx9b_inst_2_dout;
wire [26:0] sdpx9b_inst_3_dout_w;
wire [8:0] sdpx9b_inst_3_dout;
wire [26:0] sdpx9b_inst_4_dout_w;
wire [8:0] sdpx9b_inst_4_dout;
wire [26:0] sdpx9b_inst_5_dout_w;
wire [8:0] sdpx9b_inst_5_dout;
wire [26:0] sdpx9b_inst_6_dout_w;
wire [8:0] sdpx9b_inst_6_dout;
wire [26:0] sdpx9b_inst_7_dout_w;
wire [8:0] sdpx9b_inst_7_dout;
wire [30:0] sdpb_inst_8_dout_w;
wire [9:9] sdpb_inst_8_dout;
wire [30:0] sdpb_inst_9_dout_w;
wire [10:10] sdpb_inst_9_dout;
wire [30:0] sdpb_inst_10_dout_w;
wire [11:11] sdpb_inst_10_dout;
wire [30:0] sdpb_inst_11_dout_w;
wire [12:12] sdpb_inst_11_dout;
wire [30:0] sdpb_inst_12_dout_w;
wire [13:13] sdpb_inst_12_dout;
wire [30:0] sdpb_inst_13_dout_w;
wire [14:14] sdpb_inst_13_dout;
wire [30:0] sdpb_inst_14_dout_w;
wire [15:15] sdpb_inst_14_dout;
wire [29:0] sdpb_inst_15_dout_w;
wire [1:0] sdpb_inst_15_dout;
wire [29:0] sdpb_inst_16_dout_w;
wire [3:2] sdpb_inst_16_dout;
wire [29:0] sdpb_inst_17_dout_w;
wire [5:4] sdpb_inst_17_dout;
wire [29:0] sdpb_inst_18_dout_w;
wire [7:6] sdpb_inst_18_dout;
wire [29:0] sdpb_inst_19_dout_w;
wire [9:8] sdpb_inst_19_dout;
wire [29:0] sdpb_inst_20_dout_w;
wire [11:10] sdpb_inst_20_dout;
wire [29:0] sdpb_inst_21_dout_w;
wire [13:12] sdpb_inst_21_dout;
wire [29:0] sdpb_inst_22_dout_w;
wire [15:14] sdpb_inst_22_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire dff_q_4;
wire dff_q_5;
wire dff_q_6;
wire dff_q_7;
wire mux_o_0;
wire mux_o_1;
wire mux_o_2;
wire mux_o_3;
wire mux_o_5;
wire mux_o_6;
wire mux_o_8;
wire mux_o_11;
wire mux_o_12;
wire mux_o_13;
wire mux_o_14;
wire mux_o_16;
wire mux_o_17;
wire mux_o_19;
wire mux_o_22;
wire mux_o_23;
wire mux_o_24;
wire mux_o_25;
wire mux_o_27;
wire mux_o_28;
wire mux_o_30;
wire mux_o_33;
wire mux_o_34;
wire mux_o_35;
wire mux_o_36;
wire mux_o_38;
wire mux_o_39;
wire mux_o_41;
wire mux_o_44;
wire mux_o_45;
wire mux_o_46;
wire mux_o_47;
wire mux_o_49;
wire mux_o_50;
wire mux_o_52;
wire mux_o_55;
wire mux_o_56;
wire mux_o_57;
wire mux_o_58;
wire mux_o_60;
wire mux_o_61;
wire mux_o_63;
wire mux_o_66;
wire mux_o_67;
wire mux_o_68;
wire mux_o_69;
wire mux_o_71;
wire mux_o_72;
wire mux_o_74;
wire mux_o_77;
wire mux_o_78;
wire mux_o_79;
wire mux_o_80;
wire mux_o_82;
wire mux_o_83;
wire mux_o_85;
wire mux_o_88;
wire mux_o_89;
wire mux_o_90;
wire mux_o_91;
wire mux_o_93;
wire mux_o_94;
wire mux_o_96;
wire gw_gnd;

assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_0.INIT = 16'h0001;
LUT4 lut_inst_1 (
  .F(lut_f_1),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_1.INIT = 16'h0002;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_2.INIT = 16'h0004;
LUT4 lut_inst_3 (
  .F(lut_f_3),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_3.INIT = 16'h0008;
LUT4 lut_inst_4 (
  .F(lut_f_4),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_4.INIT = 16'h0010;
LUT4 lut_inst_5 (
  .F(lut_f_5),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_5.INIT = 16'h0020;
LUT4 lut_inst_6 (
  .F(lut_f_6),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_6.INIT = 16'h0040;
LUT4 lut_inst_7 (
  .F(lut_f_7),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_7.INIT = 16'h0080;
LUT4 lut_inst_8 (
  .F(lut_f_8),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_8.INIT = 16'h0001;
LUT4 lut_inst_9 (
  .F(lut_f_9),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_9.INIT = 16'h0002;
LUT4 lut_inst_10 (
  .F(lut_f_10),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_10.INIT = 16'h0004;
LUT4 lut_inst_11 (
  .F(lut_f_11),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_11.INIT = 16'h0008;
LUT4 lut_inst_12 (
  .F(lut_f_12),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_12.INIT = 16'h0010;
LUT4 lut_inst_13 (
  .F(lut_f_13),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_13.INIT = 16'h0020;
LUT4 lut_inst_14 (
  .F(lut_f_14),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_14.INIT = 16'h0040;
LUT4 lut_inst_15 (
  .F(lut_f_15),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_15.INIT = 16'h0080;
SDPX9B sdpx9b_inst_0 (
    .DO({sdpx9b_inst_0_dout_w[26:0],sdpx9b_inst_0_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_8}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_0.READ_MODE = 1'b1;
defparam sdpx9b_inst_0.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_0.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_0.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_0.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_0.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_1 (
    .DO({sdpx9b_inst_1_dout_w[26:0],sdpx9b_inst_1_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_9}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_1.READ_MODE = 1'b1;
defparam sdpx9b_inst_1.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_1.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_1.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_1.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_1.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_2 (
    .DO({sdpx9b_inst_2_dout_w[26:0],sdpx9b_inst_2_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_2}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_10}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_2.READ_MODE = 1'b1;
defparam sdpx9b_inst_2.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_2.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_2.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_2.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_2.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_3 (
    .DO({sdpx9b_inst_3_dout_w[26:0],sdpx9b_inst_3_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_3}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_11}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_3.READ_MODE = 1'b1;
defparam sdpx9b_inst_3.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_3.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_3.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_3.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_3.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_4 (
    .DO({sdpx9b_inst_4_dout_w[26:0],sdpx9b_inst_4_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_4}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_12}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_4.READ_MODE = 1'b1;
defparam sdpx9b_inst_4.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_4.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_4.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_4.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_4.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_5 (
    .DO({sdpx9b_inst_5_dout_w[26:0],sdpx9b_inst_5_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_5}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_13}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_5.READ_MODE = 1'b1;
defparam sdpx9b_inst_5.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_5.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_5.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_5.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_5.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_6 (
    .DO({sdpx9b_inst_6_dout_w[26:0],sdpx9b_inst_6_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_6}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_14}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_6.READ_MODE = 1'b1;
defparam sdpx9b_inst_6.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_6.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_6.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_6.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_6.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_7 (
    .DO({sdpx9b_inst_7_dout_w[26:0],sdpx9b_inst_7_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_7}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_15}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_7.READ_MODE = 1'b1;
defparam sdpx9b_inst_7.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_7.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_7.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_7.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_7.RESET_MODE = "SYNC";

SDPB sdpb_inst_8 (
    .DO({sdpb_inst_8_dout_w[30:0],sdpb_inst_8_dout[9]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[9]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_8.READ_MODE = 1'b1;
defparam sdpb_inst_8.BIT_WIDTH_0 = 1;
defparam sdpb_inst_8.BIT_WIDTH_1 = 1;
defparam sdpb_inst_8.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_8.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_8.RESET_MODE = "SYNC";

SDPB sdpb_inst_9 (
    .DO({sdpb_inst_9_dout_w[30:0],sdpb_inst_9_dout[10]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[10]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_9.READ_MODE = 1'b1;
defparam sdpb_inst_9.BIT_WIDTH_0 = 1;
defparam sdpb_inst_9.BIT_WIDTH_1 = 1;
defparam sdpb_inst_9.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_9.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_9.RESET_MODE = "SYNC";

SDPB sdpb_inst_10 (
    .DO({sdpb_inst_10_dout_w[30:0],sdpb_inst_10_dout[11]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_10.READ_MODE = 1'b1;
defparam sdpb_inst_10.BIT_WIDTH_0 = 1;
defparam sdpb_inst_10.BIT_WIDTH_1 = 1;
defparam sdpb_inst_10.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_10.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_10.RESET_MODE = "SYNC";

SDPB sdpb_inst_11 (
    .DO({sdpb_inst_11_dout_w[30:0],sdpb_inst_11_dout[12]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[12]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_11.READ_MODE = 1'b1;
defparam sdpb_inst_11.BIT_WIDTH_0 = 1;
defparam sdpb_inst_11.BIT_WIDTH_1 = 1;
defparam sdpb_inst_11.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_11.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_11.RESET_MODE = "SYNC";

SDPB sdpb_inst_12 (
    .DO({sdpb_inst_12_dout_w[30:0],sdpb_inst_12_dout[13]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[13]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_12.READ_MODE = 1'b1;
defparam sdpb_inst_12.BIT_WIDTH_0 = 1;
defparam sdpb_inst_12.BIT_WIDTH_1 = 1;
defparam sdpb_inst_12.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_12.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_12.RESET_MODE = "SYNC";

SDPB sdpb_inst_13 (
    .DO({sdpb_inst_13_dout_w[30:0],sdpb_inst_13_dout[14]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[14]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_13.READ_MODE = 1'b1;
defparam sdpb_inst_13.BIT_WIDTH_0 = 1;
defparam sdpb_inst_13.BIT_WIDTH_1 = 1;
defparam sdpb_inst_13.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_13.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_13.RESET_MODE = "SYNC";

SDPB sdpb_inst_14 (
    .DO({sdpb_inst_14_dout_w[30:0],sdpb_inst_14_dout[15]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[15]}),
    .ADB(adb[13:0])
);

defparam sdpb_inst_14.READ_MODE = 1'b1;
defparam sdpb_inst_14.BIT_WIDTH_0 = 1;
defparam sdpb_inst_14.BIT_WIDTH_1 = 1;
defparam sdpb_inst_14.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_14.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_14.RESET_MODE = "SYNC";

SDPB sdpb_inst_15 (
    .DO({sdpb_inst_15_dout_w[29:0],sdpb_inst_15_dout[1:0]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1:0]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_15.READ_MODE = 1'b1;
defparam sdpb_inst_15.BIT_WIDTH_0 = 2;
defparam sdpb_inst_15.BIT_WIDTH_1 = 2;
defparam sdpb_inst_15.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_15.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_15.RESET_MODE = "SYNC";

SDPB sdpb_inst_16 (
    .DO({sdpb_inst_16_dout_w[29:0],sdpb_inst_16_dout[3:2]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:2]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_16.READ_MODE = 1'b1;
defparam sdpb_inst_16.BIT_WIDTH_0 = 2;
defparam sdpb_inst_16.BIT_WIDTH_1 = 2;
defparam sdpb_inst_16.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_16.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_16.RESET_MODE = "SYNC";

SDPB sdpb_inst_17 (
    .DO({sdpb_inst_17_dout_w[29:0],sdpb_inst_17_dout[5:4]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5:4]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_17.READ_MODE = 1'b1;
defparam sdpb_inst_17.BIT_WIDTH_0 = 2;
defparam sdpb_inst_17.BIT_WIDTH_1 = 2;
defparam sdpb_inst_17.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_17.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_17.RESET_MODE = "SYNC";

SDPB sdpb_inst_18 (
    .DO({sdpb_inst_18_dout_w[29:0],sdpb_inst_18_dout[7:6]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:6]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_18.READ_MODE = 1'b1;
defparam sdpb_inst_18.BIT_WIDTH_0 = 2;
defparam sdpb_inst_18.BIT_WIDTH_1 = 2;
defparam sdpb_inst_18.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_18.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_18.RESET_MODE = "SYNC";

SDPB sdpb_inst_19 (
    .DO({sdpb_inst_19_dout_w[29:0],sdpb_inst_19_dout[9:8]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[9:8]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_19.READ_MODE = 1'b1;
defparam sdpb_inst_19.BIT_WIDTH_0 = 2;
defparam sdpb_inst_19.BIT_WIDTH_1 = 2;
defparam sdpb_inst_19.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_19.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_19.RESET_MODE = "SYNC";

SDPB sdpb_inst_20 (
    .DO({sdpb_inst_20_dout_w[29:0],sdpb_inst_20_dout[11:10]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11:10]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_20.READ_MODE = 1'b1;
defparam sdpb_inst_20.BIT_WIDTH_0 = 2;
defparam sdpb_inst_20.BIT_WIDTH_1 = 2;
defparam sdpb_inst_20.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_20.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_20.RESET_MODE = "SYNC";

SDPB sdpb_inst_21 (
    .DO({sdpb_inst_21_dout_w[29:0],sdpb_inst_21_dout[13:12]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[13:12]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_21.READ_MODE = 1'b1;
defparam sdpb_inst_21.BIT_WIDTH_0 = 2;
defparam sdpb_inst_21.BIT_WIDTH_1 = 2;
defparam sdpb_inst_21.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_21.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_21.RESET_MODE = "SYNC";

SDPB sdpb_inst_22 (
    .DO({sdpb_inst_22_dout_w[29:0],sdpb_inst_22_dout[15:14]}),
    .CLKA(clka),
    .CEA(cea),
    .CLKB(clkb),
    .CEB(ceb),
    .OCE(oce),
    .RESET(reset),
    .BLKSELA({gw_gnd,ada[14],ada[13]}),
    .BLKSELB({gw_gnd,adb[14],adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[15:14]}),
    .ADB({adb[12:0],gw_gnd})
);

defparam sdpb_inst_22.READ_MODE = 1'b1;
defparam sdpb_inst_22.BIT_WIDTH_0 = 2;
defparam sdpb_inst_22.BIT_WIDTH_1 = 2;
defparam sdpb_inst_22.BLK_SEL_0 = 3'b010;
defparam sdpb_inst_22.BLK_SEL_1 = 3'b010;
defparam sdpb_inst_22.RESET_MODE = "SYNC";

DFFRE dff_inst_0 (
  .Q(dff_q_0),
  .D(adb[14]),
  .CLK(clkb),
  .CE(ceb),
  .RESET(gw_gnd)
);
DFFRE dff_inst_1 (
  .Q(dff_q_1),
  .D(dff_q_0),
  .CLK(clkb),
  .CE(oce),
  .RESET(gw_gnd)
);
DFFRE dff_inst_2 (
  .Q(dff_q_2),
  .D(adb[13]),
  .CLK(clkb),
  .CE(ceb),
  .RESET(gw_gnd)
);
DFFRE dff_inst_3 (
  .Q(dff_q_3),
  .D(dff_q_2),
  .CLK(clkb),
  .CE(oce),
  .RESET(gw_gnd)
);
DFFRE dff_inst_4 (
  .Q(dff_q_4),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb),
  .RESET(gw_gnd)
);
DFFRE dff_inst_5 (
  .Q(dff_q_5),
  .D(dff_q_4),
  .CLK(clkb),
  .CE(oce),
  .RESET(gw_gnd)
);
DFFRE dff_inst_6 (
  .Q(dff_q_6),
  .D(adb[11]),
  .CLK(clkb),
  .CE(ceb),
  .RESET(gw_gnd)
);
DFFRE dff_inst_7 (
  .Q(dff_q_7),
  .D(dff_q_6),
  .CLK(clkb),
  .CE(oce),
  .RESET(gw_gnd)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(sdpx9b_inst_0_dout[0]),
  .I1(sdpx9b_inst_1_dout[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(sdpx9b_inst_2_dout[0]),
  .I1(sdpx9b_inst_3_dout[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_2 (
  .O(mux_o_2),
  .I0(sdpx9b_inst_4_dout[0]),
  .I1(sdpx9b_inst_5_dout[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(sdpx9b_inst_6_dout[0]),
  .I1(sdpx9b_inst_7_dout[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_5 (
  .O(mux_o_5),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_5)
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(mux_o_2),
  .I1(mux_o_3),
  .S0(dff_q_5)
);
MUX2 mux_inst_8 (
  .O(mux_o_8),
  .I0(mux_o_5),
  .I1(mux_o_6),
  .S0(dff_q_3)
);
MUX2 mux_inst_10 (
  .O(dout[0]),
  .I0(mux_o_8),
  .I1(sdpb_inst_15_dout[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(sdpx9b_inst_0_dout[1]),
  .I1(sdpx9b_inst_1_dout[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(sdpx9b_inst_2_dout[1]),
  .I1(sdpx9b_inst_3_dout[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(sdpx9b_inst_4_dout[1]),
  .I1(sdpx9b_inst_5_dout[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(sdpx9b_inst_6_dout[1]),
  .I1(sdpx9b_inst_7_dout[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(mux_o_11),
  .I1(mux_o_12),
  .S0(dff_q_5)
);
MUX2 mux_inst_17 (
  .O(mux_o_17),
  .I0(mux_o_13),
  .I1(mux_o_14),
  .S0(dff_q_5)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(mux_o_16),
  .I1(mux_o_17),
  .S0(dff_q_3)
);
MUX2 mux_inst_21 (
  .O(dout[1]),
  .I0(mux_o_19),
  .I1(sdpb_inst_15_dout[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_22 (
  .O(mux_o_22),
  .I0(sdpx9b_inst_0_dout[2]),
  .I1(sdpx9b_inst_1_dout[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_23 (
  .O(mux_o_23),
  .I0(sdpx9b_inst_2_dout[2]),
  .I1(sdpx9b_inst_3_dout[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(sdpx9b_inst_4_dout[2]),
  .I1(sdpx9b_inst_5_dout[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(sdpx9b_inst_6_dout[2]),
  .I1(sdpx9b_inst_7_dout[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(mux_o_22),
  .I1(mux_o_23),
  .S0(dff_q_5)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(mux_o_24),
  .I1(mux_o_25),
  .S0(dff_q_5)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(mux_o_27),
  .I1(mux_o_28),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(dout[2]),
  .I0(mux_o_30),
  .I1(sdpb_inst_16_dout[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(sdpx9b_inst_0_dout[3]),
  .I1(sdpx9b_inst_1_dout[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(sdpx9b_inst_2_dout[3]),
  .I1(sdpx9b_inst_3_dout[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_35 (
  .O(mux_o_35),
  .I0(sdpx9b_inst_4_dout[3]),
  .I1(sdpx9b_inst_5_dout[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(sdpx9b_inst_6_dout[3]),
  .I1(sdpx9b_inst_7_dout[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_38 (
  .O(mux_o_38),
  .I0(mux_o_33),
  .I1(mux_o_34),
  .S0(dff_q_5)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_35),
  .I1(mux_o_36),
  .S0(dff_q_5)
);
MUX2 mux_inst_41 (
  .O(mux_o_41),
  .I0(mux_o_38),
  .I1(mux_o_39),
  .S0(dff_q_3)
);
MUX2 mux_inst_43 (
  .O(dout[3]),
  .I0(mux_o_41),
  .I1(sdpb_inst_16_dout[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_44 (
  .O(mux_o_44),
  .I0(sdpx9b_inst_0_dout[4]),
  .I1(sdpx9b_inst_1_dout[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(sdpx9b_inst_2_dout[4]),
  .I1(sdpx9b_inst_3_dout[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(sdpx9b_inst_4_dout[4]),
  .I1(sdpx9b_inst_5_dout[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_47 (
  .O(mux_o_47),
  .I0(sdpx9b_inst_6_dout[4]),
  .I1(sdpx9b_inst_7_dout[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(mux_o_44),
  .I1(mux_o_45),
  .S0(dff_q_5)
);
MUX2 mux_inst_50 (
  .O(mux_o_50),
  .I0(mux_o_46),
  .I1(mux_o_47),
  .S0(dff_q_5)
);
MUX2 mux_inst_52 (
  .O(mux_o_52),
  .I0(mux_o_49),
  .I1(mux_o_50),
  .S0(dff_q_3)
);
MUX2 mux_inst_54 (
  .O(dout[4]),
  .I0(mux_o_52),
  .I1(sdpb_inst_17_dout[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_55 (
  .O(mux_o_55),
  .I0(sdpx9b_inst_0_dout[5]),
  .I1(sdpx9b_inst_1_dout[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_56 (
  .O(mux_o_56),
  .I0(sdpx9b_inst_2_dout[5]),
  .I1(sdpx9b_inst_3_dout[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(sdpx9b_inst_4_dout[5]),
  .I1(sdpx9b_inst_5_dout[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(sdpx9b_inst_6_dout[5]),
  .I1(sdpx9b_inst_7_dout[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(mux_o_55),
  .I1(mux_o_56),
  .S0(dff_q_5)
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(mux_o_57),
  .I1(mux_o_58),
  .S0(dff_q_5)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(mux_o_60),
  .I1(mux_o_61),
  .S0(dff_q_3)
);
MUX2 mux_inst_65 (
  .O(dout[5]),
  .I0(mux_o_63),
  .I1(sdpb_inst_17_dout[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_66 (
  .O(mux_o_66),
  .I0(sdpx9b_inst_0_dout[6]),
  .I1(sdpx9b_inst_1_dout[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_67 (
  .O(mux_o_67),
  .I0(sdpx9b_inst_2_dout[6]),
  .I1(sdpx9b_inst_3_dout[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_68 (
  .O(mux_o_68),
  .I0(sdpx9b_inst_4_dout[6]),
  .I1(sdpx9b_inst_5_dout[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_69 (
  .O(mux_o_69),
  .I0(sdpx9b_inst_6_dout[6]),
  .I1(sdpx9b_inst_7_dout[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_71 (
  .O(mux_o_71),
  .I0(mux_o_66),
  .I1(mux_o_67),
  .S0(dff_q_5)
);
MUX2 mux_inst_72 (
  .O(mux_o_72),
  .I0(mux_o_68),
  .I1(mux_o_69),
  .S0(dff_q_5)
);
MUX2 mux_inst_74 (
  .O(mux_o_74),
  .I0(mux_o_71),
  .I1(mux_o_72),
  .S0(dff_q_3)
);
MUX2 mux_inst_76 (
  .O(dout[6]),
  .I0(mux_o_74),
  .I1(sdpb_inst_18_dout[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_77 (
  .O(mux_o_77),
  .I0(sdpx9b_inst_0_dout[7]),
  .I1(sdpx9b_inst_1_dout[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(sdpx9b_inst_2_dout[7]),
  .I1(sdpx9b_inst_3_dout[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(sdpx9b_inst_4_dout[7]),
  .I1(sdpx9b_inst_5_dout[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_80 (
  .O(mux_o_80),
  .I0(sdpx9b_inst_6_dout[7]),
  .I1(sdpx9b_inst_7_dout[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_82 (
  .O(mux_o_82),
  .I0(mux_o_77),
  .I1(mux_o_78),
  .S0(dff_q_5)
);
MUX2 mux_inst_83 (
  .O(mux_o_83),
  .I0(mux_o_79),
  .I1(mux_o_80),
  .S0(dff_q_5)
);
MUX2 mux_inst_85 (
  .O(mux_o_85),
  .I0(mux_o_82),
  .I1(mux_o_83),
  .S0(dff_q_3)
);
MUX2 mux_inst_87 (
  .O(dout[7]),
  .I0(mux_o_85),
  .I1(sdpb_inst_18_dout[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_88 (
  .O(mux_o_88),
  .I0(sdpx9b_inst_0_dout[8]),
  .I1(sdpx9b_inst_1_dout[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_89 (
  .O(mux_o_89),
  .I0(sdpx9b_inst_2_dout[8]),
  .I1(sdpx9b_inst_3_dout[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_90 (
  .O(mux_o_90),
  .I0(sdpx9b_inst_4_dout[8]),
  .I1(sdpx9b_inst_5_dout[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_91 (
  .O(mux_o_91),
  .I0(sdpx9b_inst_6_dout[8]),
  .I1(sdpx9b_inst_7_dout[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_93 (
  .O(mux_o_93),
  .I0(mux_o_88),
  .I1(mux_o_89),
  .S0(dff_q_5)
);
MUX2 mux_inst_94 (
  .O(mux_o_94),
  .I0(mux_o_90),
  .I1(mux_o_91),
  .S0(dff_q_5)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(mux_o_93),
  .I1(mux_o_94),
  .S0(dff_q_3)
);
MUX2 mux_inst_98 (
  .O(dout[8]),
  .I0(mux_o_96),
  .I1(sdpb_inst_19_dout[8]),
  .S0(dff_q_1)
);
MUX2 mux_inst_105 (
  .O(dout[9]),
  .I0(sdpb_inst_8_dout[9]),
  .I1(sdpb_inst_19_dout[9]),
  .S0(dff_q_1)
);
MUX2 mux_inst_112 (
  .O(dout[10]),
  .I0(sdpb_inst_9_dout[10]),
  .I1(sdpb_inst_20_dout[10]),
  .S0(dff_q_1)
);
MUX2 mux_inst_119 (
  .O(dout[11]),
  .I0(sdpb_inst_10_dout[11]),
  .I1(sdpb_inst_20_dout[11]),
  .S0(dff_q_1)
);
MUX2 mux_inst_126 (
  .O(dout[12]),
  .I0(sdpb_inst_11_dout[12]),
  .I1(sdpb_inst_21_dout[12]),
  .S0(dff_q_1)
);
MUX2 mux_inst_133 (
  .O(dout[13]),
  .I0(sdpb_inst_12_dout[13]),
  .I1(sdpb_inst_21_dout[13]),
  .S0(dff_q_1)
);
MUX2 mux_inst_140 (
  .O(dout[14]),
  .I0(sdpb_inst_13_dout[14]),
  .I1(sdpb_inst_22_dout[14]),
  .S0(dff_q_1)
);
MUX2 mux_inst_147 (
  .O(dout[15]),
  .I0(sdpb_inst_14_dout[15]),
  .I1(sdpb_inst_22_dout[15]),
  .S0(dff_q_1)
);
endmodule //Gowin_SDPB
