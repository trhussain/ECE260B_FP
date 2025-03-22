###############################################################
#  Generated by:      Cadence Innovus 15.23-s045_1
#  OS:                Linux x86_64(Host ID ieng6-ece-17.ucsd.edu)
#  Generated on:      Sat Mar 22 01:41:17 2025
#  Design:            core
#  Command:           saveDesign cts.enc
###############################################################

################################################
#  Preference File                             #
################################################

################################################
#  Syntax for Design-related/non-color pref:   #
#  setPreference <preference_name> <value>     #
################################################
setPreference DesignHierChar {/}
setPreference DEFHierChar {/}
setPreference PDEFBusDelim {[]}
setPreference LecDofile 0
setPreference CmdLogMode 1
setPreference ConstraintUserXGrid 0.0
setPreference ConstraintUserYGrid 0.0
setPreference ConstraintUserXOffset 0.0
setPreference ConstraintUserYOffset 0.0
setPreference SnapAllCorners 0
setPreference UserGridUnit 0
setPreference LogTypeInCmd 0
setPreference logviewer 0
setPreference EnableRectilinearDesign 0
catch {fpiSetSnapRule -for CON -grid IG -force}
catch {fpiSetSnapRule -for BLK -grid MG -force}
catch {fpiSetSnapRule -for PLK -grid IG -force}
catch {fpiSetSnapRule -for IOP -grid MG -force}
catch {fpiSetSnapRule -for DIE -grid PG -force}
catch {fpiSetSnapRule -for CORE -grid PG -force}

################################################
#  Syntax for Display-related/non-color pref:  #
#  setPreference <preference_name> <value>     #
################################################
setPreference InstDisplayThreshold 0.0
setPreference WireDisplayCheck2D 0
setPreference WireDisplayThreshold 2
setPreference MinFPModuleSize 100
setPreference MinFlightLineWidth 1
setPreference MaxFlightLineNetTerms 500
setPreference HiliteNetWhenQueryObj 1
setPreference HiliteShapeWhenSelectNet 0
setPreference SelectNetWhenSelectPin 0
setPreference QueryWireNet 0
setPreference SelectByArea 0
setPreference WinSelectMargin 8
setPreference ShowNumberBlockConnection 0
setPreference StrecthRestriction 0
setPreference StretchRectilinear 0
setPreference MoveRestriction 0
setPreference DisplayRelFPlan 1
setPreference DisplayPtnPin 1
setPreference DisplayFPlanFlightLine 1
setPreference DisplayPinName 0
setPreference InstanceText Instance
setPreference ShowNetFullName 0
setPreference ShowNetNameWithLayerColor 0
setPreference TermCrossPix 4
setPreference ExclusiveFlight 0
setPreference FlightLineInMove 1
setPreference AutoRedraw 1
setPreference ShowViaMetal 0
setPreference IgnoreAmoebaRatio 0
setPreference DisplayCellPattern 0
setPreference DrawInstByPlaceStatus 1
setPreference ShowCrossLineWhenSelect 1
setPreference ShowConnectionInOutNumber 0
setPreference ConnectionColorType 0
setPreference OnlyBundleNetFlight 0
setPreference FromOutputPin 0
setPreference ShowFlightLineTermMark 0
setPreference DisplayPlaceFlightLine 0
setPreference NoBlockFlightLine 0
setPreference NoInstFlightLine 0
setPreference NoModuleFlightLine 0
setPreference NoIoCellFlightLine 0
setPreference NoBlackBoxFlightLine 0
setPreference ShowConnectionWithWidth 0
setPreference FLWidthThresholdLow 20
setPreference FLWidthThresholdHigh 80
setPreference percentageOfPan 30
setPreference scaleOfZoom 3.0
setPreference WheelZoomWithModify 0
setPreference ShowBothInputConnection 0
setPreference ShowNetWeightConnection 1
setPreference ShowFlightLineThruPtnPin 0
setPreference ShowLefLayerName 1
setPreference ShowAttrPopup 1
setPreference EnlargeLogicalPin 1
setPreference ShowDelBox 0
setPreference SelectByLine 0
setPreference SelectStickyMode 0
setPreference ShowUnplacedInst 0
setPreference ShowRectilinearPad 0
setPreference zoomPrevCount 1
setPreference noInsideMacro 0
setPreference ShowParentModule 0
setPreference ShowChildPartition 0
setPreference ShowAllFence 0
setPreference SkipBufferFlightline 0
setPreference ShowFPObjInPlace 0
setPreference DrawFlightlineLast 0
setPreference NoClockFlightline 0
setPreference OnlyClockFlightline 0
setPreference DetailDisplayFactor 16
setPreference SingleLayerMode 0
setPreference QuerySkipInst 0
setPreference QuerySkipInstObs 0
setPreference QuerySkipInstPin 0
setPreference QuerySkipRegular 0
setPreference QuerySkipSpecial 0
setPreference ShowModuleText 1
setPreference ShowAmoebaModuleText 1
setPreference ShowRowSiteText 1
setPreference ShowIoPadText 1
setPreference ShowInstanceText 1
setPreference ShowInstancePinText 1
setPreference ShowIoPinText 1
setPreference ShowGroupText 1
setPreference ShowBumpText 1
setPreference ShowClockTreeText 1
setPreference ShowChannelText 1
setPreference ShowLefPortNumText 1
setPreference ShowMacroSitePtnText 1
setPreference ShowSIPFingerText 1
setPreference ShowNetText 1
setPreference TextDisplaySize a
setPreference AutoDetailDisplay 0

################################################
#  Syntax for Floorplan-related/non-color pref:#
#  setPreference <preference_name> <value>     #
################################################
setPreference CloneSnapMaster 0
setPreference MoveMacrosWithGuide 0
setPreference MoveMacrosWithRegion 0
setPreference MoveMacrosWithFence 1
setPreference MoveStdCellWithGuide 0
setPreference MoveStdCellWithRegion 0
setPreference MoveStdCellWithFence 0
setPreference MovePreplacedStdCellOnly 0

################################################
#  Syntax for Comgestion Map related pref:     #
#  setPreference <preference_name> <value>     #
################################################
setPreference VertViolation 0.0
setPreference HorzViolation 0.0
setPreference CongestionMapnrStyle 0
setPreference CongestionMaptrStyle 0
setPreference CongestionMaprange0 -2
setPreference CongestionMapcolor0 0
setPreference CongestionMaprange1 -1
setPreference CongestionMapcolor1 0
setPreference CongestionMaprange2 0
setPreference CongestionMapcolor2 1
setPreference CongestionMaprange3 1
setPreference CongestionMapcolor3 2
setPreference CongestionMaprange4 2
setPreference CongestionMapcolor4 3
setPreference CongestionMaprange5 3
setPreference CongestionMapcolor5 5
setPreference CongestionMaprange6 4
setPreference CongestionMapcolor6 9
setPreference CongestionMaprange7 5
setPreference CongestionMapcolor7 11
setPreference CongestionMaprange8 6
setPreference CongestionMapcolor8 11
setPreference CongestionMaprange9 27
setPreference CongestionMapcolor9 11
setLayerPreference congestH -isVisible 0
setLayerPreference congestV -isVisible 0
setLayerPreference congestObj -isVisible 0

################################################
#  Syntax for flightline color related pref:   #
#  setPreference <preference_name> <value>     #
################################################
setPreference InputConnectionColor red
setPreference OutputConnectionColor green
setPreference InoutConnectionColor yellow
setPreference MixtureConnectionColor blue

