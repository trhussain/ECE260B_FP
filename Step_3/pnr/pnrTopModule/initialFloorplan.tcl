# Set floorplan with estimated core area & utilization
# floorPlan -site core -r 0.55 0.70 10.0 10.0 10.0 10.0
floorPlan -site core -r 0.5 0.70 10.0 10.0 10.0 10.0
# 0.7 : Core Utilization Factor 


# Pre-placement timing chec - ID timing issues pre-placement
timeDesign -preplace -prefix preplace

# -------- Cross Check against CorePower -------- #
# Global power routing
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose


# # Add power rings
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}

# Add power stripes 
addStripe -number_of_sets 20 -spacing 5 -layer M6 -width 2 -start_offset 20 -stop_offset 20 -nets { VSS VDD } -direction horizontal

# via https://ucsd.instructure.com/courses/61768/discussion_topics/895458
# setObjFPlanBox Instance qmem_instance 75 220 600 330
# setObjFPlanBox Instance kmem_instance 405 220 800 330
# setObjFPlanBox Instance psum_mem_instance 150 45 1000 200
setObjFPlanBox Instance qmem_instance 75 190 300 290
setObjFPlanBox Instance kmem_instance 415 190 700 290
setObjFPlanBox Instance psum_mem_instance 160 50 500 200

flipOrRotateObject -flip MY -name qmem_instance
flipOrRotateObject -flip MY -name kmem_instance
flipOrRotateObject -flip MY -name psum_mem_instance

addHaloToBlock {3 3 3 3} qmem_instance 
addHaloToBlock {3 3 3 3} kmem_instance 
addHaloToBlock {3 3 3 3} psum_mem_instance 
addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5}

# # Routing of standard signals
sroute

# # Set floorplan with estimated core area & utilization
# floorPlan -site core -r 0.5 0.70 10.0 10.0 10.0 10.0
# # 0.7 : Core Utilization Factor 


# # Pre-placement timing chec - ID timing issues pre-placement
# timeDesign -preplace -prefix preplace

# # -------- Cross Check against CorePower -------- #
# # Global power routing
# globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
# globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose


# # # Add power rings
# addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}

# # Add power stripes 
# addStripe -number_of_sets 30 -spacing 5 -layer M6 -width 2 -start_offset 20 -stop_offset 20 -nets { VSS VDD } -direction horizontal

# # via https://ucsd.instructure.com/courses/61768/discussion_topics/895458
# setObjFPlanBox Instance qmem_instance 25 250 300 350
# setObjFPlanBox Instance kmem_instance 400 250 700 350
# setObjFPlanBox Instance psum_mem_instance 200 50 500 200

# addHaloToBlock {3 3 3 3} qmem_instance 
# addHaloToBlock {3 3 3 3} kmem_instance 
# addHaloToBlock {3 3 3 3} psum_mem_instance 
# # # Routing of standard signals
# sroute
