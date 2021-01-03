#!/bin/csh

# v0.3 - <kgf@ee.ethz.ch> - Wed Oct 21 18:40:08 CEST 2015
# - updated to reflrct the slightly newer setup
# v0.2 - <muheim@ee.ethz.ch> - Fri Aug 21 15:42:25 CEST 2015
# - combine the calibre setings to this file and renamed it
# v0.1 - <muheim@ee.ethz.ch> - Mon Jan 19 09:58:25 CET 2015
# - settings the pdk direcory and the layerstack
#   used by dfii and calibre

## The linked-PDK 2015.01 is using following version of the input files:
# 28SLP Calibre xR    V1.0_3.2
# 28SLP Calibre LVS   V1.0_4.0
# 28SLP QRC           V1.0_4.0
# 28SLP cdslib        V1.0_7.0
# 28SLP Calibre DRC   V1.0_7.0_CalibreDRC_20140916a
# 28SLP      BCK      V1.0_2.0_BCK

setenv PDK_HOME /usr/pack/global-28-kgf/gf/slp/2015.10/
setenv BEOL_STACK 6U1x_2T8x_LB


## DRC/LVS/PEX (calibre)

# Calibre default runsets
setenv MGC_CALIBRE_DRC_RUNSET_FILE "../calibre/drc/runset.drc"
setenv MGC_CALIBRE_LVS_RUNSET_FILE "../calibre/lvs/runset.lvs"
setenv MGC_CALIBRE_PEX_RUNSET_FILE "../calibre/pex/runset.pex"

setenv TECHDIR $PDK_HOME/Calibre
setenv GOLDENBCKDIR $PDK_HOME/BCK/SUPPORTED.GoLd/SUPPORTED.GoLd.gds

## DRC
# for info to the environment variables see: docs/28SLP.CalibreDRC.rel_notes.pdf

# use the following for partial designs 
# setenv DESIGN_TYPE CELL
setenv DESIGN_TYPE CHIP

setenv IOTYPE      INLINE
setenv WIRE_PAD    AU

# this is pretty stupid. This is a new feature (was not here in 2015.01 
# and we ended up rotating the design for DRC. Now that there is an option
# we can rotate it back again, YES Select gate orientation to be  vertical
setenv GATE_ORIENT_VERTICAL YES


## LVS
# for info to the envaerment variables see: docs/pdk-28SLP-V1.0_4.0_Calibre_LVS.pdf
#

# do not compare the number of gate connections
# because in the memory's the NGCON is not in, a error will appear:
#   Error:    Properties missing on instances in source.
setenv CHECK_MOSFET_NGCON FALSE


## PEX
# we need the following env variable set,
# don;t know if it interferes with normal calibre
#setenv PEX_RUN TRUE

