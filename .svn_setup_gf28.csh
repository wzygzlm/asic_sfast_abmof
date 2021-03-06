#! /bin/tcsh -f
#
# this is a simple script that should tell you which directories to add 
# and which to ignore for a typical SVN setup.
#
# automatically generated by
#  gen_svnignore.pl on Mon Jun 29 09:51:38 CEST 2015
#

cat<<EOF

This script will add the cockpit directory to the svn and it will
configure the directories so that only relevant directories will 
be added.

EOF

# check if .cockpitrc is there
if (! -f .cockpitrc) then
  echo " ERROR: Can not find .cockpitrc, probably not in a cockpit directory"
  echo "        Exiting..."
  exit
endif

# check if there is a .svn directory
if (! -d .svn) then
  echo " ERROR: Can not find .svn, directory not in svn"
  echo "        First add this directory to svn"
  echo "        Exiting..."
  exit
endif


############# DIRECTORY [.] ########################
cd .

## Generate IGNORE FILE
cat <<EOF > .svn.ignore
cockpit.log
.llamaconfig
tmp
calibre
dfii
docs
technology
.svn_setup*
.gen_gitignore*
*.20[0-9]*-[0-9]*-[0-9]*-[0-9]*:[0-9]*:[0-9]*
EOF

## Set the ignore files
svn -q add .svn.ignore
svn -q propset svn:ignore -F .svn.ignore .

## Add the rest of files/directories
svn -q add --depth=empty .cockpitrc
svn -q add --depth=empty encounter
svn -q add --depth=empty modelsim
svn -q add --depth=empty simvectors
svn -q add --depth=empty sourcecode
svn -q add --depth=empty synopsys

cd -

############# DIRECTORY [encounter] ########################
cd encounter

## Generate IGNORE FILE
cat <<EOF > .svn.ignore
enc.tcl
save
timingReports
powerReports
reports
encounterData
encounter.log*
encounter.cmd*
CTS_RP_MOVE.txt
enc_*.cmd.gz
*.dc.outbound.slew.*.txt
*.mtarpt
.interactive.constr.sdc
.view_def_*
.cadence
.tdrlog
.nano_eco_diode.list*
.holdtw.*.twf*
.anls_ems_*
.*.rs.fp*
.anls*
*.20[0-9]*-[0-9]*-[0-9]*-[0-9]*:[0-9]*:[0-9]*
EOF

## Set the ignore files
svn -q add .svn.ignore
svn -q propset svn:ignore -F .svn.ignore .

## Add the rest of files/directories
svn -q add --depth=empty src
svn -q add --depth=empty scripts
svn -q add --depth=empty out

cd -

############# DIRECTORY [encounter/scripts] ########################
cd encounter/scripts

## Generate IGNORE FILE
cat <<EOF > .svn.ignore
fillcore-insert.tcl
fillperi-remove.tcl
power_grid.tcl
globalnet.tcl
qrc.extra.cmd
checkdesign.tcl
welltap.tcl
fillperi-insert.tcl
exportall.tcl
fillcore-remove.tcl
tiehilo.tcl
*.20[0-9]*-[0-9]*-[0-9]*-[0-9]*:[0-9]*:[0-9]*
EOF

## Set the ignore files
svn -q add .svn.ignore
svn -q propset svn:ignore -F .svn.ignore .

## Add the rest of files/directories

cd -

############# DIRECTORY [encounter/src] ########################
cd encounter/src

## Generate IGNORE FILE
cat <<EOF > .svn.ignore
sample
insert_specialpads
specialpads-ll.v
.ordinatorConf
io2ps.pl
io2ps.pads
*.VSS.pp
*.VDD.pp
prepare_chip.pl
*.20[0-9]*-[0-9]*-[0-9]*-[0-9]*:[0-9]*:[0-9]*
EOF

## Set the ignore files
svn -q add .svn.ignore
svn -q propset svn:ignore -F .svn.ignore .

## Add the rest of files/directories

cd -

############# DIRECTORY [modelsim] ########################
cd modelsim

## Generate IGNORE FILE
cat <<EOF > .svn.ignore
README.postlayout
README
saif
work
sim_postlayout.csh-example
modelsim.ini
vcd
*.wlf
transcript
compile_gate.csh-example
compile_rtl.csh-example
*.20[0-9]*-[0-9]*-[0-9]*-[0-9]*:[0-9]*:[0-9]*
EOF

## Set the ignore files
svn -q add .svn.ignore
svn -q propset svn:ignore -F .svn.ignore .

## Add the rest of files/directories

cd -

############# DIRECTORY [synopsys] ########################
cd synopsys

## Generate IGNORE FILE
cat <<EOF > .svn.ignore
WORK
alib
DDC
reports
default.svf
filenames*.log
command.log
view_command.log
.synopsys_dc.setup
*.20[0-9]*-[0-9]*-[0-9]*-[0-9]*:[0-9]*:[0-9]*
EOF

## Set the ignore files
svn -q add .svn.ignore
svn -q propset svn:ignore -F .svn.ignore .

## Add the rest of files/directories
svn -q add --depth=empty scripts
svn -q add --depth=empty netlists

cd -

############### FINALIZATION #######################

cat<<EOF

The setup is now complete. You can checkin the cockpit directory
by issuing:
  
    svn ci

If you want to check out the directory. First issue a:

    svn co
    
So that you get all the files that are in the svn repository. Then
to update the design directory use the

    icdesign XXXX -update all [-nogui]
    
command, where XXXX is the technology script (i.e. alp180). 
The -nogui is optional.


EOF
