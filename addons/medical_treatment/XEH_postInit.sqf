#include "script_component.hpp"

[QEGVAR(medical_status,initialized), {
    params ["_unit"];

    // Clear all saved medical logs
    {
        _unit setVariable [_x, nil, true];
    } forEach (_unit getVariable [QEGVAR(medical,allLogs), []]);

    _unit setVariable [QEGVAR(medical,allLogs), [], true];

    [_unit] call FUNC(checkItems);
}] call CBA_fnc_addEventHandler;

["loadout", FUNC(checkItems)] call CBA_fnc_addPlayerEventHandler;

// Handle bodybags and litter on server
if (isServer) then {
    [QGVAR(createLitterServer), FUNC(createLitterServer)] call CBA_fnc_addEventHandler;
    ["ace_placedInBodyBag", FUNC(serverRemoveBody)] call CBA_fnc_addEventHandler;
};

// treatment events
[QGVAR(bandageLocal), FUNC(bandageLocal)] call CBA_fnc_addEventHandler;
[QGVAR(tourniquetLocal), FUNC(tourniquetLocal)] call CBA_fnc_addEventHandler;
[QGVAR(medicationLocal), FUNC(medicationLocal)] call CBA_fnc_addEventHandler;
[QGVAR(ivBagLocal), FUNC(ivBagLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentCPRLocal), FUNC(treatmentCPRLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentFullHealLocal), FUNC(treatmentFullHealLocal)] call CBA_fnc_addEventHandler;
[QGVAR(splintLocal), FUNC(splintLocal)] call CBA_fnc_addEventHandler;

// action events
[QGVAR(checkPulseLocal), FUNC(checkPulseLocal)] call CBA_fnc_addEventHandler;
[QGVAR(checkBloodPressureLocal), FUNC(checkBloodPressureLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionPlaceInBodyBag), FUNC(actionPlaceInBodyBag)] call CBA_fnc_addEventHandler;

// log events
[QGVAR(addToMedicalLog), FUNC(addToLog)] call CBA_fnc_addEventHandler;
[QGVAR(addToTriageCard), FUNC(addToTriageCard)] call CBA_fnc_addEventHandler;
