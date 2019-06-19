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

["loadout", LINKFUNC(checkItems)] call CBA_fnc_addPlayerEventHandler;

// Handle body removal and litter on server
if (isServer) then {
    [QGVAR(createLitterServer), LINKFUNC(createLitterServer)] call CBA_fnc_addEventHandler;
    ["ace_placedInBodyBag", LINKFUNC(removeBody)] call CBA_fnc_addEventHandler;
};

// Treatment events
[QGVAR(bandageLocal), LINKFUNC(bandageLocal)] call CBA_fnc_addEventHandler;
[QGVAR(checkBloodPressureLocal), LINKFUNC(checkBloodPressureLocal)] call CBA_fnc_addEventHandler;
[QGVAR(checkPulseLocal), LINKFUNC(checkPulseLocal)] call CBA_fnc_addEventHandler;
[QGVAR(cprLocal), LINKFUNC(cprLocal)] call CBA_fnc_addEventHandler;
[QGVAR(fullHealLocal), LINKFUNC(fullHealLocal)] call CBA_fnc_addEventHandler;
[QGVAR(ivBagLocal), LINKFUNC(ivBagLocal)] call CBA_fnc_addEventHandler;
[QGVAR(medicationLocal), LINKFUNC(medicationLocal)] call CBA_fnc_addEventHandler;
[QGVAR(placeInBodyBag), LINKFUNC(placeInBodyBag)] call CBA_fnc_addEventHandler;
[QGVAR(splintLocal), LINKFUNC(splintLocal)] call CBA_fnc_addEventHandler;
[QGVAR(tourniquetLocal), LINKFUNC(tourniquetLocal)] call CBA_fnc_addEventHandler;

// Logging events
[QGVAR(addToLog), LINKFUNC(addToLog)] call CBA_fnc_addEventHandler;
[QGVAR(addToTriageCard), LINKFUNC(addToTriageCard)] call CBA_fnc_addEventHandler;
