# Set floorplan with estimated core area & utilization
floorPlan -site core -r 0.5 0.70 10.0 10.0 10.0 10.0
# 0.7 : Core Utilization Factor 


# Pre-placement timing chec - ID timing issues pre-placement
timeDesign -preplace -prefix preplace



# -------- Cross Check against CorePower -------- #
# Global power routing
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# via https://ucsd.instructure.com/courses/61768/discussion_topics/895458
setObjFPlanBox Instance core_instance/qmem_instance 25 75.4675 52.9745 99.8675
setObjFPlanBox Instance core_instance/kmem_instance 25 25.831 52.971 52.231
setObjFPlanBox Instance core_instance/psum_mem_instance 25 50.831 12.971 52.231

addHaloToBlock {3 3 3 3} core_instance/qmem_instance 
addHaloToBlock {3 3 3 3} core_instance/kmem_instance 
addHaloToBlock {3 3 3 3} core_instance/psum_mem_instance 

# Add power rings
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}

# Add power stripes 
addStripe -number_of_sets 4 -spacing 5 -layer M6 -width 2 -start_offset 20 -stop_offset 20 -nets { VSS VDD } -direction horizontal

# Routing of standard signals
sroute