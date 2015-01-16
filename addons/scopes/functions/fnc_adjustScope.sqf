/*
 * Author: KoffeinFlummi
 *
 * Changes the adjustment for the current scope
 *
 * Arguments:
 * 0: Horizontal adjustment
 * 1: Vertical adjustment
 *
 * Return Value:
 * True
 */

#include "script_component.hpp"
 
private ["_unit", "_weapons", "_zeroing", "_pitchbankyaw", "_pitch", "_bank", "_yaw", "_hint"];

_unit = _this select 0;

_weapons = [
    primaryWeapon _unit,
    secondaryWeapon _unit,
    handgunWeapon _unit
];

if (isNil QGVAR(Adjustment)) then {
    GVAR(Adjustment) = [[0,0], [0,0], [0,0]];
};

_zeroing = GVAR(Adjustment) select (_weapons find (currentWeapon _unit));
_zeroing set [0, (round (((_zeroing select 0) + (_this select 1)) * 10)) / 10];
_zeroing set [1, (round (((_zeroing select 1) + (_this select 2)) * 10)) / 10];

GVAR(Adjustment) set [_weapons find (currentWeapon _unit), _zeroing];

playSound (["ACE_Scopes_Click_1", "ACE_Scopes_Click_2", "ACE_Scopes_Click_3"] select floor random 3);

// slightly rotate the player if looking through optic
if (cameraView == "GUNNER") then {
    _pitchbankyaw = [_unit] call EFUNC(common,getPitchBankYaw);
    // these are not exact mil-to-degree conversions, but instead chosen
    // to minimize the effect of rounding errors
    _pitch = (_pitchbankyaw select 0) + ((_this select 2) * -0.04);
    _bank = _pitchbankyaw select 1;
    _yaw = (_pitchbankyaw select 2) + ((_this select 1) * -0.04);
    [_unit, _pitch, _bank, _yaw] call EFUNC(common,setPitchBankYaw)
};

_display = uiNamespace getVariable [QGVAR(ZeroingDisplay), displayNull];
if !(isNull _display) then {
    _vertical = _display displayCtrl 925002;
    _horizontal = _display displayCtrl 925003;
    _vertical ctrlSetText (str (_zeroing select 1));
    _horizontal ctrlSetText (str (_zeroing select 0));
};

if (!isNull (missionNamespace getVariable [QGVAR(fadeScript), scriptNull])) then {
    terminate GVAR(fadeScript);
};
if (cameraView != "GUNNER") then {
    GVAR(fadeScript) = 0 spawn {
        _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
        _layer cutRsc [QGVAR(Zeroing), "PLAIN", 0, false];
        sleep 3;
        _layer cutFadeOut 2;
    };
};

true
