##########################################################################
#  Title      : replace 0/1 by TIELOW/TIEHIGH cells
#  Project    : gf 28 dz flow
##########################################################################
#  File       : globalnet.cpf
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-05-07
#  Last update: 2015-05-07
##########################################################################
#  Description : 
#  Inputs      : $DESIGNNAME
#  Outputs     :   
#  Resources   :
##########################################################################
#  Copyright (c) 2015 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1 - <muheim@ee.ethz.ch> - Thu May  7 12:33:19 CEST 2015
#  - copy from akp v0.2 and adapt it
##########################################################################

# to get names of tie high / tie low cells (specified as 'CLASS CORE TIEHIGH' or 'CLASS CORE TIELOW' in LEF), use
set TieHighCell(name) [dbGet [dbGet -p head.libCells.subClass coreTieHigh].name]
set TieLowCell(name)  [dbGet [dbGet -p head.libCells.subClass coreTieLow].name]

set tieCellList(name) [list $TieHighCell(name) $TieLowCell(name)]

if [llength $tieCellList(name) ] {
  # first delete all existing tie cells 
  deleteTieHiLo -cell $tieCellList(name)

  # set tiehilo mode and insert the new cells
  setTieHiLoMode -reset
  setTieHiLoMode -maxFanout 12 -maxDistance 250 -createHierPort true \
                 -cell $tieCellList(name)
  # -createHierPort true - try

  addTieHiLo

  #sometimes there are overlaps
  refinePlace
} else {
  puts "ERROR: find no Tie Cell!"
}


