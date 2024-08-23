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

// Allow disabling of Zeus remote controlled units
if (!alive _unit || {isPlayer _unit} || {!unitIsUAV _unit}) exitWith {};

if (_disable) then {
    // Ignore if already disabled
    if (!isNil "_jipID") exitWith {};

    // Disable shooting and targeting on every machine
    // Give predefined JIP ID, in case of simultaneous executions on different machines
    private _jipID = [QGVAR(disableAiUAV), [_unit, _disable], QGVAR(disableAiUAV_) + hashValue _unit] call CBA_fnc_globalEventJIP;
    [_jipID, _unit] call CBA_fnc_removeGlobalEventJIP;

    _unit setVariable [QGVAR(disableAiUavJipID), _jipID, true];
} else {
    // Restore shooting and targeting to each client's individual state prior to disabling
    private _jipID = _unit getVariable QGVAR(disableAiUavJipID);

    if (isNil "_jipID") exitWith {};

    _jipID call CBA_fnc_removeGlobalEventJIP;

    _unit setVariable [QGVAR(disableAiUavJipID), nil, true];

    [QGVAR(disableAiUAV), [_unit, _disable]] call CBA_fnc_globalEvent;
};
