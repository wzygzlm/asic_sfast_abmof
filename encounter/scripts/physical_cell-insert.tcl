###########################################################################
#  Title      : Insert the physical cells
#  Project    : gf 28 dz flow
##########################################################################
#  File       : physical_cell-insert.tcl
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-05-07
#  Last update: 2015-05-07
##########################################################################
#  Description : Insert on the begin, end of the roww end cap 
#                Insert well tap
#  Inputs      :
#  Outputs     : $endCap
#                $wellTap
#  Rhesuses    : 
##########################################################################
#  Copyright (c) 2015 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1 - <muheim@ee.ethz.ch> - Thu May  7 10:28:28 CEST 2015
#  - copy from stm v0.1 and adapt it 
##########################################################################

# To report endcap cells (specified as 'CLASS ENDCAP' in LEF) :
set endCap(name) [dbGet [dbGet -p head.libCells.subclass coreEndCap*].name]

# To get names of well tap cells (specified as 'CLASS CORE WELLTAP ' in LEF)
set wellTap(name)   [dbGet [dbGet -p head.libCells.subClass coreWellTap].name]
set wellTap(maxdis) 30


setEndCapMode -reset
setEndCapMode \
  -leftEdge             $endCap(name) \
  -rightEdge            $endCap(name)

deleteFiller -prefix ENDCAP
deleteFiller -prefix WELLTAP

addEndCap

addWellTap -cell         $wellTap(name) \
           -cellInterval [expr $wellTap(maxdis) * 2] \
           -rule         $wellTap(maxdis) \
           -checkerBoard

