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
  output wire          axiStreamIn_ready,
  input  wire [31:0]   axiStreamIn_payload,
  output reg           axiStreamOut_valid,
  input  wire          axiStreamOut_ready,
  output reg  [31:0]   axiStreamOut_payload,
  input  wire          clk,
  input  wire          reset
);

  wire       [63:0]   _zz_axiStreamOut_payload;
  wire       [63:0]   _zz_axiStreamOut_payload_1;
  wire       [63:0]   _zz_axiStreamOut_payload_2;
  wire       [63:0]   _zz_axiStreamOut_payload_3;
  wire       [63:0]   _zz_axiStreamOut_payload_4;
  wire       [63:0]   _zz_axiStreamOut_payload_5;
  wire       [63:0]   _zz_axiStreamOut_payload_6;
  wire       [63:0]   _zz_axiStreamOut_payload_7;
  wire       [63:0]   _zz_axiStreamOut_payload_8;
  wire       [63:0]   _zz_axiStreamOut_payload_9;
  wire       [63:0]   _zz_axiStreamOut_payload_10;
  wire       [63:0]   _zz_axiStreamOut_payload_11;
  wire       [63:0]   _zz_axiStreamOut_payload_12;
  wire       [63:0]   _zz_axiStreamOut_payload_13;
  wire       [63:0]   _zz_axiStreamOut_payload_14;
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
  reg        [31:0]   coeffs_0;
  reg        [31:0]   coeffs_1;
  reg        [31:0]   coeffs_2;
  reg        [31:0]   coeffs_3;
  reg        [31:0]   coeffs_4;
  reg        [31:0]   coeffs_5;
  reg        [31:0]   coeffs_6;
  reg        [31:0]   coeffs_7;
  reg                 enable;
  reg        [31:0]   delregs_0;
  reg        [31:0]   delregs_1;
  reg        [31:0]   delregs_2;
  reg        [31:0]   delregs_3;
  reg        [31:0]   delregs_4;
  reg        [31:0]   delregs_5;
  reg        [31:0]   delregs_6;
  reg        [31:0]   delregs_7;
  reg                 delvals_0;
  reg                 delvals_1;
  reg                 delvals_2;
  reg                 delvals_3;
  reg                 delvals_4;
  reg                 delvals_5;
  reg                 delvals_6;
  reg                 delvals_7;

  assign _zz_axiStreamOut_payload = ($signed(_zz_axiStreamOut_payload_1) + $signed(_zz_axiStreamOut_payload_14));
  assign _zz_axiStreamOut_payload_1 = ($signed(_zz_axiStreamOut_payload_2) + $signed(_zz_axiStreamOut_payload_13));
  assign _zz_axiStreamOut_payload_2 = ($signed(_zz_axiStreamOut_payload_3) + $signed(_zz_axiStreamOut_payload_12));
  assign _zz_axiStreamOut_payload_3 = ($signed(_zz_axiStreamOut_payload_4) + $signed(_zz_axiStreamOut_payload_11));
  assign _zz_axiStreamOut_payload_4 = ($signed(_zz_axiStreamOut_payload_5) + $signed(_zz_axiStreamOut_payload_10));
  assign _zz_axiStreamOut_payload_5 = ($signed(_zz_axiStreamOut_payload_6) + $signed(_zz_axiStreamOut_payload_9));
  assign _zz_axiStreamOut_payload_6 = ($signed(_zz_axiStreamOut_payload_7) + $signed(_zz_axiStreamOut_payload_8));
  assign _zz_axiStreamOut_payload_7 = ($signed(delregs_0) * $signed(coeffs_0));
  assign _zz_axiStreamOut_payload_8 = ($signed(delregs_1) * $signed(coeffs_1));
  assign _zz_axiStreamOut_payload_9 = ($signed(delregs_2) * $signed(coeffs_2));
  assign _zz_axiStreamOut_payload_10 = ($signed(delregs_3) * $signed(coeffs_3));
  assign _zz_axiStreamOut_payload_11 = ($signed(delregs_4) * $signed(coeffs_4));
  assign _zz_axiStreamOut_payload_12 = ($signed(delregs_5) * $signed(coeffs_5));
  assign _zz_axiStreamOut_payload_13 = ($signed(delregs_6) * $signed(coeffs_6));
  assign _zz_axiStreamOut_payload_14 = ($signed(delregs_7) * $signed(coeffs_7));
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
        slv_readRsp_data[31 : 0] = coeffs_0;
      end
      6'h04 : begin
        slv_readRsp_data[31 : 0] = coeffs_1;
      end
      6'h08 : begin
        slv_readRsp_data[31 : 0] = coeffs_2;
      end
      6'h0c : begin
        slv_readRsp_data[31 : 0] = coeffs_3;
      end
      6'h10 : begin
        slv_readRsp_data[31 : 0] = coeffs_4;
      end
      6'h14 : begin
        slv_readRsp_data[31 : 0] = coeffs_5;
      end
      6'h18 : begin
        slv_readRsp_data[31 : 0] = coeffs_6;
      end
      6'h1c : begin
        slv_readRsp_data[31 : 0] = coeffs_7;
      end
      6'h20 : begin
        slv_readRsp_data[0 : 0] = enable;
      end
      default : begin
      end
    endcase
  end

  assign slv_readAddressMasked = (slv_readDataStage_payload_addr & (~ 6'h03));
  assign slv_writeAddressMasked = (axi_aw_payload_addr & (~ 6'h03));
  assign slv_readOccur = (axi_r_valid && axi_r_ready);
  assign axiStreamIn_ready = enable;
  always @(*) begin
    axiStreamOut_valid = 1'b0;
    if(enable) begin
      axiStreamOut_valid = delvals_7;
    end
  end

  always @(*) begin
    axiStreamOut_payload = 32'h00000000;
    if(enable) begin
      axiStreamOut_payload = _zz_axiStreamOut_payload[31:0];
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_axi_b_valid_1 <= 1'b0;
      axi_ar_rValid <= 1'b0;
      coeffs_0 <= 32'h00000000;
      coeffs_1 <= 32'h00000000;
      coeffs_2 <= 32'h00000000;
      coeffs_3 <= 32'h00000000;
      coeffs_4 <= 32'h00000000;
      coeffs_5 <= 32'h00000000;
      coeffs_6 <= 32'h00000000;
      coeffs_7 <= 32'h00000000;
      enable <= 1'b0;
      delregs_0 <= 32'h00000000;
      delregs_1 <= 32'h00000000;
      delregs_2 <= 32'h00000000;
      delregs_3 <= 32'h00000000;
      delregs_4 <= 32'h00000000;
      delregs_5 <= 32'h00000000;
      delregs_6 <= 32'h00000000;
      delregs_7 <= 32'h00000000;
      delvals_0 <= 1'b0;
      delvals_1 <= 1'b0;
      delvals_2 <= 1'b0;
      delvals_3 <= 1'b0;
      delvals_4 <= 1'b0;
      delvals_5 <= 1'b0;
      delvals_6 <= 1'b0;
      delvals_7 <= 1'b0;
    end else begin
      if(_zz_slv_writeJoinEvent_translated_ready_1) begin
        _zz_axi_b_valid_1 <= (slv_writeJoinEvent_translated_valid && _zz_slv_writeJoinEvent_translated_ready);
      end
      if(axi_ar_ready) begin
        axi_ar_rValid <= axi_ar_valid;
      end
      if(enable) begin
        delvals_0 <= axiStreamIn_valid;
        delregs_0 <= axiStreamIn_payload;
        delvals_1 <= delvals_0;
        if(delvals_0) begin
          delregs_1 <= delregs_0;
        end
        delvals_2 <= delvals_1;
        if(delvals_1) begin
          delregs_2 <= delregs_1;
        end
        delvals_3 <= delvals_2;
        if(delvals_2) begin
          delregs_3 <= delregs_2;
        end
        delvals_4 <= delvals_3;
        if(delvals_3) begin
          delregs_4 <= delregs_3;
        end
        delvals_5 <= delvals_4;
        if(delvals_4) begin
          delregs_5 <= delregs_4;
        end
        delvals_6 <= delvals_5;
        if(delvals_5) begin
          delregs_6 <= delregs_5;
        end
        delvals_7 <= delvals_6;
        if(delvals_6) begin
          delregs_7 <= delregs_6;
        end
      end
      case(slv_writeAddressMasked)
        6'h00 : begin
          if(slv_writeOccur) begin
            coeffs_0 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h04 : begin
          if(slv_writeOccur) begin
            coeffs_1 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h08 : begin
          if(slv_writeOccur) begin
            coeffs_2 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h0c : begin
          if(slv_writeOccur) begin
            coeffs_3 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h10 : begin
          if(slv_writeOccur) begin
            coeffs_4 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h14 : begin
          if(slv_writeOccur) begin
            coeffs_5 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h18 : begin
          if(slv_writeOccur) begin
            coeffs_6 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h1c : begin
          if(slv_writeOccur) begin
            coeffs_7 <= axi_w_payload_data[31 : 0];
          end
        end
        6'h20 : begin
          if(slv_writeOccur) begin
            enable <= axi_w_payload_data[0];
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
