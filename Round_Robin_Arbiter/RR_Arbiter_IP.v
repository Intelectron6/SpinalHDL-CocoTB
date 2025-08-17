// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RR_Arbiter_IP
// Git hash  : a3cad67cdd6e880bfcdf517cb992623891ce44ca

`timescale 1ns/1ps

module RR_Arbiter_IP (
  input  wire          io_axiStreamIn1_valid,
  output reg           io_axiStreamIn1_ready,
  input  wire [31:0]   io_axiStreamIn1_payload_data,
  input  wire          io_axiStreamIn1_payload_last,
  input  wire          io_axiStreamIn2_valid,
  output reg           io_axiStreamIn2_ready,
  input  wire [31:0]   io_axiStreamIn2_payload_data,
  input  wire          io_axiStreamIn2_payload_last,
  input  wire          io_axiStreamIn3_valid,
  output reg           io_axiStreamIn3_ready,
  input  wire [31:0]   io_axiStreamIn3_payload_data,
  input  wire          io_axiStreamIn3_payload_last,
  output reg           io_axiStreamOut_valid,
  input  wire          io_axiStreamOut_ready,
  output reg  [31:0]   io_axiStreamOut_payload_data,
  output reg           io_axiStreamOut_payload_last,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_IDLE = 3'd1;
  localparam fsm_enumDef_S1_ACTIVE = 3'd2;
  localparam fsm_enumDef_S2_ACTIVE = 3'd3;
  localparam fsm_enumDef_S3_ACTIVE = 3'd4;

  reg        [1:0]    rrPtr;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                io_axiStreamIn1_fire;
  wire                when_MyTopLevel_l72;
  wire                io_axiStreamIn2_fire;
  wire                when_MyTopLevel_l84;
  wire                io_axiStreamIn3_fire;
  wire                when_MyTopLevel_l96;
  `ifndef SYNTHESIS
  reg [71:0] fsm_stateReg_string;
  reg [71:0] fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT     ";
      fsm_enumDef_IDLE : fsm_stateReg_string = "IDLE     ";
      fsm_enumDef_S1_ACTIVE : fsm_stateReg_string = "S1_ACTIVE";
      fsm_enumDef_S2_ACTIVE : fsm_stateReg_string = "S2_ACTIVE";
      fsm_enumDef_S3_ACTIVE : fsm_stateReg_string = "S3_ACTIVE";
      default : fsm_stateReg_string = "?????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT     ";
      fsm_enumDef_IDLE : fsm_stateNext_string = "IDLE     ";
      fsm_enumDef_S1_ACTIVE : fsm_stateNext_string = "S1_ACTIVE";
      fsm_enumDef_S2_ACTIVE : fsm_stateNext_string = "S2_ACTIVE";
      fsm_enumDef_S3_ACTIVE : fsm_stateNext_string = "S3_ACTIVE";
      default : fsm_stateNext_string = "?????????";
    endcase
  end
  `endif

  always @(*) begin
    io_axiStreamOut_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
        io_axiStreamOut_valid = io_axiStreamIn1_valid;
      end
      fsm_enumDef_S2_ACTIVE : begin
        io_axiStreamOut_valid = io_axiStreamIn2_valid;
      end
      fsm_enumDef_S3_ACTIVE : begin
        io_axiStreamOut_valid = io_axiStreamIn3_valid;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axiStreamOut_payload_data = 32'h00000000;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
        io_axiStreamOut_payload_data = io_axiStreamIn1_payload_data;
      end
      fsm_enumDef_S2_ACTIVE : begin
        io_axiStreamOut_payload_data = io_axiStreamIn2_payload_data;
      end
      fsm_enumDef_S3_ACTIVE : begin
        io_axiStreamOut_payload_data = io_axiStreamIn3_payload_data;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axiStreamOut_payload_last = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
        io_axiStreamOut_payload_last = io_axiStreamIn1_payload_last;
      end
      fsm_enumDef_S2_ACTIVE : begin
        io_axiStreamOut_payload_last = io_axiStreamIn2_payload_last;
      end
      fsm_enumDef_S3_ACTIVE : begin
        io_axiStreamOut_payload_last = io_axiStreamIn3_payload_last;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axiStreamIn1_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
        io_axiStreamIn1_ready = io_axiStreamOut_ready;
      end
      fsm_enumDef_S2_ACTIVE : begin
      end
      fsm_enumDef_S3_ACTIVE : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axiStreamIn2_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
      end
      fsm_enumDef_S2_ACTIVE : begin
        io_axiStreamIn2_ready = io_axiStreamOut_ready;
      end
      fsm_enumDef_S3_ACTIVE : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axiStreamIn3_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
      end
      fsm_enumDef_S2_ACTIVE : begin
      end
      fsm_enumDef_S3_ACTIVE : begin
        io_axiStreamIn3_ready = io_axiStreamOut_ready;
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_S1_ACTIVE : begin
      end
      fsm_enumDef_S2_ACTIVE : begin
      end
      fsm_enumDef_S3_ACTIVE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        case(rrPtr)
          2'b00 : begin
            if(io_axiStreamIn1_valid) begin
              fsm_stateNext = fsm_enumDef_S1_ACTIVE;
            end else begin
              if(io_axiStreamIn2_valid) begin
                fsm_stateNext = fsm_enumDef_S2_ACTIVE;
              end else begin
                if(io_axiStreamIn3_valid) begin
                  fsm_stateNext = fsm_enumDef_S3_ACTIVE;
                end
              end
            end
          end
          2'b01 : begin
            if(io_axiStreamIn2_valid) begin
              fsm_stateNext = fsm_enumDef_S2_ACTIVE;
            end else begin
              if(io_axiStreamIn3_valid) begin
                fsm_stateNext = fsm_enumDef_S3_ACTIVE;
              end else begin
                if(io_axiStreamIn1_valid) begin
                  fsm_stateNext = fsm_enumDef_S1_ACTIVE;
                end
              end
            end
          end
          2'b10 : begin
            if(io_axiStreamIn3_valid) begin
              fsm_stateNext = fsm_enumDef_S3_ACTIVE;
            end else begin
              if(io_axiStreamIn1_valid) begin
                fsm_stateNext = fsm_enumDef_S1_ACTIVE;
              end else begin
                if(io_axiStreamIn2_valid) begin
                  fsm_stateNext = fsm_enumDef_S2_ACTIVE;
                end
              end
            end
          end
          default : begin
          end
        endcase
      end
      fsm_enumDef_S1_ACTIVE : begin
        if(when_MyTopLevel_l72) begin
          fsm_stateNext = fsm_enumDef_IDLE;
        end
      end
      fsm_enumDef_S2_ACTIVE : begin
        if(when_MyTopLevel_l84) begin
          fsm_stateNext = fsm_enumDef_IDLE;
        end
      end
      fsm_enumDef_S3_ACTIVE : begin
        if(when_MyTopLevel_l96) begin
          fsm_stateNext = fsm_enumDef_IDLE;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign io_axiStreamIn1_fire = (io_axiStreamIn1_valid && io_axiStreamIn1_ready);
  assign when_MyTopLevel_l72 = (io_axiStreamIn1_fire && io_axiStreamIn1_payload_last);
  assign io_axiStreamIn2_fire = (io_axiStreamIn2_valid && io_axiStreamIn2_ready);
  assign when_MyTopLevel_l84 = (io_axiStreamIn2_fire && io_axiStreamIn2_payload_last);
  assign io_axiStreamIn3_fire = (io_axiStreamIn3_valid && io_axiStreamIn3_ready);
  assign when_MyTopLevel_l96 = (io_axiStreamIn3_fire && io_axiStreamIn3_payload_last);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rrPtr <= 2'b00;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_IDLE : begin
        end
        fsm_enumDef_S1_ACTIVE : begin
          if(when_MyTopLevel_l72) begin
            rrPtr <= 2'b01;
          end
        end
        fsm_enumDef_S2_ACTIVE : begin
          if(when_MyTopLevel_l84) begin
            rrPtr <= 2'b10;
          end
        end
        fsm_enumDef_S3_ACTIVE : begin
          if(when_MyTopLevel_l96) begin
            rrPtr <= 2'b00;
          end
        end
        default : begin
        end
      endcase
    end
  end
endmodule
