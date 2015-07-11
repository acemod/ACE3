/*
 * Author: KoffeinFlummi, commy2, Rocko, Rommel, Ruthberg
 * Ear ringing PFH
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: strength of ear ringing (Number between 0 and 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _strength] call ace_hearing_fnc_earRinging
 *
 * Public: No
 */
#include "script_component.hpp"

if (GVAR(DisableEarRinging)) exitWith {};

PARAMS_2(_unit,_strength);

if (_unit != ACE_player) exitWith {};
if (_strength < 0.05) exitWith {};

if (_unit getVariable ["ACE_hasEarPlugsin", false]) then {
    _strength = _strength / 4;
};

//headgear hearing protection
if(headgear _unit != "") then {
    private ["_protection"];
    _protection = (getNumber (configFile >> "CfgWeapons" >> (headgear _unit) >> QGVAR(protection))) min 1;
    if(_protection > 0) then {
        _strength = _strength * (1 - _protection);
    };
};

GVAR(deafnessDV) = GVAR(deafnessDV) + _strength;
