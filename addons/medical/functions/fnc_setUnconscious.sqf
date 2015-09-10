/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> (default: true)
 * 2: Minimum unconscious ACE_time <NUMBER> (default: (round(random(10)+5)))
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

private ["_animState", "_originalPos", "_startingTime", "_isDead"];
params ["_unit", ["_set", true], ["_minWaitingTime", DEFAULT_DELAY], ["_force", false]];

// No change, fuck off. (why is there no xor?)
if (_set isEqualTo (_unit getVariable ["ACE_isUnconscious", false])) exitWith {};

if !(_set) exitwith {
    _unit setvariable ["ACE_isUnconscious", false, true];
};

if !(!(isNull _unit) && {(_unit isKindOf "CAManBase") && ([_unit] call EFUNC(common,isAwake))}) exitwith{};

if (!local _unit) exitwith {
    [[_unit, _set, _minWaitingTime, _force], QUOTE(DFUNC(setUnconscious)), _unit, false] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};

_unit setvariable ["ACE_isUnconscious", true, true];
_unit setUnconscious true;

if (_unit == ACE_player) then {
    if (visibleMap) then {openMap false};
    while {dialog} do {
        closeDialog 0;
    };
};

// if we have unconsciousness for AI disabled, we will kill the unit instead
_isDead = false;
if (!([_unit, GVAR(remoteControlledAI)] call EFUNC(common,isPlayer)) && !_force) then {
    _enableUncon = _unit getVariable [QGVAR(enableUnconsciousnessAI), GVAR(enableUnconsciousnessAI)];
    if (_enableUncon == 0 or {_enableUncon == 1 and (random 1) < 0.5}) then {
        [_unit, true] call FUNC(setDead);
        _isDead = true;
    };
};
if (_isDead) exitWith {};

// If a unit has the launcher out, it will sometimes start selecting the primairy weapon while unconscious,
// therefor we force it to select the primairy weapon before going unconscious
if ((vehicle _unit) isKindOf "StaticWeapon") then {
    [_unit] call EFUNC(common,unloadPerson);
};
if (animationState _unit in ["ladderriflestatic","laddercivilstatic"]) then {
    _unit action ["ladderOff", (nearestBuilding _unit)];
};
if (vehicle _unit == _unit) then {
    if (primaryWeapon _unit == "") then {
        _unit addWeapon "ACE_FakePrimaryWeapon";
    };
    _unit selectWeapon (primaryWeapon _unit);
};

// We are storing the current animation, so we can use it later on when waking the unit up inside a vehicle
if (vehicle _unit != _unit) then {
    _unit setVariable [QGVAR(vehicleAwakeAnim), [(vehicle _unit), (animationState _unit)]];
};

//Save current stance:
_originalPos = unitPos _unit;

_unit setUnitPos "DOWN";
[_unit, true] call EFUNC(common,disableAI);

// So the AI does not get stuck, we are moving the unit to a temp group on its own.
//Unconscious units shouldn't be put in another group #527:
if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
    [_unit, true, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
};

[_unit, QGVAR(unconscious), true] call EFUNC(common,setCaptivityStatus);
_anim = [_unit] call EFUNC(common,getDeathAnim);
[_unit, _anim, 1, true] call EFUNC(common,doAnimation);
[{
    params ["_unit", "_anim"];
    if ((_unit getVariable "ACE_isUnconscious") and (animationState _unit != _anim)) then {
        [_unit, _anim, 2, true] call EFUNC(common,doAnimation);
    };
}, [_unit, _anim], 0.5, 0] call EFUNC(common,waitAndExecute);

_startingTime = ACE_time;

[DFUNC(unconsciousPFH), 0.1, [_unit, _originalPos, _startingTime, _minWaitingTime, false, vehicle _unit isKindOf "ParachuteBase"] ] call CBA_fnc_addPerFrameHandler;

// unconscious can't talk
[_unit, "isUnconscious"] call EFUNC(common,muteUnit);

["medical_onUnconscious", [_unit, true]] call EFUNC(common,globalEvent);
