/**
 * fn_playInjuredSound.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_amountOfDamage","_bodyPartStatus","_availableSounds_A","_availableSounds_B","_availableSounds_C","_sound"];
_unit = _this select 0;
if (!local _unit) exitwith{};

if ((_unit getvariable [QGVAR(playingInjuredSound),false])) exitwith {};
_unit setvariable [QGVAR(playingInjuredSound),true];
_availableSounds_A = [
    "WoundedGuyA_01",
    "WoundedGuyA_02",
    "WoundedGuyA_03",
    "WoundedGuyA_04",
    "WoundedGuyA_05",
    "WoundedGuyA_06",
    "WoundedGuyA_07",
    "WoundedGuyA_08"
];
_availableSounds_B = [
    "WoundedGuyB_01",
    "WoundedGuyB_02",
    "WoundedGuyB_03",
    "WoundedGuyB_04",
    "WoundedGuyB_05",
    "WoundedGuyB_06",
    "WoundedGuyB_07",
    "WoundedGuyB_08"
];
_availableSounds_C = [
    "WoundedGuyC_01",
    "WoundedGuyC_02",
    "WoundedGuyC_03",
    "WoundedGuyC_04",
    "WoundedGuyC_05"
];

_bodyPartStatus = [_unit,QGVAR(bodyPartStatus)] call EFUNC(common,getDefinedVariable);

_amountOfDamage = 0;
{
    _amountOfDamage = _amountOfDamage + _x;
}foreach _bodyPartStatus;


if (_amountOfDamage > 0) then {
    _sound = "";
    if (_amountOfDamage > 1) then {
        if (random(1) > 0.5) then {
            _sound = _availableSounds_A select (round(random((count _availableSounds_A) - 1)));
        } else {
            _sound = _availableSounds_B select (round(random((count _availableSounds_B) - 1)));
        };
    } else {
        _sound = _availableSounds_B select (round(random((count _availableSounds_B) - 1)));
    };
    [[_unit,_sound], QUOTE(EFUNC(common,broadcastSound3D_F)), true] call EFUNC(common,execRemoteFnc);
    if (_amountOfDamage < 1) then {
        sleep 10;
        sleep (random(50));
    } else {
        sleep (60 / _amountOfDamage);
    };

};
_unit setvariable [QGVAR(playingInjuredSound),nil];