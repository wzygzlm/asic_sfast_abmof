#source /home/aimar/workspaces/perforce/asa_elt/hwdesign/elt/syn/elt_single_module_synth.tcl 
sh clear

set MODULE "rwSAEPerfectLoopStre"
set WS "/home/inichang/minliu_icdesign/"
set LIBRARY WORK_TIMING
set CLK_PERIOD 10


source ${WS}/synopsys/scripts/dpv2_base_setup.tcl

#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/adder.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/checkIdxGeneralV3_4_s.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/finalCornerChecking.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w96_d10_S.v}
analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/rwSAEPerfectLoopStre.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w8_d2_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/SFAST_process_data_e_1_1.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w64_d7_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w8_d4_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/rwSAEPerfectLoopSIfE.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/preProcessStream_bkb.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/start_for_rwSAEPePgM.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/sortedIdxStreamV3_4_s.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w2_d2_S.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/combineOutputStream.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/feedbackInterleaveSt.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w48_d2_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w60_d2_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w5_d3_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/Block_proc124.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w5_d2_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w32_d4_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w32_d2_S.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/SFAST_Block_proc.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/start_for_SFAST_pNgs.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/start_for_Block_pQgW.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w32_d2_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/SFAST_process_data.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w10_d2_S.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w1_d2_S.v}
analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/SFAST_process_datMgi.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/SFAST_process_data_e_1.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/start_for_Block_pOgC.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w1_d2_A.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/fifo_w48_d10_S.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/preProcessStream.v}
#analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/SFAST_process_datHfu.v}

elaborate ${MODULE} -architecture verilog -library WORK

#set_false_path -from i_elt_cwg_mult_dp_pipe/chunk_mult_result_reg[0]* -to i_elt_cwg_mult_dp_pipe/r_merge_adder_output3_re*

analyze_datapath_extraction

check_design -multiple_designs > reports/check_before_compile.txt

create_clock ap_clk -name ap_clk -period ${CLK_PERIOD}
set_fix_hold ap_clk
set_input_delay 0.05 -clock ap_clk [all_inputs]


set_leakage_optimization true
set_dynamic_optimization true
set_max_area 0.0



#set_datapath_gating_options Error: The minPower feature is not enabled. Can not apply datapath options on the design. (UISN-65)

set case_analysis_propagate_through_icg    true

set power_driven_clock_gating true
set power_cg_auto_identify    true
set power_cg_reconfig_stages  true
set power_cg_balance_stages   true
set power_cg_reconfig_stages  true
set power_cg_derive_related_clock      true
set power_cg_inherit_timing_exceptions true
set power_cg_high_effort_enable_fanin_analysis true

set compile_clock_gating_through_hierarchy true
set compile_enhanced_resource_sharing      true
set compile_implementation_selection       true
set compile_optimize_unloaded_seq_logic_with_no_bound_opt true
set compile_retime_exception_registers          true
set compile_seqmap_propagate_high_effort true
set compile_seqmap_propagate_constants   true
set compile_timing_high_effort           true
set compile_ultra_ungroup_dw             true
set compile_ultra_ungroup_small_hierarchies true
set compile_allow_dw_hierarchical_inverter_opt true

set fsm_auto_inferring true
set_dp_smartgen_options -hierarchy -all_options auto


#set power_enable_datapath_gating true
set_structure -boolean_effort high -boolean true

set_optimize_registers true
set optimize_reg_add_path_groups registers


set_flatten true -effort high  -phase true;#-minimize multiple_output   


set_clock_gating_style -sequential latch -pos integrated -neg integrated -control_point before -observation_point false -num_stages 16



create_auto_path_groups -mode rtl
compile_ultra
ungroup -all -flatten  
optimize_netlist -area




report_resources -hier
report_area > reports/area.txt
report_timing > reports/timing.txt
report_clock_gating
report_power -analysis_effort high > reports/power.txt
analyze_datapath
report_qor


change_names -rule verilog -hierarchy
write -hierarchy -format verilog -output netlists/$MODULE.v
