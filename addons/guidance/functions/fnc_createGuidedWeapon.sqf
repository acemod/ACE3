#include "script_component.hpp"

params ["_unit", "_weapon", "_magazine"];

private _unitEntries = GVAR(guidedWeapons);
private _unitIndex = count _unitEntries;
{
    if (_x select 0 == _unit) then {
        _unitIndex = _forEachIndex;
    };
} forEach _unitEntries;

if(_unitIndex == count _unitEntries) then {
    _unitEntries set [ _unitIndex, [_unit, []] ];
};

private _weaponEntries = _unitEntries select _unitIndex select 1;
private _weaponIndex = count _weaponEntries;
{
    if (_x select 0 == _weapon) then {
        _weaponIndex = _forEachIndex;
    };
} forEach _weaponEntries;

if(_weaponIndex == count _weaponEntries) then {
    _weaponEntries set [_weaponIndex, [_weapon, []]];
};

private _magazineEntries = _weaponEntries select _weaponIndex select 1;
private _magazineIndex = count _magazineEntries;
{
    if (_x select 0 == _magazine) then {
        _magazineIndex = _forEachIndex;
    };
} forEach _magazineEntries;

if(_magazineIndex == count _magazineEntries) then {
    _magazineEntries set [_magazineIndex, [_magazine, []]];
};


private _seekerEntries = ((_magazineEntries select _magazineIndex) select 1);


private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
private _ammoCfg = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);
private _ammoSeekers = getArray (_ammoCfg >> "seekers");

private _missedSeekers = +_ammoSeekers;
{
    private _y = _x;
    private _yIndex = _forEachIndex;
    {
        if ((_x select 3) == _y) then {
            
            _missedSeekers deleteAt _yIndex;
        };
    } forEach _seekerEntries;
} forEach _ammoSeekers; 

{
    _seeker = [_unit, _weapon, _magazine, _x] call FUNC(createSeeker);
    _seekerEntries pushBack _seeker;
} forEach _missedSeekers;


_magazineEntries set [_magazineIndex, [_magazine, _seekerEntries]];

_unit setVariable [QGVAR(currentWeapon), [_weapon, _magazine]];

_unit setVariable [QGVAR(guidedWeapons), _weaponEntries];
GVAR(guidedWeapons) set [_unitIndex, [_unit, _weaponEntries]];

private _entry = GVAR(guidedWeapons) select _unitIndex;

_entry
