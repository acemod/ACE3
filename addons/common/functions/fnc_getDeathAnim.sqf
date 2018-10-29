#include "script_component.hpp"
/*
 * Author: Glowbal, PabstMirror
 * Get the death animation for the unit at current time
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * animation <STRING>
 *
 * Example:
 * [bob] call ace_common_fnc_getDeathAnim
 *
 * Public: No
 */

params ["_unit"];

private _returnAnimation = "";

private _animationState = animationState _unit;
private _unitAnimationCfg = configFile >> "CfgMovesMaleSdr" >> "States" >> _animationState;

//If we're already in a terminal animation just return current
if (getNumber (_unitAnimationCfg >> "terminal") == 1) exitWith {_animationState};

private _unitActionsCfg = configFile >> "CfgMovesBasic" >> "Actions" >> getText (_unitAnimationCfg >> "actions");

TRACE_2("Animation/Action", configName _unitAnimationCfg, configName _unitActionsCfg);

if (vehicle _unit != _unit) then {
    private _interpolateArray = getArray (_unitAnimationCfg >> "interpolateTo");

    for "_index" from 0 to (count _interpolateArray - 1) step 2 do {
        private _indexAnimation = _interpolateArray select _index;

        //No guarentee that first animation will be right so scan for the first "terminal" animation
        //E.G.: interpolateTo[] = {"passenger_apc_generic04still",1,"KIA_passenger_apc_generic04",1};

        if (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> _indexAnimation >> "terminal") == 1) exitWith {
            _returnAnimation = _indexAnimation;
        };
    };
} else {
    _returnAnimation = getText (_unitActionsCfg >> "die");
};

//Fallback if nothing valid found:
if (_returnAnimation == "") then {_returnAnimation = "Unconscious"};

_returnAnimation
