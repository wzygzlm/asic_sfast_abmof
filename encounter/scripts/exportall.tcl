#
# export all relevant design data
#
# v0.4  - <muheim@ee.ethz.ch> - Mon Oct 12 10:14:55 CEST 2015
#  - change the RC extract setting that Turbo QRC (TQRC) engine will be used
# v0.3  - <muheim@ee.ethz.ch> - Wed Jul  2 17:06:15 CEST 2014
#  - remufe the  -remashold and add -nonegchecks to the write_sdf
#  - write the verilog for simulation without physical cells
#  - change the write_sdf, so also the view will taken out of the
#    nalysis_views lists.
# v0.2  - <muheim@ee.ethz.ch> - Thu Aug  4 16:02:55 CEST 2011
#  - add this global variable for proper sdf out
# v0.1  - <muheim@ee.ethz.ch> - Thu Jun 16 11:24:22 CEST 2011
#  - copy from umcL90
#  - use write_sdf as standart and add the views


# is the design name specified ???
if { [ info exists DESIGNNAME ] } {
   set NAME "$DESIGNNAME"

} else {
    set NAME "final"

}

# RC will be extracted, if not ready don, using the
# Integrated QRC (IQRC) engine.
#setExtractRCMode -effortLevel high
  # ERROR (EXTIQRC-330) : This session encountered a licensing problem. You need the QRC Extraction

# RC will be extracted using the Turbo QRC (TQRC) engine.
setExtractRCMode -engine postRoute -effortLevel medium


# global variable for written the sdf checks checks correctly with a tripl
set_global timing_recompute_sdf_in_setuphold_mode true
# Write out SDF, take the first analysis_views from the hold and the setup list
write_sdf -precision 4 -min_period_edges posedge -recompute_parallel_arcs -nonegchecks \
          -min_view [lindex [all_hold_analysis_views]  0] \
          -typ_view [lindex [all_setup_analysis_views] 0] \
          -max_view [lindex [all_setup_analysis_views] 0] \
          out/${NAME}.sdf.gz

# This netlist do not contains the filler cells, physical cells.
# This can be used for simulation 
saveNetlist out/${NAME}.v -excludeLeafCell

# This netlist contains all filler cells and everything.
# This have to be used for LVS 
saveNetlist out/${NAME}_lvs.v -excludeLeafCell -includePhysicalInst -phys

# layout
setStreamOutMode -SEvianames ON -specifyViaName %t_VIA

# you can set an alternative top name with -structureName 
# streamOut out/${NAME}.gds.gz -structureName sem01w0 
streamOut out/${NAME}.gds.gz  -mapFile ../technology/tech.map -outputMacros -merge {  \
  /usr/pack/global-28-kgf/arm/gf/cmos28slp/sc7mc_base_rvt_c34/r1p0/gds2/sc7mc_cmos28slp_base_rvt_c34.gds2 \
  /usr/pack/global-28-kgf/arm/gf/cmos28lp/io_gppr_t18_mv11_mv18_tl25_rvt_dr/r6p0/gds2/io_gppr_cmos28lp_t18_mv11_mv18_tl25_rvt_dr_6U1x_2T8x_LB.gds2 \
 }

