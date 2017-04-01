/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> (default: true)
 *
 * ReturnValue:
 * Success? <BOOLEAN>
 *
 * Example:
 * [bob, true] call ace_medical_fnc_setUnconscious;
 *
 * Public: yes
 */
#include "script_component.hpp"

// only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(setUnconscious), _this];
};

params ["_unit", ["_knockOut", true]];

if (isNull _unit || {!(_unit isKindOf "CAManBase")}) exitWith {false};

if (!local _unit) exitWith {
    [QGVAR(setUnconscious), [_unit, _knockOut], _unit] call CBA_fnc_targetEvent;
    true
};

if (_knockOut isEqualTo (_unit getVariable [QGVAR(isUnconscious), false])) exitWith {false};

// --- wake up
if !(_knockOut) exitWith {
    _unit setVariable [QGVAR(isUnconscious), false, true];

    [_unit, false] call EFUNC(medical_engine,setUnconsciousAnim);
    ["ace_unconscious", [_unit, false]] call CBA_fnc_globalEvent;

    true
};

// --- knock out
_unit setVariable [QGVAR(isUnconscious), true, true];
_unit setVariable [QGVAR(lastWakeUpCheck), CBA_missiontime];

if (_unit == ACE_player) then {
    if (visibleMap) then {openMap false};

    while {dialog} do {
        closeDialog 0;
    };
};

[_unit, true] call EFUNC(medical_engine,setUnconsciousAnim);
[QGVAR(Unconscious), _unit] call CBA_fnc_localEvent;
["ace_unconscious", [_unit, true]] call CBA_fnc_globalEvent;

true
