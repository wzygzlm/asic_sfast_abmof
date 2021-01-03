#!/bin/csh

# v0.2 - <muheim@ee.ethz.ch> - Wed Aug 12 11:17:39 CEST 2015
#  - add LVS setenv
#    helpful for setings /usr/pack/global-28-kgf/gf/pdk-28SLP-V1.0_4.0/Calibre/pdk-28SLP-V1.0_4.0_Calibre_LVS.pdf
#      /usr/pack/global-28-kgf/gf/pdk-28SLP-V1.0_4.0/Calibre/LVS/sourceme
#      /usr/pack/global-28-kgf/gf/pdk-28SLP-V1.0_4.0/Calibre/LVS/sample_design.inc.cal
#      /usr/pack/global-28-kgf/gf/pdk-28SLP-V1.0_4.0/Calibre/LVS/sample_run.csh
# v0.1 - <muheim@ee.ethz.ch> - Mon Jan 19 11:11:48 CET 2015
# - copy from  /usr/pack/global-28-kgf/gf/pdk-28SLP-V1.0_7.0_CalibreDRC_20140916a/Calibre/DRC/sample_run.csh
#   adapted it.


## DRC

# for info to the envaerment variables see: docs/28SLP.CalibreDRC.rel_notes.pdf
#

#assuming $PDK_HOME is set properly
setenv TECHDIR $PDK_HOME/Calibre
setenv GOLDENBCKDIR $PDK_HOME/BCK/SUPPORTED.GoLd

setenv BATCH YES
setenv LAYOUT_PRIMARY fets
setenv LAYOUT_PATH fets.gds
setenv LAYOUT_SYSTEM GDSII
setenv RESULTS_DATABASE $LAYOUT_PRIMARY.drc.ascii
setenv SUMMARY_REPORT $LAYOUT_PRIMARY.drc.report

setenv DESIGN_TYPE CELL

# the layerstack is set in the .setPDK_BOOL.csh
#setenv BEOL_STACK 6U1x_2T8x_LB

setenv IOTYPE INLINE

setenv WIRE_PAD AU


## LVS

# for info to the envaerment variables see: docs/pdk-28SLP-V1.0_4.0_Calibre_LVS.pdf
#

# assuming $PDK_HOME is set properly
# assuming $BEOL_STACK is set properly

# do not compare the number of gate connections
# because in the memory's the NGCON is not in, a error will appear:
#   Error:    Properties missing on instances in source.

setenv CHECK_MOSFET_NGCON FALSE


## PEX

# not set up jet

