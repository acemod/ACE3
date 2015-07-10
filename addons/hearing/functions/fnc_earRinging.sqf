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

if (isNull _unit) exitWith {};
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

_unit setVariable [QGVAR(dv), (_unit getVariable [QGVAR(dv), 0]) + _strength];

if (GVAR(earRingingPFH) != -1) exitWith {};

GVAR(earRingingPFH) = [{
    EXPLODE_1_PVT(_this select 0,_unit);
    private ["_prior"];
    _prior = (_unit getvariable [QGVAR(dv), 0]) min 20;

    if (!alive _unit || _prior <= 0 || GVAR(DisableEarRinging)) exitWith {
        _unit setVariable [QGVAR(dv), 0];
        _unit setVariable [QGVAR(prior), 0];
        GVAR(beep) = false;
        GVAR(beep2) = false;
        GVAR(time2) = 0;
        GVAR(time3) = 0;
        GVAR(time4) = 0;
        GVAR(earRingingPFH) = -1;
        [_this select 1] call cba_fnc_removePerFrameHandler;
    };

    if (((_unit getvariable [QGVAR(dv), 0]) - (_unit getvariable [QGVAR(prior), 0])) > 2) then {
        if (ACE_time > GVAR(time3)) then {
            GVAR(beep2) = false;
        };
        if (!GVAR(beep2)) then {
            playSound "ACE_Combat_Deafness";
            GVAR(beep2) = true;
            GVAR(time3) = ACE_time + 5;
        };
    };

    _unit setvariable [QGVAR(prior), _prior];
    GVAR(volume) = (1 -  (_prior / 20)) max 0;

    if (_prior > 19.75) then {
        _unit setvariable [QGVAR(deaf), true];
    } else {
        _unit setvariable [QGVAR(deaf), false];
    };

    if ((_unit getvariable [QGVAR(deaf), false]) && {ACE_time > GVAR(time4)}) then {
        playSound "ACE_Combat_Deafness";
        GVAR(beep2) = true;
        GVAR(time3) = ACE_time + 10;
        GVAR(time4) = ACE_time + 30;
    };

    // Hearing takes longer to return to normal after it hits rock bottom
    _unit setvariable [QGVAR(dv), _prior - (0.5 * (GVAR(volume) max 0.1))];

    if (_prior > 10) then {
        //check if the ringing is already being played
        if (ACE_time > GVAR(time2)) then {
            GVAR(beep) = false;
        };
        if (!GVAR(beep)) then {
            playSound "ACE_Ring_Backblast";
            GVAR(time2) = ACE_time + 22;
            GVAR(beep) = true;
        };
    };
}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
