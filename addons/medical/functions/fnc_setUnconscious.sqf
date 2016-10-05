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
 * nil
 *
 * Example:
 * [bob, true] call ace_medical_fnc_setUnconscious;
 *
 * Public: yes
 */

#include "script_component.hpp"

#define DEFAULT_DELAY (round(random(10)+5))

// only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(setUnconscious), _this];
};

params ["_unit", ["_set", true], ["_minUnconsciousTime", DEFAULT_DELAY], ["_force", false]];

if (_set isEqualTo (_unit getVariable ["ACE_isUnconscious", false])) exitWith {};

if !(_set) exitWith {
    _unit setVariable ["ACE_isUnconscious", false, true];

    if (_unit getVariable [QGVAR(inReviveState), false]) then {
        _unit setVariable [QGVAR(inReviveState), nil, true];
    };

    [_unit, false] call EFUNC(medical_engine,setUnconsciousAnim);

    ["ace_unconscious", [_unit, false]] call CBA_fnc_globalEvent;
};

if (isNull _unit || {!(_unit isKindOf "CAManBase")}) exitWith {};

if (!local _unit) exitWith {
    [QGVAR(setUnconscious), [_unit, _set, _minUnconsciousTime, _force], _unit] call CBA_fnc_targetEvent;
};

_unit setVariable ["ACE_isUnconscious", true, true];

if (_unit == ACE_player) then {
    if (visibleMap) then {openMap false};

    while {dialog} do {
        closeDialog 0;
    };
};

// if we have unconsciousness for AI disabled, we will kill the unit instead
private _isDead = false;

if (!([_unit, GVAR(remoteControlledAI)] call EFUNC(common,isPlayer)) && !_force) then {
    _enableUncon = _unit getVariable [QGVAR(enableUnconsciousnessAI), GVAR(enableUnconsciousnessAI)];

    if (_enableUncon == 0 or {_enableUncon == 1 and (random 1) < 0.5}) then {
        [_unit, true] call FUNC(setDead);
        _isDead = true;
    };
};

if (_isDead) exitWith {};

// So the AI does not get stuck, we are moving the unit to a temp group on its own.
// Unconscious units shouldn't be put in another group #527:
if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
    [_unit, true, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
};

// Delay Unconscious so the AI dont instant stop shooting on the unit #3121
[{
    params ["_unit"];

    if (_unit getVariable ["ACE_isUnconscious", false]) then {
        [_unit, "setCaptive", "ace_unconscious", true] call EFUNC(common,statusEffect_set);
    };
}, _unit, 3] call CBA_fnc_waitAndExecute;

[_unit, true] call EFUNC(medical_engine,setUnconsciousAnim);

[_unit, "Unconscious", []] call FUNC(stateEvent);

["ace_unconscious", [_unit, true]] call CBA_fnc_globalEvent;

// auto wake up, testing @todo
[{
    params ["_unit", "_time"];

    !(_unit getVariable ["ACE_isUnconscious", false]) || {CBA_missionTime > _time}
}, {
    params ["_unit"];

    if (_unit getVariable ["ACE_isUnconscious", false]) then {
        [_unit, false] call FUNC(setUnconscious);
    };
}, [_unit, CBA_missionTime + _minUnconsciousTime]] call CBA_fnc_waitUntilAndExecute;
