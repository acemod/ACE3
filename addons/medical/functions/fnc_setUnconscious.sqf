/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> (default: true)
 * 2: Minimum unconscious time <NUMBER> (default: (round(random(10)+5)))
 * 3: Force AI Unconscious (skip random death chance) <BOOL> (default: false)
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

params ["_unit", ["_knockOut", true], ["_minUnconsciousTime", DEFAULT_KNOCK_OUT_DELAY], ["_force", false]];

if (isNull _unit || {!(_unit isKindOf "CAManBase")}) exitWith {false};

if (!local _unit) exitWith {
    [QGVAR(setUnconscious), [_unit, _knockOut, _minUnconsciousTime, _force], _unit] call CBA_fnc_targetEvent;
    true
};

// use maximum for wake up time
if (_knockOut) then {
    _unit setVariable [QGVAR(wakeUpTime), (CBA_missionTime + _minUnconsciousTime) max (_unit getVariable [QGVAR(wakeUpTime), 0])];
};

if (_knockOut isEqualTo (_unit getVariable [QGVAR(isUnconscious), false])) exitWith {false};

// --- wake up
if !(_knockOut) exitWith {
    _unit setVariable [QGVAR(isUnconscious), false, true];

    if (_unit getVariable [QGVAR(inReviveState), false]) then {
        _unit setVariable [QGVAR(inReviveState), nil, true];
    };

    [_unit, false] call EFUNC(medical_engine,setUnconsciousAnim);
    ["ace_unconscious", [_unit, false]] call CBA_fnc_globalEvent;

    true
};

// --- knock out
_unit setVariable [QGVAR(isUnconscious), true, true];

if (_unit == ACE_player) then {
    if (visibleMap) then {openMap false};

    while {dialog} do {
        closeDialog 0;
    };
};

// if we have unconsciousness for AI disabled, we will kill the unit instead
/*
private _isDead = false;

if (!([_unit, GVAR(remoteControlledAI)] call EFUNC(common,isPlayer)) && !_force) then {
    _enableUncon = _unit getVariable [QGVAR(enableUnconsciousnessAI), GVAR(enableUnconsciousnessAI)];

    if (_enableUncon == 0 or {_enableUncon == 1 and (random 1) < 0.5}) then {
        [_unit, true] call FUNC(setDead);
        _isDead = true;
    };
};

if (_isDead) exitWith {};
*/

[_unit, true] call EFUNC(medical_engine,setUnconsciousAnim);
[_unit, "Unconscious", []] call FUNC(stateEvent);
["ace_unconscious", [_unit, true]] call CBA_fnc_globalEvent;

// auto wake up
[{
    params ["_unit"];

    private _time = _unit getVariable [QGVAR(wakeUpTime), 0];

    !(_unit getVariable [QGVAR(isUnconscious), false]) || {CBA_missionTime > _time}
}, {
    params ["_unit"];

    if (_unit getVariable [QGVAR(isUnconscious), false]) then {
        [_unit, false] call FUNC(setUnconscious);
    };
}, _unit] call CBA_fnc_waitUntilAndExecute;

true
