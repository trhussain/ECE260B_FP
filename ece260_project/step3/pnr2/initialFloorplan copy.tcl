# Set floorplan with estimated core area & utilization
floorPlan -site core -r 0.3 0.70 10.0 10.0 10.0 10.0
# 0.7 : Core Utilization Factor 


# Pre-placement timing chec - ID timing issues pre-placement
timeDesign -preplace -prefix preplace



# -------- Cross Check against CorePower -------- #
# Global power routing
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# Add power rings
# addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}

# Add power stripes 
addStripe -number_of_sets 4 -spacing 5 -layer M4 -width 2 -start_offset 20 -stop_offset 20 -nets { VSS VDD }

# Routing of standard signals
sroute
