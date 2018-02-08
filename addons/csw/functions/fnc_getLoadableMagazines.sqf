/*
 * Author: PabstMirror
 * Gets magazines that the player is carrying that can be loaded into the static weapon
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_crewserved_fnc_getLoadableMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_player"];

private _return = [];
private _carriedMagazines = [];

{
    if (isClass (configFile >> QGVAR(groups) >> _x)) then {
        _carriedMagazines pushBackUnique _x;
    };
} forEach (magazines _player);
TRACE_1("",_carriedMagazines);

if (_carriedMagazines isEqualTo []) exitWith {_return}; // fast exit if no carry mags

// Go through turrets and find weapons that we could reload
{
    private _turretPath = _x;
    {
        private _weapon = _x;
        {
            private _carryMag = _x;
            private _carryGroup = configFile >> QGVAR(groups) >> _carryMag;
            {
                if (((getNumber (_carryGroup >> _x)) == 1) && {[_vehicle, _turretPath, _player, _carryMag, _weapon, false] call FUNC(canLoadMagazine)}) exitWith {
                    _return pushBack [_carryMag, _weapon, _turretPath];
                };
            } forEach (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
        } forEach _carriedMagazines;
    } forEach (_vehicle weaponsTurret _turretPath);
} forEach (allTurrets _vehicle);
// Note: these nested forEach's looks terrible, but most only have one element

_return

