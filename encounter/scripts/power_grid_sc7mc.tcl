###########################################################################
#  Title      : Power grid creation.
#  Project    : gf 28 dz flow
##########################################################################
#  File       : power_grid_sc7mc.tcl
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
#  Created    : 2015-10-07
#  Last update: 2015-10-13
##########################################################################
#  Description : Creates the.Power grid for the gf 28 technology, with
#                cell with 7 track high.
#  Inputs      : 
#  Outputs     : 
#  Resources   : 
##########################################################################
#  Copyright (c) 2013 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.2  - bm - Tue Oct 13 10:59:57 CEST 2015
#  - make it regular and with more withe 
# v0.1  - bm - Wed Oct  7 10:47:30 CEST 2015
#  - copy from stm28 v0.1 and adapt it
##########################################################################

setViaGenMode -invoke_verifyGeometry false
#setViaGenMode -viarule_preference predefined
setViaGenMode -viarule_preference generated

setViaGenMode -optimize_cross_via true
#setAddStripeMode -allow_nonpreferred_dir true

setAddStripeMode -allow_jog {none}
#setAddStripeMode -allow_jog {padcore_ring}

set placeGridV  0.1
set placeGridH  0.1
set GridCellHeightFakt  7
set cellHeight  [expr $placeGridH * $GridCellHeightFakt]


##  Core grid settings
set pgcg1LayerV M3
set routGrid1   $placeGridV

set pgcg2LayerV IA
set pgcg2LayerH IB
set routGrid2   [expr $placeGridH * 8]

set pgcg1WidthV [expr $routGrid1 * 0.5]

set pgcg2WidthV [expr $routGrid2 * 2.5]
set pgcg2WidthH [expr $routGrid2 * 4.5]

set pgcg1SpacingV  [expr $cellHeight - $pgcg1WidthV]
set pgcg1DistanceV [expr $cellHeight * 2]

set pgcg2SpacingV  [expr $routGrid2  * 16 - $pgcg2WidthV]
set pgcg2DistanceV [expr $routGrid2  * 32]
set pgcg2SpacingH  [expr $routGrid2  * 16 - $pgcg2WidthH]
set pgcg2DistanceH [expr $routGrid2  * 32]

set pgcg1OffsetX   [expr $cellHeight      - $pgcg1WidthV/2 + $placeGridV * 0.5]

set pgcg2OffsetX   [expr $routGrid2  * 16 - $pgcg2WidthV/2 + $placeGridV * 0.5]
set pgcg2OffsetY   [expr $routGrid2  * 16 - $pgcg2WidthH/2 + $placeGridV * 0.5]

set pgcgNets  [list $rda_Input(ui_pwrnet) $rda_Input(ui_gndnet) ]


# connect std cells
#sroute -connect {corePin padRing} \
#        -allowLayerChange 1

#	-targetPenetration { stripe 90 }


## Grid creation and connection
#addStripe -set_to_set_distance $pgcg1DistanceV -spacing $pgcg1SpacingV -xleft_offset $pgcg1OffsetX -width $pgcg1WidthV \
#        -use_wire_group 1 \
#        -layer $pgcg1LayerV \
#        -nets $pgcgNets

addStripe -set_to_set_distance $pgcg2DistanceV -spacing $pgcg2SpacingV -xleft_offset $pgcg2OffsetX -width $pgcg2WidthV \
        -use_wire_group 1 \
        -layer $pgcg2LayerV \
        -nets $pgcgNets
addStripe -set_to_set_distance $pgcg2DistanceH -ybottom_offset $pgcg2OffsetY -spacing $pgcg2SpacingH  -width $pgcg2WidthH \
        -use_wire_group 1 \
        -direction horizontal -layer $pgcg2LayerH \
        -nets $pgcgNets

# connect macros
#sroute -blockPinRouteWithPinWidth -noPadRings -noCorePins -noPadPins -noStripes \
#	-blockPin { boundaryPins } -blockSides { top left } \
#	-straightConnections { straightWithDrcClean straightWithChanges }

# trims all special wires
editTrim -all
redraw



clearDrc
#fit

