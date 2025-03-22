# Placement
saveDesign floorplan.enc
#set_db timing_analysis_enable true

setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false -placeIOPins false
# streamOut ${design}.gds2 -merge {./subckt/sram_w16_160.gds2 ./subckt/sram_w16.gds2}
setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true
place_opt_design

addFiller -cell {DCAP DCAP4 DCAP8 DCAP16 DCAP32} -merge true

saveDesign step3.enc
