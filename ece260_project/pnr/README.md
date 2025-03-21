Process

0. source loadDesign.tcl <- doesn't get loaded in via source *.enc
1. loadDesign.tcl 
2. initFloorPlan.tcl 

- Checkpoint: saveDesign step1.enc

3. pinPlacement.tcl
HW4: Spacing = 0.8um, depth = 0.6um, width = 0.1um, M3
this: M3, 0.25 Depth, 0.6 Width, Spacing differs per side 
4. placement.tcl
Does both placement and filler cells 

- Checkpoint: saveDesign step2.enc
Both are the same version below! 
- Checkpoint: saveDesign twozeroonePostPlacement.enc
- Checkpoint: saveDesign step2v2.enc 

5. clock.tcl

- Checkpoint: saveDesign step3.enc

6. routing.tcl 

- Checkpoint: saveDesign step4.tcl
- Checkping: savdesign step4RCSaved.tcl -rc (RC Information saved?)

7. outputGen.tcl

- Final: finalStepRC.enc 
- Final: finalStep.enc