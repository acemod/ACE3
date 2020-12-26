#include "script_component.hpp"

params ["_keyNumber", "_keyDown"];


private _unit = vehicle ACE_player;
private _weapon = currentWeapon (vehicle ACE_player);
private _magazine = currentMagazine (vehicle ACE_player);

private _weaponEntries = _unit getVariable [QGVAR(guidedWeapons), []];
if (count _weaponEntries < 1) exitWith {};
private _weaponIndex = -1;
{
    if ((_x select 0) == _weapon) exitWith {
        _weaponIndex = _forEachIndex;
    };
} forEach _weaponEntries;

private _magazineEntries = (_weaponEntries select _weaponIndex) select 1;
if (count _magazineEntries < 1) exitWith {};
private _magazineIndex = -1;

if (_weaponIndex > -1) then {
    {
        if ((_x select 0) == _magazine) exitWith {
            _magazineIndex = _forEachIndex;
        };
    } forEach _magazineEntries;
};

private _seekerEntries = (_magazineEntries select _magazineIndex) select 1;
if (count _seekerEntries < 1) exitWith {};

private _seeker = _seekerEntries select 0;
_seeker params ["_object", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerEH", "_seekerMisc"];

switch (_keyNumber) do {
    //Tab Key
    case 1: {
        switch (_keyDown) do {
            case true: {
//                hint format ["Seeker: %1", !_enabled];
                _seeker set [4, !(_enabled)];
            };
        };
    };
    //CTRL Tab key
    case 2: {
    
    };

};