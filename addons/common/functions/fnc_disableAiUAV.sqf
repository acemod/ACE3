#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Disables/Enables UAV AI crew members, can be run on any machine and is applied globally.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Disable AI <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true] call ace_common_fnc_disableAiUAV
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_disable", true, [false]]];

if (!alive _unit || {_unit call FUNC(isPlayer)} || {!unitIsUAV _unit}) exitWith {};

if (_disable) then {
    // Disable shooting and targetting on every machine
    private _jipID = [QGVAR(disableAiUAV), [_unit, _disable]] call CBA_fnc_globalEventJIP;
    [_jipID, _unit] call CBA_fnc_removeGlobalEventJIP;

    _unit setVariable [QGVAR(disableAiUavJipID), _jipID, true];
} else {
    // Restore shooting and targeting to each client's individual state prior to disabling
    private _jipID = _unit getVariable QGVAR(disableAiUavJipID);

    if (!isNil "_jipID") then {
        _jipID call CBA_fnc_removeGlobalEventJIP;

        _unit setVariable [QGVAR(disableAiUavJipID), nil, true];
    };

    [QGVAR(disableAiUAV), [_unit, _disable]] call CBA_fnc_globalEvent;
};
