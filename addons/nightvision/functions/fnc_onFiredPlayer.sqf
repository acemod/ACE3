#include "script_component.hpp"
/*
 * Author: commy2, Dslyecxi, PabstMirror
 * Change the blending when the player fires. Called from the unified fired EH only for the local player and his vehicle.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_nightvision_fnc_onFiredPlayer
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
TRACE_7("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile);

if ((!GVAR(running))
    || {!GVAR(shutterEffects)}
    || {EGVAR(common,epilepsyFriendlyMode)}
    || {_weapon == "throw"}
    || {_weapon == "put"}
) exitWith {};

private _visibleFireCoef = 1;
if (_unit == ace_player) then {
    private _silencer = (_unit weaponAccessories _weapon) select 0;
    if (_silencer != "") then {
        _visibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "visibleFire");
        TRACE_1("muzzle attachement",_visibleFireCoef);
    };
};

private _visibleFire = getNumber (configFile >> "CfgAmmo" >> _ammo >> "visibleFire");

private _isTracer = call {
    if (getNumber (configFile >> "CfgAmmo" >> _ammo >> "nvgOnly") > 0) exitWith {false};
    private _indexShot = (_unit ammo _weapon) + 1;
    private _lastRoundsTracer = getNumber (configFile >> "CfgMagazines" >> _magazine >> "lastRoundsTracer");
    if (_indexShot <= _lastRoundsTracer) exitWith {true};
    private _tracersEvery = getNumber (configFile >> "CfgMagazines" >> _magazine >> "tracersEvery");
    if (_tracersEvery == 0) exitWith {false};
    (_indexShot - _lastRoundsTracer) % _tracersEvery == 0
};

TRACE_3("",_ammo,_visibleFire,_isTracer);
if ( _isTracer) then {
    _visibleFire = _visibleFire + 2;
};

_visibleFire = _visibleFireCoef * _visibleFire;
if (_ammo isKindOf "BulletBase") then {
    _visibleFire = _visibleFire min 5; // Prevent every shot from triggering with HMG
};
TRACE_1("final", _visibleFire);

if (_visibleFire <= 1.5) exitWith {};
if ((random (linearConversion [1, 4, GVAR(nvgGeneration), 10, 20])) > _visibleFire) exitWith {};

QGVAR(cutoff) cutText ["", "BLACK", .1];
[{
   QGVAR(cutoff) cutText ["", "PLAIN", 0];
}, [], 0.07] call CBA_fnc_waitAndExecute;
