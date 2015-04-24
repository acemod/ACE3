/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> <OPTIONAL>
 * 2: Minimum unconscious time <NUMBER> <OPTIONAL>
 *
 * ReturnValue:
 * nil
 *
 * Public: yes
 */

#include "script_component.hpp"

#define DEFAULT_DELAY   (round(random(10)+5))

private ["_unit", "_set", "_animState", "_originalPos", "_captiveSwitch", "_startingTime","_minWaitingTime"];
_unit = _this select 0;
_set = if (count _this > 1) then {_this select 1} else {true};
_minWaitingTime = if (count _this > 2) then {_this select 2} else {DEFAULT_DELAY};

// No change, fuck off. (why is there no xor?)
if (_set isEqualTo (_unit getVariable ["ACE_isUnconscious", false])) exitWith {};

// Remove maximum unconsciousness time handler
_maxUnconHandle = _unit getVariable [QGVAR(maxUnconTimeHandle), -1];
if (_maxUnconHandle > 0) then {
    [_maxUnconHandle] call CBA_fnc_removePerFrameHandler;
};

if !(_set) exitwith {
    _unit setvariable ["ACE_isUnconscious", false, true];
};

if !(!(isNull _unit) && {(_unit isKindOf "CaManBase") && ([_unit] call EFUNC(common,isAwake))}) exitwith{};

if (!local _unit) exitwith {
    [[_unit], QUOTE(DFUNC(setUnconscious)), _unit, false] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
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
if (!([_unit] call EFUNC(common,IsPlayer)) && (GVAR(enableUnsconsiousnessAI) == 0 || (GVAR(enableUnsconsiousnessAI) == 2 && random(1) <= 0.5))) exitwith {
    [_unit, true] call FUNC(setDead); // force, to avoid getting into a loop in case revive is enabled.
};

// If a unit has the launcher out, it will sometimes start selecting the primairy weapon while unconscious,
// therefor we force it to select the primairy weapon before going unconscious
if ((vehicle _unit) isKindOf "StaticWeapon") then {
    moveOut _unit;
    unassignVehicle _unit;
    //_unit action ["eject", vehicle _unit];
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
_animState = animationState _unit;
_originalPos = unitPos _unit;

_unit setUnitPos "DOWN";
[_unit, true] call EFUNC(common,disableAI);

// So the AI does not get stuck, we are moving the unit to a temp group on its own.
//Unconscious units shouldn't be put in another group #527:
if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
    [_unit, true, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
};

[_unit, QGVAR(unconscious), true] call EFUNC(common,setCaptivityStatus);
_anim = [_unit] call EFUNC(common,getDeathAnim)
[_unit, _anim, 1, true] call EFUNC(common,doAnimation);
[{
    _unit = _this select 0;
    _anim = _this select 1;
    if (_unit getVariable "ACE_isUnconscious") then {
        [_unit, _anim, 2, true] call EFUNC(common,doAnimation);
    };
}, [_unit, _anim], 2, 1] call EFUNC(common,waitAndExecute);

_startingTime = time;

[DFUNC(unconsciousPFH), 0.1, [_unit,_animState, _originalPos, _startingTime, _minWaitingTime, false, vehicle _unit isKindOf "ParachuteBase"] ] call CBA_fnc_addPerFrameHandler;

// Maximum unconsciousness time
_maxUnconTime = _unit getVariable [QGVAR(maxUnconsciousTime), GVAR(maxUnconsciousTime)];
if (_maxUnconTime >= 0) then {
    _handle = [{
        _unit = _this select 0;
        [_unit] call FUNC(setDead);
    }, [_unit], _maxUnconTime, 0.5] call EFUNC(common,waitAndExecute);
    _unit setVariable [QGVAR(maxUnconTimeHandle), _handle];
};

["medical_onUnconscious", [_unit, true]] call EFUNC(common,globalEvent);
