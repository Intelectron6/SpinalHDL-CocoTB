// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : Axi4Lite_IP

`timescale 1ns/1ps

module Axi4Lite_IP (
  input  wire          axi_aw_valid,
  output wire          axi_aw_ready,
  input  wire [5:0]    axi_aw_payload_addr,
  input  wire [2:0]    axi_aw_payload_prot,
  input  wire          axi_w_valid,
  output wire          axi_w_ready,
  input  wire [31:0]   axi_w_payload_data,
  input  wire [3:0]    axi_w_payload_strb,
  output wire          axi_b_valid,
  input  wire          axi_b_ready,
  output wire [1:0]    axi_b_payload_resp,
  input  wire          axi_ar_valid,
  output reg           axi_ar_ready,
  input  wire [5:0]    axi_ar_payload_addr,
  input  wire [2:0]    axi_ar_payload_prot,
  output wire          axi_r_valid,
  input  wire          axi_r_ready,
  output wire [31:0]   axi_r_payload_data,
  output wire [1:0]    axi_r_payload_resp,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_stateA = 3'd1;
  localparam fsm_enumDef_stateB = 3'd2;
  localparam fsm_enumDef_stateC = 3'd3;
  localparam fsm_enumDef_stateD = 3'd4;

  wire       [23:0]   _zz_result;
  wire       [15:0]   _zz_result_1;
  wire       [15:0]   _zz_result_2;
  wire       [15:0]   _zz_result_3;
  wire                slv_readErrorFlag;
  wire                slv_writeErrorFlag;
  wire                slv_readHaltRequest;
  wire                slv_writeHaltRequest;
  wire                slv_writeJoinEvent_valid;
  wire                slv_writeJoinEvent_ready;
  wire                slv_writeOccur;
  reg        [1:0]    slv_writeRsp_resp;
  wire                slv_writeJoinEvent_translated_valid;
  wire                slv_writeJoinEvent_translated_ready;
  wire       [1:0]    slv_writeJoinEvent_translated_payload_resp;
  wire                _zz_slv_writeJoinEvent_translated_ready;
  reg                 _zz_slv_writeJoinEvent_translated_ready_1;
  wire                _zz_axi_b_valid;
  reg                 _zz_axi_b_valid_1;
  reg        [1:0]    _zz_axi_b_payload_resp;
  wire                when_Stream_l369;
  wire                slv_readDataStage_valid;
  wire                slv_readDataStage_ready;
  wire       [5:0]    slv_readDataStage_payload_addr;
  wire       [2:0]    slv_readDataStage_payload_prot;
  reg                 axi_ar_rValid;
  reg        [5:0]    axi_ar_rData_addr;
  reg        [2:0]    axi_ar_rData_prot;
  wire                when_Stream_l369_1;
  reg        [31:0]   slv_readRsp_data;
  reg        [1:0]    slv_readRsp_resp;
  wire                _zz_axi_r_valid;
  wire       [5:0]    slv_readAddressMasked;
  wire       [5:0]    slv_writeAddressMasked;
  wire                slv_readOccur;
  reg        [31:0]   regs_0;
  reg        [31:0]   regs_1;
  reg        [31:0]   regs_2;
  reg        [31:0]   regs_3;
  reg        [31:0]   regs_4;
  reg        [31:0]   regs_5;
  reg        [31:0]   regs_6;
  reg        [31:0]   regs_7;
  reg        [31:0]   regs_8;
  reg        [31:0]   regs_9;
  reg        [31:0]   regs_10;
  reg        [31:0]   regs_11;
  reg        [23:0]   result;
  reg        [7:0]    a;
  reg        [7:0]    b;
  reg        [7:0]    c;
  reg        [7:0]    d;
  reg        [7:0]    e;
  reg        [0:0]    indreg;
  reg                 comp_en;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  wire                when_MyTopLevel_l136;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_MyTopLevel_l60;
  wire                when_MyTopLevel_l62;
  `ifndef SYNTHESIS
  reg [47:0] fsm_stateReg_string;
  reg [47:0] fsm_stateNext_string;
  `endif


  assign _zz_result = ($signed(a) * $signed(_zz_result_1));
  assign _zz_result_1 = ($signed(_zz_result_2) - $signed(_zz_result_3));
  assign _zz_result_2 = ($signed(b) * $signed(c));
  assign _zz_result_3 = ($signed(d) * $signed(e));
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT  ";
      fsm_enumDef_stateA : fsm_stateReg_string = "stateA";
      fsm_enumDef_stateB : fsm_stateReg_string = "stateB";
      fsm_enumDef_stateC : fsm_stateReg_string = "stateC";
      fsm_enumDef_stateD : fsm_stateReg_string = "stateD";
      default : fsm_stateReg_string = "??????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT  ";
      fsm_enumDef_stateA : fsm_stateNext_string = "stateA";
      fsm_enumDef_stateB : fsm_stateNext_string = "stateB";
      fsm_enumDef_stateC : fsm_stateNext_string = "stateC";
      fsm_enumDef_stateD : fsm_stateNext_string = "stateD";
      default : fsm_stateNext_string = "??????";
    endcase
  end
  `endif

  assign slv_readErrorFlag = 1'b0;
  assign slv_writeErrorFlag = 1'b0;
  assign slv_readHaltRequest = 1'b0;
  assign slv_writeHaltRequest = 1'b0;
  assign slv_writeOccur = (slv_writeJoinEvent_valid && slv_writeJoinEvent_ready);
  assign slv_writeJoinEvent_valid = (axi_aw_valid && axi_w_valid);
  assign axi_aw_ready = slv_writeOccur;
  assign axi_w_ready = slv_writeOccur;
  assign slv_writeJoinEvent_translated_valid = slv_writeJoinEvent_valid;
  assign slv_writeJoinEvent_ready = slv_writeJoinEvent_translated_ready;
  assign slv_writeJoinEvent_translated_payload_resp = slv_writeRsp_resp;
  assign _zz_slv_writeJoinEvent_translated_ready = (! slv_writeHaltRequest);
  assign slv_writeJoinEvent_translated_ready = (_zz_slv_writeJoinEvent_translated_ready_1 && _zz_slv_writeJoinEvent_translated_ready);
  always @(*) begin
    _zz_slv_writeJoinEvent_translated_ready_1 = axi_b_ready;
    if(when_Stream_l369) begin
      _zz_slv_writeJoinEvent_translated_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l369 = (! _zz_axi_b_valid);
  assign _zz_axi_b_valid = _zz_axi_b_valid_1;
  assign axi_b_valid = _zz_axi_b_valid;
  assign axi_b_payload_resp = _zz_axi_b_payload_resp;
  always @(*) begin
    axi_ar_ready = slv_readDataStage_ready;
    if(when_Stream_l369_1) begin
      axi_ar_ready = 1'b1;
    end
  end

  assign when_Stream_l369_1 = (! slv_readDataStage_valid);
  assign slv_readDataStage_valid = axi_ar_rValid;
  assign slv_readDataStage_payload_addr = axi_ar_rData_addr;
  assign slv_readDataStage_payload_prot = axi_ar_rData_prot;
  assign _zz_axi_r_valid = (! slv_readHaltRequest);
  assign slv_readDataStage_ready = (axi_r_ready && _zz_axi_r_valid);
  assign axi_r_valid = (slv_readDataStage_valid && _zz_axi_r_valid);
  assign axi_r_payload_data = slv_readRsp_data;
  assign axi_r_payload_resp = slv_readRsp_resp;
  always @(*) begin
    if(slv_writeErrorFlag) begin
      slv_writeRsp_resp = 2'b10;
    end else begin
      slv_writeRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    if(slv_readErrorFlag) begin
      slv_readRsp_resp = 2'b10;
    end else begin
      slv_readRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    slv_readRsp_data = 32'h00000000;
    case(slv_readAddressMasked)
      6'h00 : begin
        slv_readRsp_data[31 : 0] = regs_0;
      end
      6'h04 : begin
        slv_readRsp_data[31 : 0] = regs_1;
      end
      6'h08 : begin
        slv_readRsp_data[31 : 0] = regs_2;
      end
      6'h0c : begin
        slv_readRsp_data[31 : 0] = regs_3;
      end
      6'h10 : begin
        slv_readRsp_data[31 : 0] = regs_4;
      end
      6'h14 : begin
        slv_readRsp_data[31 : 0] = regs_5;
      end
      6'h18 : begin
        slv_readRsp_data[31 : 0] = regs_6;
      end
      6'h1c : begin
        slv_readRsp_data[31 : 0] = regs_7;
      end
      6'h20 : begin
        slv_readRsp_data[31 : 0] = regs_8;
      end
      6'h24 : begin
        slv_readRsp_data[31 : 0] = regs_9;
      end
      6'h28 : begin
        slv_readRsp_data[31 : 0] = regs_10;
      end
      6'h2c : begin
        slv_readRsp_data[31 : 0] = regs_11;
      end
      default : begin
      end
    endcase
  end

  assign slv_readAddressMasked = (slv_readDataStage_payload_addr & (~ 6'h03));
  assign slv_writeAddressMasked = (axi_aw_payload_addr & (~ 6'h03));
  assign slv_readOccur = (axi_r_valid && axi_r_ready);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
      end
      fsm_enumDef_stateB : begin
      end
      fsm_enumDef_stateC : begin
      end
      fsm_enumDef_stateD : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    comp_en = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
        comp_en = 1'b0;
      end
      fsm_enumDef_stateB : begin
        comp_en = 1'b1;
      end
      fsm_enumDef_stateC : begin
        comp_en = 1'b1;
      end
      fsm_enumDef_stateD : begin
        comp_en = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    a = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
      end
      fsm_enumDef_stateB : begin
        a = regs_0[7:0];
      end
      fsm_enumDef_stateC : begin
        a = regs_1[7:0];
      end
      fsm_enumDef_stateD : begin
        a = regs_2[7:0];
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    b = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
      end
      fsm_enumDef_stateB : begin
        b = regs_4[7:0];
      end
      fsm_enumDef_stateC : begin
        b = regs_6[7:0];
      end
      fsm_enumDef_stateD : begin
        b = regs_3[7:0];
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    c = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
      end
      fsm_enumDef_stateB : begin
        c = regs_8[7:0];
      end
      fsm_enumDef_stateC : begin
        c = regs_5[7:0];
      end
      fsm_enumDef_stateD : begin
        c = regs_7[7:0];
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    d = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
      end
      fsm_enumDef_stateB : begin
        d = regs_7[7:0];
      end
      fsm_enumDef_stateC : begin
        d = regs_8[7:0];
      end
      fsm_enumDef_stateD : begin
        d = regs_4[7:0];
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    e = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
      end
      fsm_enumDef_stateB : begin
        e = regs_5[7:0];
      end
      fsm_enumDef_stateC : begin
        e = regs_3[7:0];
      end
      fsm_enumDef_stateD : begin
        e = regs_6[7:0];
      end
      default : begin
      end
    endcase
  end

  assign when_MyTopLevel_l136 = (comp_en == 1'b1);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_stateA : begin
        if(when_MyTopLevel_l60) begin
          if(!when_MyTopLevel_l62) begin
            fsm_stateNext = fsm_enumDef_stateB;
          end
        end
      end
      fsm_enumDef_stateB : begin
        fsm_stateNext = fsm_enumDef_stateC;
      end
      fsm_enumDef_stateC : begin
        fsm_stateNext = fsm_enumDef_stateD;
      end
      fsm_enumDef_stateD : begin
        fsm_stateNext = fsm_enumDef_stateA;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_stateA;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_MyTopLevel_l60 = ($signed(regs_10) == $signed(32'h00000001));
  assign when_MyTopLevel_l62 = (indreg == 1'b1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_axi_b_valid_1 <= 1'b0;
      axi_ar_rValid <= 1'b0;
      regs_0 <= 32'h00000000;
      regs_1 <= 32'h00000000;
      regs_2 <= 32'h00000000;
      regs_3 <= 32'h00000000;
      regs_4 <= 32'h00000000;
      regs_5 <= 32'h00000000;
      regs_6 <= 32'h00000000;
      regs_7 <= 32'h00000000;
      regs_8 <= 32'h00000000;
      regs_9 <= 32'h00000000;
      regs_10 <= 32'h00000000;
      regs_11 <= 32'h00000000;
      result <= 24'h000000;
      indreg <= 1'b0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      if(_zz_slv_writeJoinEvent_translated_ready_1) begin
        _zz_axi_b_valid_1 <= (slv_writeJoinEvent_translated_valid && _zz_slv_writeJoinEvent_translated_ready);
      end
      if(axi_ar_ready) begin
        axi_ar_rValid <= axi_ar_valid;
      end
      if(when_MyTopLevel_l136) begin
        result <= ($signed(result) + $signed(_zz_result));
      end
      case(slv_writeAddressMasked)
        6'h00 : begin
          if(slv_writeOccur) begin
            regs_0 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h04 : begin
          if(slv_writeOccur) begin
            regs_1 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h08 : begin
          if(slv_writeOccur) begin
            regs_2 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h0c : begin
          if(slv_writeOccur) begin
            regs_3 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h10 : begin
          if(slv_writeOccur) begin
            regs_4 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h14 : begin
          if(slv_writeOccur) begin
            regs_5 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h18 : begin
          if(slv_writeOccur) begin
            regs_6 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h1c : begin
          if(slv_writeOccur) begin
            regs_7 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h20 : begin
          if(slv_writeOccur) begin
            regs_8 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h24 : begin
          if(slv_writeOccur) begin
            regs_9 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h28 : begin
          if(slv_writeOccur) begin
            regs_10 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h2c : begin
          if(slv_writeOccur) begin
            regs_11 <= axi_w_payload_data[31 : 0];
          end
        end
        default : begin
        end
      endcase
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_stateA : begin
          if(when_MyTopLevel_l60) begin
            if(when_MyTopLevel_l62) begin
              regs_9 <= {{8{result[23]}}, result};
              regs_10 <= 32'h00000000;
              regs_11 <= 32'h00000002;
            end else begin
              regs_9 <= 32'h00000000;
              regs_11 <= 32'h00000001;
            end
          end
        end
        fsm_enumDef_stateB : begin
        end
        fsm_enumDef_stateC : begin
        end
        fsm_enumDef_stateD : begin
          indreg <= 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(_zz_slv_writeJoinEvent_translated_ready_1) begin
      _zz_axi_b_payload_resp <= slv_writeJoinEvent_translated_payload_resp;
    end
    if(axi_ar_ready) begin
      axi_ar_rData_addr <= axi_ar_payload_addr;
      axi_ar_rData_prot <= axi_ar_payload_prot;
    end
  end


endmodule
