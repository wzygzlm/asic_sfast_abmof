# 
# Encounter init 
#
# v0.1 bm  - Tue May  5 16:21:16 CEST 2015
# - copy from alp180 v0.1 and adapt it


# enable footprintless optimization flow
set dbgGPSAutoCellFunction 1

# change report timing format to include also the load
set_global report_timing_format {instance arc cell slew load delay arrival}
#set_global timing_report_timing_header_detail_info extended

# alternatively you can also add fanout to the report
#set_global report_timing_format {instance arc cell slew load fanout delay arrival}

# to allowed after CTS to do the reload the constraint withe 
# "set_analysis_view -update_timing" after "update_constraint_mode ..."
set_global timing_defer_mmmc_object_updates true


# To prevent using the signal integrity for timing calculate.
# It also not asking for using Chip Variation doing the timing calculation after
# routing.
setDelayCalMode -siAware false

# setDoAssign behaviour
# assign statements will be kept
setDoAssign off
# assign statements will be replaced by a BUFFER of the given type 
#setDoAssign on -buffer ?????

# set the temp dir
set env(TMPDIR) "$env(PWD)/../tmp"

# set the technology
setDesignMode -process 28

## # umc65 has 4 grid units per gate
## set dbgSitesPerGate 4

# /usr/pack/global-28-kgf/arm/gf/cmos28slp/arm_tech/r1p0/lef/6U1x_2T8x_LB/encounter_route_options.tcl
setNanoRouteMode -routeBottomRoutingLayer 2
# From edi14 on it have to be set by "setPinAssignMode -minLayer 2",
# this have to be don after the designe is loadet. 

## Needed to support the new 32/28nm syntax for OPPOSITEOL rule
#setNanoRouteMode -drouteExpFixOppoEolChecker true

## Starts a particular EOL fixing in iteration 0 instead of latter iteration.
setNanoRouteMode -drouteExpAdvancedFixingIteration 0



# suppress message
