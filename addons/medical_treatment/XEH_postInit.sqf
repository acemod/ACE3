#include "script_component.hpp"

[QEGVAR(medical_status,initialized), {
    params ["_unit"];

    // Clear all saved medical logs
    {
        _unit setVariable [_x, nil, true];
    } forEach (_unit getVariable [QEGVAR(medical,allLogs), []]);

    _unit setVariable [QEGVAR(medical,allLogs), [], true];
}] call CBA_fnc_addEventHandler;

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

// replace medical items with their ACE equivalents
["ace_settingsInitialized", {
    TRACE_1("ace_settingsInitialized EH",GVAR(convertItems)); // 0: Enabled 1: RemoveOnly 2:Disabled
    if (GVAR(convertItems) == 2) exitWith {};
    {
        // turn [["stuff", 2], ...] into ["stuff", "stuff", ...]
        private _replacements = [];
        if (GVAR(convertItems) == 0) then {
            {
                _x params ["_item", "_count"];
                for "_i" from 1 to _count do {
                    _replacements pushBack _item;
                };
            } forEach getArray _x;
        };

        // check if replacement is for item type or class name
        private _configName = configName _x;
        private _toReplace = if ((_configName select [0,9]) == "ItemType_") then {
            parseNumber (_configName select [9])
        } else {
            _configName
        };

        // register replacement
        [_toReplace, _replacements] call EFUNC(common,registerItemReplacement);
    } forEach (configProperties [configFile >> QEGVAR(medical,replacementItems), "isArray _x"]);
}] call CBA_fnc_addEventHandler;
