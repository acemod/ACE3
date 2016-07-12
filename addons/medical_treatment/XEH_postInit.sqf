// ACE Medical System Visual Loop

#include "script_component.hpp"

["ace_interactMenuClosed", {[objNull, false] call FUNC(displayPatientInformation); }] call CBA_fnc_addEventHandler;

//Treatment EventHandlers:
[QGVAR(actionCheckBloodPressureLocal), DFUNC(actionCheckBloodPressureLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionCheckPulseLocal), DFUNC(actionCheckPulseLocal)] call CBA_fnc_addEventHandler;
[QGVAR(addToMedicalLog), DFUNC(addToLog)] call CBA_fnc_addEventHandler;
[QGVAR(addToTriageCard), DFUNC(addToTriageCard)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_bandageLocal), DFUNC(treatmentAdvanced_bandageLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_CPRLocal), DFUNC(treatmentAdvanced_CPRLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_fullHealLocal), DFUNC(treatmentAdvanced_fullHealLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_medicationLocal), DFUNC(treatmentAdvanced_medicationLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentBasic_bloodbagLocal), DFUNC(treatmentBasic_bloodbagLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentBasic_morphineLocal), DFUNC(treatmentBasic_morphineLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentIVLocal), DFUNC(treatmentIVLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentTourniquetLocal), DFUNC(treatmentTourniquetLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionPlaceInBodyBag), FUNC(actionPlaceInBodyBag)] call CBA_fnc_addEventHandler;

//Handle Deleting Bodies on Server:
if (isServer) then {["ace_placedInBodyBag", FUNC(serverRemoveBody)] call CBA_fnc_addEventHandler;};
