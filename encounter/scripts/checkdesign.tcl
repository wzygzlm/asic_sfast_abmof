##########################################################################
#  Title      : fiel check of the designe
#  Project    : gf 28 dz flow
##########################################################################
#  File       : checkdesign.tcl
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-05-07
#  Last update: 2015-05-07
##########################################################################
#  Description : Ter will be dpn the finel check of the designe and 
#                som reports.
#  Inputs      : ($DESIGNNAME)
#                ($wellTap)
#  Outputs     : 
#  Rhesuses    : 
##########################################################################
#  Copyright (c) 2015 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1 - <muheim@ee.ethz.ch> - Thu May  7 10:31:45 CEST 2015
#  - copy from umcL65 v0.4 and adapt it 
##########################################################################

# is the design name specified ???
if { [ info exists DESIGNNAME ] } {
   set NAME "$DESIGNNAME"

} else {
    set NAME "final"

}

# create the verify under reports when not existing
if {![file exists reports/verify]} {
  file mkdir reports/verify
}

# when the wellTapList is not set we create it
if {![info exists wellTapList]} {
  set wellTap(name)   [dbGet [dbGet -p head.libCells.subClass coreWellTap].name]
  set wellTap(maxdis) 30
}


## verify
puts "porform Connectivity, Geometry, ProcessAntenna and WellTap Checks"
verifyConnectivity -type all -geomConnect -report reports/verify/${NAME}.connect.rpt
verifyGeometry -antenna -report reports/verify/${NAME}_geom.rpt
verifyProcessAntenna -leffile reports/verify/${NAME}_antenna.lef -reportfile reports/verify/${NAME}_antenna.rpt 
verifyWellTap -cell $wellTap(name) -rule $wellTap(maxdis) -report  reports/verify/${NAME}_wellTap.rpt 


## reports
puts ""
puts "Writing summary report"
summaryReport -noHtml -outfile reports/verify/summaryReport.rpt

puts ""
puts "Checking nets that exceed the default delay limit"
puts "There should be no nets in the report below"
report_net -min_fanout [lindex $rdaUseDefaultDelayLimit 0]

