
#include "script_component.hpp"

[QEGVAR(medical,initialized), FUNC(checkItems)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(createLitterServer), FUNC(litterHandleCreate)] call CBA_fnc_addEventHandler;
};

// treatment events
[QGVAR(treatmentBandageLocal), FUNC(treatmentBandageLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentTourniquetLocal), FUNC(treatmentTourniquetLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentMorphineLocal), FUNC(treatmentMorphineLocal)] call CBA_fnc_addEventHandler;
//[QGVAR(treatmentEpipenLocal), FUNC(treatmentEpipenLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentMedicationLocal), FUNC(treatmentMedicationLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentIVLocal), FUNC(treatmentIVLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentCPRLocal), FUNC(treatmentCPRLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentFullHealLocal), FUNC(treatmentFullHealLocal)] call CBA_fnc_addEventHandler;

// action events
[QGVAR(actionCheckPulseLocal), FUNC(actionCheckPulseLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionCheckBloodPressureLocal), FUNC(actionCheckBloodPressureLocal)] call CBA_fnc_addEventHandler;
