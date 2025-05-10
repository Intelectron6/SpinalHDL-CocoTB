// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : FIR_Filter_IP

`timescale 1ns/1ps

module FIR_Filter_IP (
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
  input  wire          axiStreamIn_valid,
  output reg           axiStreamIn_ready,
  input  wire [31:0]   axiStreamIn_payload,
  output reg           axiStreamOut_valid,
  input  wire          axiStreamOut_ready,
  output reg  [31:0]   axiStreamOut_payload,
  input  wire          clk,
  input  wire          reset
);

  wire       [63:0]   _zz_prodregs_0;
  wire       [63:0]   _zz_prodregs_1;
  wire       [63:0]   _zz_prodregs_2;
  wire       [63:0]   _zz_prodregs_3;
  wire       [63:0]   _zz_prodregs_4;
  wire       [63:0]   _zz_prodregs_5;
  wire       [63:0]   _zz_prodregs_6;
  wire       [63:0]   _zz_prodregs_7;
  wire       [31:0]   _zz_axiStreamOut_payload;
  wire       [31:0]   _zz_axiStreamOut_payload_1;
  wire       [31:0]   _zz_axiStreamOut_payload_2;
  wire       [31:0]   _zz_axiStreamOut_payload_3;
  wire       [31:0]   _zz_axiStreamOut_payload_4;
  wire       [31:0]   _zz_axiStreamOut_payload_5;
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
  reg        [31:0]   delregs_0;
  reg        [31:0]   delregs_1;
  reg        [31:0]   delregs_2;
  reg        [31:0]   delregs_3;
  reg        [31:0]   delregs_4;
  reg        [31:0]   delregs_5;
  reg        [31:0]   delregs_6;
  wire       [31:0]   delregs_7;
  reg                 delvals_0;
  reg                 delvals_1;
  reg                 delvals_2;
  reg                 delvals_3;
  reg                 delvals_4;
  reg                 delvals_5;
  reg                 delvals_6;
  reg                 delvals_7;
  reg        [31:0]   prodregs_0;
  reg        [31:0]   prodregs_1;
  reg        [31:0]   prodregs_2;
  reg        [31:0]   prodregs_3;
  reg        [31:0]   prodregs_4;
  reg        [31:0]   prodregs_5;
  reg        [31:0]   prodregs_6;
  reg        [31:0]   prodregs_7;
  wire                when_MyTopLevel_l25;

  assign _zz_prodregs_0 = ($signed(axiStreamIn_payload) * $signed(regs_0));
  assign _zz_prodregs_1 = ($signed(delregs_0) * $signed(regs_1));
  assign _zz_prodregs_2 = ($signed(delregs_1) * $signed(regs_2));
  assign _zz_prodregs_3 = ($signed(delregs_2) * $signed(regs_3));
  assign _zz_prodregs_4 = ($signed(delregs_3) * $signed(regs_4));
  assign _zz_prodregs_5 = ($signed(delregs_4) * $signed(regs_5));
  assign _zz_prodregs_6 = ($signed(delregs_5) * $signed(regs_6));
  assign _zz_prodregs_7 = ($signed(delregs_6) * $signed(regs_7));
  assign _zz_axiStreamOut_payload = ($signed(_zz_axiStreamOut_payload_1) + $signed(prodregs_6));
  assign _zz_axiStreamOut_payload_1 = ($signed(_zz_axiStreamOut_payload_2) + $signed(prodregs_5));
  assign _zz_axiStreamOut_payload_2 = ($signed(_zz_axiStreamOut_payload_3) + $signed(prodregs_4));
  assign _zz_axiStreamOut_payload_3 = ($signed(_zz_axiStreamOut_payload_4) + $signed(prodregs_3));
  assign _zz_axiStreamOut_payload_4 = ($signed(_zz_axiStreamOut_payload_5) + $signed(prodregs_2));
  assign _zz_axiStreamOut_payload_5 = ($signed(prodregs_0) + $signed(prodregs_1));
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
      default : begin
      end
    endcase
  end

  assign slv_readAddressMasked = (slv_readDataStage_payload_addr & (~ 6'h03));
  assign slv_writeAddressMasked = (axi_aw_payload_addr & (~ 6'h03));
  assign slv_readOccur = (axi_r_valid && axi_r_ready);
  assign delregs_7 = 32'h00000000;
  assign when_MyTopLevel_l25 = ($signed(regs_8) == $signed(32'h00000001));
  always @(*) begin
    if(when_MyTopLevel_l25) begin
      axiStreamIn_ready = 1'b1;
    end else begin
      axiStreamIn_ready = 1'b0;
    end
  end

  always @(*) begin
    if(when_MyTopLevel_l25) begin
      axiStreamOut_valid = delvals_7;
    end else begin
      axiStreamOut_valid = 1'b0;
    end
  end

  always @(*) begin
    if(when_MyTopLevel_l25) begin
      if(delvals_7) begin
        axiStreamOut_payload = ($signed(_zz_axiStreamOut_payload) + $signed(prodregs_7));
      end else begin
        axiStreamOut_payload = 32'h00000000;
      end
    end else begin
      axiStreamOut_payload = 32'h00000000;
    end
  end

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
      delregs_0 <= 32'h00000000;
      delregs_1 <= 32'h00000000;
      delregs_2 <= 32'h00000000;
      delregs_3 <= 32'h00000000;
      delregs_4 <= 32'h00000000;
      delregs_5 <= 32'h00000000;
      delregs_6 <= 32'h00000000;
      delvals_0 <= 1'b0;
      delvals_1 <= 1'b0;
      delvals_2 <= 1'b0;
      delvals_3 <= 1'b0;
      delvals_4 <= 1'b0;
      delvals_5 <= 1'b0;
      delvals_6 <= 1'b0;
      delvals_7 <= 1'b0;
      prodregs_0 <= 32'h00000000;
      prodregs_1 <= 32'h00000000;
      prodregs_2 <= 32'h00000000;
      prodregs_3 <= 32'h00000000;
      prodregs_4 <= 32'h00000000;
      prodregs_5 <= 32'h00000000;
      prodregs_6 <= 32'h00000000;
      prodregs_7 <= 32'h00000000;
    end else begin
      if(_zz_slv_writeJoinEvent_translated_ready_1) begin
        _zz_axi_b_valid_1 <= (slv_writeJoinEvent_translated_valid && _zz_slv_writeJoinEvent_translated_ready);
      end
      if(axi_ar_ready) begin
        axi_ar_rValid <= axi_ar_valid;
      end
      if(when_MyTopLevel_l25) begin
        delvals_0 <= axiStreamIn_valid;
        delvals_1 <= delvals_0;
        delvals_2 <= delvals_1;
        delvals_3 <= delvals_2;
        delvals_4 <= delvals_3;
        delvals_5 <= delvals_4;
        delvals_6 <= delvals_5;
        delvals_7 <= delvals_6;
        if(axiStreamIn_valid) begin
          delregs_0 <= axiStreamIn_payload;
          prodregs_0 <= _zz_prodregs_0[31:0];
        end
        if(delvals_0) begin
          delregs_1 <= delregs_0;
          prodregs_1 <= _zz_prodregs_1[31:0];
        end
        if(delvals_1) begin
          delregs_2 <= delregs_1;
          prodregs_2 <= _zz_prodregs_2[31:0];
        end
        if(delvals_2) begin
          delregs_3 <= delregs_2;
          prodregs_3 <= _zz_prodregs_3[31:0];
        end
        if(delvals_3) begin
          delregs_4 <= delregs_3;
          prodregs_4 <= _zz_prodregs_4[31:0];
        end
        if(delvals_4) begin
          delregs_5 <= delregs_4;
          prodregs_5 <= _zz_prodregs_5[31:0];
        end
        if(delvals_5) begin
          delregs_6 <= delregs_5;
          prodregs_6 <= _zz_prodregs_6[31:0];
        end
        if(delvals_6) begin
          prodregs_7 <= _zz_prodregs_7[31:0];
        end
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
