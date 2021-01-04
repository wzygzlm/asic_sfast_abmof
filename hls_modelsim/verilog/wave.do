set designtopgroup "Design Top Signals"
add wave -group $designtopgroup
set clockgroup "Clock"
add wave -group $designtopgroup -group $clockgroup
add wave -group $designtopgroup -group $clockgroup /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ap_clk
set resetgroup "Reset"
add wave -group $designtopgroup -group $resetgroup
add wave -group $designtopgroup -group $resetgroup /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ap_rst
set blocksiggroup "Block-level IO Handshake"
add wave -group $designtopgroup -group $blocksiggroup
add wave -group $designtopgroup -group $blocksiggroup /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ap_start
add wave -group $designtopgroup -group $blocksiggroup /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ap_done
add wave -group $designtopgroup -group $blocksiggroup /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ap_idle
add wave -group $designtopgroup -group $blocksiggroup /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ap_ready
set cinputgroup "C Inputs"
add wave -group $designtopgroup -group $cinputgroup
set x_group x(wire)
add wave -group $designtopgroup -group $cinputgroup -group $x_group
add wave -group $designtopgroup -group $cinputgroup -group $x_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/x_V
set y_group y(wire)
add wave -group $designtopgroup -group $cinputgroup -group $y_group
add wave -group $designtopgroup -group $cinputgroup -group $y_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/y_V
set ts_group ts(wire)
add wave -group $designtopgroup -group $cinputgroup -group $ts_group
add wave -group $designtopgroup -group $cinputgroup -group $ts_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/ts_V
set stage_group stage(wire)
add wave -group $designtopgroup -group $cinputgroup -group $stage_group
add wave -group $designtopgroup -group $cinputgroup -group $stage_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/stage_V
set coutputgroup "C Outputs"
add wave -group $designtopgroup -group $coutputgroup
set outputData_group outputData(memory)
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_address0
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_ce0
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_we0
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_d0
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_address1
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_ce1
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_we1
add wave -group $designtopgroup -group $coutputgroup -group $outputData_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/outputData_V_d1
set size_group size(wire)
add wave -group $designtopgroup -group $coutputgroup -group $size_group
add wave -group $designtopgroup -group $coutputgroup -group $size_group -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/size_V
add wave -group $designtopgroup -group $coutputgroup -group $size_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/AESL_inst_testRwSAEHW/size_V_ap_vld
set testbenchgroup "Test Bench Signals"
add wave -group $testbenchgroup
set tbcinputgroup "C Inputs"
add wave -group $testbenchgroup -group $tbcinputgroup
set tb_x_group x(wire)
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_x_group
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_x_group -radix hex /apatb_testRwSAEHW_top/x_V
set tb_y_group y(wire)
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_y_group
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_y_group -radix hex /apatb_testRwSAEHW_top/y_V
set tb_ts_group ts(wire)
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_ts_group
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_ts_group -radix hex /apatb_testRwSAEHW_top/ts_V
set tb_stage_group stage(wire)
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_stage_group
add wave -group $testbenchgroup -group $tbcinputgroup -group $tb_stage_group -radix hex /apatb_testRwSAEHW_top/stage_V
set tbcoutputgroup "C Outputs"
add wave -group $testbenchgroup -group $tbcoutputgroup
set tb_outputData_group outputData(memory)
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -radix hex /apatb_testRwSAEHW_top/outputData_V_address0
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/outputData_V_ce0
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/outputData_V_we0
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -radix hex /apatb_testRwSAEHW_top/outputData_V_d0
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -radix hex /apatb_testRwSAEHW_top/outputData_V_address1
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/outputData_V_ce1
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/outputData_V_we1
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_outputData_group -radix hex /apatb_testRwSAEHW_top/outputData_V_d1
set tb_size_group size(wire)
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_size_group
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_size_group -radix hex /apatb_testRwSAEHW_top/size_V
add wave -group $testbenchgroup -group $tbcoutputgroup -group $tb_size_group -color #ffff00 -radix hex /apatb_testRwSAEHW_top/size_V_ap_vld
set tbinternalsiggroup "Internal Signals"
add wave -group $testbenchgroup -group $tbinternalsiggroup
set tb_simstatus_group "Simulation Status"
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_simstatus_group
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_simstatus_group -radix hex /apatb_testRwSAEHW_top/AUTOTB_TRANSACTION_NUM
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_simstatus_group -radix hex /apatb_testRwSAEHW_top/ready_cnt
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_simstatus_group -radix hex /apatb_testRwSAEHW_top/done_cnt
set tb_portdepth_group "Port Depth"
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group -radix hex /apatb_testRwSAEHW_top/LENGTH_x_V
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group -radix hex /apatb_testRwSAEHW_top/LENGTH_y_V
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group -radix hex /apatb_testRwSAEHW_top/LENGTH_ts_V
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group -radix hex /apatb_testRwSAEHW_top/LENGTH_stage_V
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group -radix hex /apatb_testRwSAEHW_top/LENGTH_outputData_V
add wave -group $testbenchgroup -group $tbinternalsiggroup -group $tb_portdepth_group -radix hex /apatb_testRwSAEHW_top/LENGTH_size_V
