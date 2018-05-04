// ********************************************************************
//
// Copyright (C) 1994-2016 Synopsys, Inc. All rights reserved. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.

// This code was generated by Synopsys's Synphony Model Compiler product and
// is intended for use solely by licensed users of this product.

// VERILOG created by Synphony Model Compiler L-2016.03, Build 2009R, Feb 25 2016
// Date written:             Sun Feb 11 19:07:33 2018

// ********************************************************************

// Generated from /afs/asu.edu/users/s/j/p/sjparekh/asap7_sagar/FPGA/HW1/q1.slx Version 1.11 Last modified date Sun Feb 11 11:46:41 2018
`timescale 1ns/1ns
module clock_gen(clk, rst); 
  parameter cperiod = 20;
  parameter rperiod = 100;
  parameter cperiodDiv = cperiod;
  output reg clk;
  output reg rst;

  wire [63 : 0] clockDivCounter;
  assign clockDivCounter = cperiod * cperiodDiv / 2;
  initial begin
    clk = 0;
    rst = 1;
    # (cperiod/2);  
    clk= 1;
    # (cperiod/2);  
    clk= 0;
    # (cperiod/2);  
    clk= 1;
    #(rperiod-(3*cperiod/2));  
    rst = 0;
    forever begin
    # clockDivCounter; clk = ~clk;
    end
  end
endmodule
//------------------------------------------
module clocks(clk,rst);
  parameter cperiod = 20;
  parameter rperiod = 100;
  output clk;
  output rst;
wire clk_loc, rst_loc;
  assign rst = rst_loc;
  clock_gen #(.cperiod(cperiod), .rperiod(rperiod), .cperiodDiv(1))
  cgen (.clk(clk), .rst(rst_loc)); 
endmodule
//------------------------------------------------------
module test_q1;
integer logFile;
 integer Port_OutRefFile;
 integer Port_OutOutFile; 
 integer Port_In2File; 
 integer Port_In1File; 
 integer Port_InFile; 

 initial begin
  logFile = $fopen("simlog.txt","wb");
  if (logFile ==0)
  begin
      $display("Error at creating log file");
      $finish;
    end
  Port_OutRefFile = $fopen("Outport_q1_Port_Out.dat","rb");
  if (Port_OutRefFile ==0)
    begin
      $display("Error at opening file: Outport_q1_Port_Out.dat");
      $finish;
    end
  Port_OutOutFile = $fopen("Simout_q1_Port_Out.dat","wb"); 
  if (Port_OutOutFile ==0)
    begin
      $display("Error at opening file: Simout_q1_Port_Out.dat");
      $finish;
    end
  Port_In2File = $fopen("Inport_q1_Port_In2.dat","rb");
  if (Port_In2File ==0)
    begin
      $display("Error at opening file: Inport_q1_Port_In2.dat");
      $finish;
    end
  Port_In1File = $fopen("Inport_q1_Port_In1.dat","rb");
  if (Port_In1File ==0)
    begin
      $display("Error at opening file: Inport_q1_Port_In1.dat");
      $finish;
    end
  Port_InFile = $fopen("Inport_q1_Port_In.dat","rb");
  if (Port_InFile ==0)
    begin
      $display("Error at opening file: Inport_q1_Port_In.dat");
      $finish;
    end
  end
reg isNotFirstRise1 = 0;

wire isSimulationEnd;
reg isSimulationEnd1;

wire [31:0] mismatch;
integer mismatch1=0;
integer loop_cnt1=0;

wire clk_int;
wire GlobalReset_int;
wire GlobalResetDsgn;
wire [0:0] GlobalEnable1_int;
wire [64:0] Port_Out_int;
reg [63:0] Port_In2_int;
reg [63:0] Port_In1_int;
reg [63:0] Port_In_int;
//--Instantiate design under test
`ifdef USE_CMODEL_WITH_SYSTEMC
  `define designName q1_wrapper
`else
  `define designName q1
`endif
`designName i_q1 (
    .clk(clk_int),
    .GlobalReset(GlobalResetDsgn),
    .Port_Out(Port_Out_int),
    .Port_In2(Port_In2_int),
    .Port_In1(Port_In1_int),
    .Port_In(Port_In_int)
  );
clocks #(.cperiod(50), .rperiod(500)) CL(
  .clk(clk_int),
  .rst(GlobalReset_int)
  );

  assign GlobalEnable1_int = ~GlobalReset_int;
  assign GlobalResetDsgn = GlobalReset_int;
  assign isSimulationEnd = isSimulationEnd1;

  assign mismatch = mismatch1;
  always @(posedge clk_int) begin
    isNotFirstRise1 <= 1;
  end
  //------------------------------------------------------------
  //-- Process for Rate Domain of clk 
  //-- Inputs are applied on rising edge of clock, 
  //-- Outputs are tested on falling edges.
  //------------------------------------------------------------
    reg misFlg1;
      reg [64:0] tmp_Port_Out = 0;
      reg [64:0] ref_Port_Out = 0;
      reg [63:0] tmp_Port_In2;
      reg [63:0] tmp_Port_In1;
      reg [63:0] tmp_Port_In;
//-- Apply Input Vectors -----
always @(posedge clk_int) 
  begin 
    if(isNotFirstRise1) begin
      if ($feof(Port_In2File) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(Port_In2File, "%b\n", tmp_Port_In2) < 1)
        isSimulationEnd1 = 1;  
      else
        Port_In2_int <= tmp_Port_In2;
    end
    if(isNotFirstRise1) begin
      if ($feof(Port_In1File) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(Port_In1File, "%b\n", tmp_Port_In1) < 1)
        isSimulationEnd1 = 1;  
      else
        Port_In1_int <= tmp_Port_In1;
    end
    if(isNotFirstRise1) begin
      if ($feof(Port_InFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(Port_InFile, "%b\n", tmp_Port_In) < 1)
        isSimulationEnd1 = 1;  
      else
        Port_In_int <= tmp_Port_In;
    end
  end
//-- Test Outputs-----
  always@(posedge clk_int)
    begin 
    misFlg1  = 0;
  if (GlobalReset_int==0)
    begin 
    if(loop_cnt1 >= 0) 
    begin
      if ($feof(Port_OutRefFile) != 0)
        isSimulationEnd1 = 1;  
      else 
      if ($fscanf(Port_OutRefFile, "%b\n", ref_Port_Out) < 1 )
        isSimulationEnd1 = 1;  
      else 
        begin
          tmp_Port_Out = Port_Out_int;

          $fdisplay(Port_OutOutFile, "%b",tmp_Port_Out);

          if(tmp_Port_Out !== ref_Port_Out) 
          begin
            misFlg1  = 1;
            $fdisplay(logFile, "Vector failed for port: Port_Out");
            $fdisplay(logFile, "Expecting: %b",ref_Port_Out);
            $fdisplay(logFile, "Actual:    %b",tmp_Port_Out);
          end
        end

      if(misFlg1==1)
      begin
        mismatch1 = mismatch1 + 1;
        $fdisplay(logFile, "Mismatch at clk cycle no: %d",loop_cnt1);
        $fdisplay(logFile, "--------------------------------------");
      end
    end

    loop_cnt1 <= loop_cnt1 + 1;
  end
end //always

//------------------------------------------------------------
//-- Print Final Simulation Summary --
//------------------------------------------------------------
  always@(isSimulationEnd)
  begin
    if (isSimulationEnd) 
    begin
      $display("End Simulation");
      if(mismatch == 0)
      begin
        $display("*******  Verilog Verification Successful! *******");
        $fdisplay(logFile, "*******  Verilog Verification Successful! *******");
        $display("No extra latency ");
        $fdisplay(logFile, "No extra latency ");
      end
      else
      begin
        $display("*******  Verilog Verification Failed! *******");
        $display("Failed with %d mismatches", mismatch);
        $fdisplay(logFile,"Failed with %d mismatches", mismatch);
      end 
    $finish;
    end 
  end //always
endmodule
