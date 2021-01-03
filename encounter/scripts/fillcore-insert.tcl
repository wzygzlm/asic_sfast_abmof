###########################################################################
#  Title      : insert core filler cells
#  Project    : gf 28 dz flow
##########################################################################
#  File       : fillcore-insert.tcl 
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-05-07
#  Last update: 2015-10-09
##########################################################################
#  Description : insert the core filler cells.
#  Inputs      : 
#  Outputs     :
#  Resources   :
##########################################################################
#  Copyright (c) 2015 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1  - <muheim@ee.ethz.ch> - Fri Oct  9 14:53:41 CEST 2015
#  - Change the parsing for the  fillerCellList(empty) that the well tap
#    not also included.
# v0.1  - <muheim@ee.ethz.ch> - Thu May  7 15:44:39 CEST 2015
#  - copy from umcL65 v0.2 and adapt it
##########################################################################

set fillerCellList(empty) {}
set fillerCellList(decoup) {}
dbForEachHeadCell [dbgHead] cellPtr {
  if [string match "FILLS*" [dbCellName $cellPtr]]  {
    lappend fillerCellList(decoup) [dbCellName $cellPtr]
  } elseif [string match "FILL[123468]*" [dbCellName $cellPtr]]  {
    lappend fillerCellList(empty) [dbCellName $cellPtr]
  }
}

addFiller -cell $fillerCellList(decoup) -prefix fillcore 
addFiller -cell $fillerCellList(empty) -prefix fillcore 
