#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sat Mar 15 18:57:21 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v15.23-s045_1 (64bit) 04/22/2016 12:32 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 15.23-s045_1 NR160414-1105/15_23-UB (database version 2.30, 317.6.1) {superthreading v1.26}
#@(#)CDS: AAE 15.23-s014 (64bit) 04/22/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 15.23-s022_1 () Apr 22 2016 09:38:45 ( )
#@(#)CDS: SYNTECH 15.23-s008_1 () Apr 12 2016 21:52:59 ( )
#@(#)CDS: CPE v15.23-s045
#@(#)CDS: IQRC/TQRC 15.1.4-s213 (64bit) Tue Feb  9 17:31:28 PST 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set init_pwr_net VDD
set init_gnd_net VSS
set init_verilog ./netlist/sram_w16_160.out.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell sram_w16_160
set init_lef_file /home/linux/ieng6/ee260bwi25/public/PDKdata/lef/tcbn65gplus_8lmT2.lef
create_library_set -name WC_LIB -timing $worst_timing_lib
create_library_set -name BC_LIB -timing $best_timing_lib
create_rc_corner -name Cmax -cap_table $worst_captbl -T 125
create_rc_corner -name Cmin -cap_table $best_captbl -T -40
create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin
create_constraint_mode -name CON -sdc_file [list $sdc]
create_analysis_view -name WC_VIEW -delay_corner WC -constraint_mode CON
create_analysis_view -name BC_VIEW -delay_corner BC -constraint_mode CON
init_design -setup WC_VIEW -hold BC_VIEW
set_interactive_constraint_modes {CON}
setDesignMode -process 65
floorPlan -site core -r 0.25 0.70 10.0 10.0 10.0 10.0
timeDesign -preplace -prefix preplace
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addStripe -number_of_sets 6 -spacing 5 -layer M4 -width 2 -start_offset 20 -stop_offset 20 -nets { VSS VDD }
sroute
getPinAssignMode -pinEditInBatch -quiet
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell sram_w16_160 -pin {D[0]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[1]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[2]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[3]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[4]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[5]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[6]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[7]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[8]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[9]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[10]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[11]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[12]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[13]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[14]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[15]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[16]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[17]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[18]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[19]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[20]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[21]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[22]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[23]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[24]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[25]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[26]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[27]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[28]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[29]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[30]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[31]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[32]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[33]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[34]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[35]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[36]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[37]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[38]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[39]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[40]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[41]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[42]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[43]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[44]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[45]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[46]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[47]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[48]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[49]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[50]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[51]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[52]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[53]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[54]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[55]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[56]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[57]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[58]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[59]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[60]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[61]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[62]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[63]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[64]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[65]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[66]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[67]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[68]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[69]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[70]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[71]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[72]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[73]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[74]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[75]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[76]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[77]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[78]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[79]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[80]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[81]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[82]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[83]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[84]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[85]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[86]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[87]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[88]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[89]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[90]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[91]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[92]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[93]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[94]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[95]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[96]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[97]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[98]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[99]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[100]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[101]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[102]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[103]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[104]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[105]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[106]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[107]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[108]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[109]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[110]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[111]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[112]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[113]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[114]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[115]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[116]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[117]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[118]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[119]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[120]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[121]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[122]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[123]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[124]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[125]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[126]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[127]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[128]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[129]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[130]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[131]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[132]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[133]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[134]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[135]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[136]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[137]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[138]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[139]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[140]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[141]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[142]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[143]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[144]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[145]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[146]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[147]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[148]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[149]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[150]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[151]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[152]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[153]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[154]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[155]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[156]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[157]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[158]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {D[159]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell sram_w16_160 -pin {Q[0]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[1]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[2]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[3]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[4]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[5]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[6]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[7]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[8]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[9]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[10]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[11]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[12]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[13]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[14]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[15]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[16]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[17]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[18]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[19]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[20]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[21]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[22]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[23]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[24]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[25]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[26]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[27]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[28]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[29]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[30]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[31]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[32]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[33]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[34]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[35]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[36]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[37]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[38]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[39]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[40]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[41]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[42]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[43]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[44]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[45]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[46]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[47]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[48]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[49]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[50]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[51]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[52]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[53]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[54]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[55]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[56]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[57]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[58]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[59]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[60]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[61]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[62]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[63]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[64]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[65]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[66]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[67]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[68]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[69]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[70]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[71]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[72]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[73]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[74]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[75]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[76]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[77]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[78]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[79]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[80]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[81]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[82]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[83]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[84]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[85]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[86]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[87]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[88]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[89]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[90]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[91]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[92]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[93]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[94]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[95]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[96]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[97]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[98]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[99]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[100]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[101]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[102]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[103]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[104]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[105]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[106]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[107]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[108]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[109]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[110]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[111]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[112]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[113]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[114]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[115]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[116]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[117]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[118]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[119]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[120]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[121]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[122]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[123]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[124]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[125]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[126]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[127]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[128]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[129]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[130]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[131]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[132]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[133]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[134]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[135]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[136]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[137]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[138]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[139]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[140]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[141]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[142]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[143]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[144]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[145]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[146]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[147]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[148]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[149]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[150]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[151]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[152]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[153]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[154]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[155]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[156]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[157]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[158]} -status unplaced -silent
setPtnPinStatus -cell sram_w16_160 -pin {Q[159]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 1 -pin {{Q[0]} {Q[1]} {Q[2]} {Q[3]} {Q[4]} {Q[5]} {Q[6]} {Q[7]} {Q[8]} {Q[9]} {Q[10]} {Q[11]} {Q[12]} {Q[13]} {Q[14]} {Q[15]} {Q[16]} {Q[17]} {Q[18]} {Q[19]} {Q[20]} {Q[21]} {Q[22]} {Q[23]} {Q[24]} {Q[25]} {Q[26]} {Q[27]} {Q[28]} {Q[29]} {Q[30]} {Q[31]} {Q[32]} {Q[33]} {Q[34]} {Q[35]} {Q[36]} {Q[37]} {Q[38]} {Q[39]} {Q[40]} {Q[41]} {Q[42]} {Q[43]} {Q[44]} {Q[45]} {Q[46]} {Q[47]} {Q[48]} {Q[49]} {Q[50]} {Q[51]} {Q[52]} {Q[53]} {Q[54]} {Q[55]} {Q[56]} {Q[57]} {Q[58]} {Q[59]} {Q[60]} {Q[61]} {Q[62]} {Q[63]} {Q[64]} {Q[65]} {Q[66]} {Q[67]} {Q[68]} {Q[69]} {Q[70]} {Q[71]} {Q[72]} {Q[73]} {Q[74]} {Q[75]} {Q[76]} {Q[77]} {Q[78]} {Q[79]} {Q[80]} {Q[81]} {Q[82]} {Q[83]} {Q[84]} {Q[85]} {Q[86]} {Q[87]} {Q[88]} {Q[89]} {Q[90]} {Q[91]} {Q[92]} {Q[93]} {Q[94]} {Q[95]} {Q[96]} {Q[97]} {Q[98]} {Q[99]} {Q[100]} {Q[101]} {Q[102]} {Q[103]} {Q[104]} {Q[105]} {Q[106]} {Q[107]} {Q[108]} {Q[109]} {Q[110]} {Q[111]} {Q[112]} {Q[113]} {Q[114]} {Q[115]} {Q[116]} {Q[117]} {Q[118]} {Q[119]} {Q[120]} {Q[121]} {Q[122]} {Q[123]} {Q[124]} {Q[125]} {Q[126]} {Q[127]} {Q[128]} {Q[129]} {Q[130]} {Q[131]} {Q[132]} {Q[133]} {Q[134]} {Q[135]} {Q[136]} {Q[137]} {Q[138]} {Q[139]} {Q[140]} {Q[141]} {Q[142]} {Q[143]} {Q[144]} {Q[145]} {Q[146]} {Q[147]} {Q[148]} {Q[149]} {Q[150]} {Q[151]} {Q[152]} {Q[153]} {Q[154]} {Q[155]} {Q[156]} {Q[157]} {Q[158]} {Q[159]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 1 -spreadType center -spacing 1.0 -pin {{D[0]} {D[1]} {D[2]} {D[3]} {D[4]} {D[5]} {D[6]} {D[7]} {D[8]} {D[9]} {D[10]} {D[11]} {D[12]} {D[13]} {D[14]} {D[15]} {D[16]} {D[17]} {D[18]} {D[19]} {D[20]} {D[21]} {D[22]} {D[23]} {D[24]} {D[25]} {D[26]} {D[27]} {D[28]} {D[29]} {D[30]} {D[31]} {D[32]} {D[33]} {D[34]} {D[35]} {D[36]} {D[37]} {D[38]} {D[39]} {D[40]} {D[41]} {D[42]} {D[43]} {D[44]} {D[45]} {D[46]} {D[47]} {D[48]} {D[49]} {D[50]} {D[51]} {D[52]} {D[53]} {D[54]} {D[55]} {D[56]} {D[57]} {D[58]} {D[59]} {D[60]} {D[61]} {D[62]} {D[63]} {D[64]} {D[65]} {D[66]} {D[67]} {D[68]} {D[69]} {D[70]} {D[71]} {D[72]} {D[73]} {D[74]} {D[75]} {D[76]} {D[77]} {D[78]} {D[79]} {D[80]} {D[81]} {D[82]} {D[83]} {D[84]} {D[85]} {D[86]} {D[87]} {D[88]} {D[89]} {D[90]} {D[91]} {D[92]} {D[93]} {D[94]} {D[95]} {D[96]} {D[97]} {D[98]} {D[99]} {D[100]} {D[101]} {D[102]} {D[103]} {D[104]} {D[105]} {D[106]} {D[107]} {D[108]} {D[109]} {D[110]} {D[111]} {D[112]} {D[113]} {D[114]} {D[115]} {D[116]} {D[117]} {D[118]} {D[119]} {D[120]} {D[121]} {D[122]} {D[123]} {D[124]} {D[125]} {D[126]} {D[127]} {D[128]} {D[129]} {D[130]} {D[131]} {D[132]} {D[133]} {D[134]} {D[135]} {D[136]} {D[137]} {D[138]} {D[139]} {D[140]} {D[141]} {D[142]} {D[143]} {D[144]} {D[145]} {D[146]} {D[147]} {D[148]} {D[149]} {D[150]} {D[151]} {D[152]} {D[153]} {D[154]} {D[155]} {D[156]} {D[157]} {D[158]} {D[159]}}
