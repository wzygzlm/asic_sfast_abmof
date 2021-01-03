sh clear

echo \n
echo --------------------------------------------------------------------------
echo -- Starting synthesis script with variables:
echo WS = ${WS}
echo MODULE = ${MODULE}
echo LIBRARY = ${LIBRARY}
echo CLK_PERIOD = ${CLK_PERIOD}
echo --------------------------------------------------------------------------


set_host_options -max_cores 16

set disable_multicore_resource_checks true


#OPT-776 (information) Ungrouping hierarchy %s before Pass 1
suppress_message OPT-776 

#OPT-777 (information) Ungrouping hierarchy %s '%s' #insts = %d.
suppress_message OPT-777

#OPT-1056 (information) Uniquified %d instances of design '%s'.
suppress_message OPT-1056

#PWR-536  (information) The library cell '%s' in the library '%s' is not characterized for internal power.
suppress_message PWR-536


#VER-934  (information) The imported name '%s' is visible to clients of this package.
suppress_message VER-934


set compile_log_format {%elap_time %area %wns %dynamic_power %leakage_power %total_power %endpoint}         
set verilogout_no_tri true
set verilogout_show_unconnected_pins true
set verilogout_single_bit false

sh rm -rf ./${LIBRARY}
sh mkdir ./${LIBRARY}
define_design_lib ${LIBRARY} -path ./${LIBRARY}


saif_map -start

set power_cg_auto_identify true


echo \n
echo --------------------------------------------------------------------------
echo -- Base setup completed
echo --------------------------------------------------------------------------

