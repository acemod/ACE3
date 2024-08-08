#include "script_component.hpp"

["CBA_settingsInitialized", {
    if !(GETEGVAR(medical,enabled,false)) exitWith {};

    // Handle pain changes on injury
    [QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;

    // Add inventory and open backpack actions to units
    [QGVAR(addInventoryActions), LINKFUNC(addInventoryActions)] call CBA_fnc_addEventHandler;

    // Apply to all living and dead now
    {
        [QGVAR(addInventoryActions), _x] call CBA_fnc_localEvent;
    } forEach (allUnits + allDeadMen);

    // Apply to all future units
    ["CAManBase", "init", LINKFUNC(addInventoryActions), true, [], false] call CBA_fnc_addClassEventHandler;

    // Respawn is called locally
    ["CAManBase", "respawn", {
        params ["_unit"];
        if (!local _unit) exitWith {};
        [QGVAR(addInventoryActions), _unit] call CBA_fnc_globalEvent;
    }, true] call CBA_fnc_addClassEventHandler;

    // Handle comms status effects for spectator
    // Separate from medical_feedback as these affect unit behavior rather than what the player sees
    ["featureCamera", {
        params ["_unit", "_newCamera"];

        if (_unit isNotEqualTo ACE_player) exitWith {};

        if (_newCamera == "") then { // switched back to player view
            private _status = IS_UNCONSCIOUS(_unit);
            [_unit, _status] call FUNC(setStatusEffects);
        } else {
            [_unit, false, true] call FUNC(setStatusEffects);
        };
    }] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
