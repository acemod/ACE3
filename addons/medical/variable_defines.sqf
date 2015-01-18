// public variables
[QGVAR(openWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(bandagedWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(fractures),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(airway), 0, true,  QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(tourniquets),[0,0,0,0,0,0],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(splints),[0,0,0,0,0,0],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(isBleeding),false,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(hasPain),false,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(hasLostBlood),false,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(airwayTreated),false,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);

// Airway
[QGVAR(airwayOccluded), false, true,  QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(airwayRespiratoryArrest), false, true,  QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(airwayCollapsed), false, true,  QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(airwayStatus), 100, false,  QUOTE(ADDON)] call EFUNC(common,defineVariable);

// logs
[QGVAR(quickViewLog),[],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(activityLog),[],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(triageLevel),0,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(triageCard),[],true, QUOTE(ADDON)] call EFUNC(common,defineVariable);

[QGVAR(medicClass),0,true, QUOTE(ADDON),0,true] call EFUNC(common,defineVariable); // should be a persistent variable; must not be removed by a reset all defaults call
[QGVAR(isMedicalFacility),0,true, QUOTE(ADDON),0,true] call EFUNC(common,defineVariable); // should be a persistent variable; must not be removed by a reset all defaults call

[QGVAR(noInstantDeath),false,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(inCardiacArrest),false,true, QUOTE(ADDON)] call EFUNC(common,defineVariable);

// private variables
[QGVAR(bloodVolume),100,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(bloodIVVolume),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(plasmaIVVolume),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(salineIVVolume),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);

[QGVAR(amountOfPain),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(heartRate),80,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(andrenaline),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(heartRateAdjustments),[],false, QUOTE(ADDON)] call EFUNC(common,defineVariable);

[QGVAR(bloodPressure), [80,120],false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(peripheralResistance), 100,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(cardiacOutput), 5.25,false, QUOTE(ADDON)] call EFUNC(common,defineVariable); // Source for default: http://en.wikipedia.org/wiki/Cardiac_output#Example_values

[QGVAR(givenMorphine),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(givenAtropine),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(givenEpinephrine),0,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);

[QGVAR(bodyPartStatus),[0,0,0,0,0,0],false, QUOTE(ADDON)] call EFUNC(common,defineVariable);
[QGVAR(bodyPartStatusPrevious),[0,0,0,0,0,0],false, QUOTE(ADDON)] call EFUNC(common,defineVariable);

[QGVAR(addedToUnitLoop),false,false, QUOTE(ADDON)] call EFUNC(common,defineVariable);

GVAR(VarDefinesCompleted) = true;

diag_log "finished variable defines";