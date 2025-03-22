# Placement
#set_db timing_analysis_enable true

setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false -placeIOPins false
# streamOut ${design}.gds2 -merge {./subckt/sram_w16_160.gds2 ./subckt/sram_w16.gds2}
setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true
place_opt_design


