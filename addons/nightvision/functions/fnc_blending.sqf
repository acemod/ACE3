/*
 * Author: commy2
 * Change the blending when the player fires??. Called from the unified fired EH only for the local player and his vehicle.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * Noneg
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_nightvision_fnc_blending
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

private _player = ACE_player;

//If we're not in NVG mode, or it's a grenade, exit
if (currentVisionMode _player != 1 || {toLower _weapon in ["throw", "put"]}) exitWith {};

private _silencer = _player weaponAccessories _weapon select 0;

private _visibleFireCoef = 1;
private _visibleFireTimeCoef = 1;

if (_silencer != "") then {
    _visibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "visibleFire");
    _visibleFireTimeCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "visibleFireTime");
};

private _visibleFire = getNumber (configFile >> "CfgAmmo" >> _ammo >> "visibleFire");
private _visibleFireTime = getNumber (configFile >> "CfgAmmo" >> _ammo >> "visibleFireTime");

private _fnc_isTracer = {
    if (getNumber (configFile >> "CfgAmmo" >> _ammo >> "nvgOnly") > 0) exitWith {false};

    private _indexShot = (_player ammo _weapon) + 1;

    private _lastRoundsTracer = getNumber (configFile >> "CfgMagazines" >> _magazine >> "lastRoundsTracer");
    if (_indexShot <= _lastRoundsTracer) exitWith {true};

    private _tracersEvery = getNumber (configFile >> "CfgMagazines" >> _magazine >> "tracersEvery");
    if (_tracersEvery == 0) exitWith {false};

    (_indexShot - _lastRoundsTracer) % _tracersEvery == 0
};

if (call _fnc_isTracer) then {
    _visibleFire = _visibleFire + 2;
    _visibleFireTime = _visibleFireTime + 2;
};

private _darkness = 1 - (call EFUNC(common,ambientBrightness));
private _nvgBrightnessCoef = 1 + (_player getVariable [QGVAR(NVGBrightness), 0]) / 4;

_visibleFire = _darkness * _visibleFireCoef * _visibleFire * _nvgBrightnessCoef / 10 min 1;
_visibleFireTime = _darkness * _visibleFireTimeCoef * _visibleFireTime * _nvgBrightnessCoef / 10 min 0.5;

TRACE_2("Player Shot, Adjusting NVG Effect", _visibleFire, _visibleFireTime);

GVAR(ppEffectMuzzleFlash) ppEffectAdjust [1, 1, _visibleFire, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
GVAR(ppEffectMuzzleFlash) ppEffectCommit 0;

GVAR(ppEffectMuzzleFlash) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
GVAR(ppEffectMuzzleFlash) ppEffectCommit _visibleFireTime;
