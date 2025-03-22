Process

0. source loadDesign.tcl <- doesn't get loaded in via source *.enc
1. loadDesign.tcl 
2. initFloorPlan.tcl 


3. pinPlacement.tcl
-Step1.enc


4. placement.tcl
Does both placement 
-Step2.enc 





5. clock.tcl
-Step4.enc

6. routing.tcl 
-Step5_postRoute.tcl

7. outputGen.tcl

- Final: finalStepRC.enc 
- Final: finalStep.enc