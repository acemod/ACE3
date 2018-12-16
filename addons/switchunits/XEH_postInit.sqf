#include "script_component.hpp"
/*
 * Author: bux578
 * Initializes the SwitchUnits pbo.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */


if (missionNamespace getVariable [QGVAR(EnableSwitchUnits), false]) then {
    [player] call FUNC(startSwitchUnits);
} else {
    ["ace_settingChanged", {
        params ["_name", "_value"];
        if ((_name == QGVAR(EnableSwitchUnits)) && {_value}) then {
            [player] call FUNC(startSwitchUnits);
        };
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    [QGVAR(switchLocality), {
        params ["_unit", "_player"];
        _unit setVariable [QGVAR(OriginalOwner), owner _unit, true];
        _unit setOwner (owner _player);
    }] call CBA_fnc_addEventHandler;
};
