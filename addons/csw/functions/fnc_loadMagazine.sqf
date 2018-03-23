/*
 * Author: PabstMirror
 * Loads a magazine into a static weapon from a magazine carried by the player.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret <ARRAY>
 * 2: Player <OBJECT>
 * 3: Unit Carried Magazine <STRING>
 * 4: Weapon being reloaded <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0], player, "ACE_100Rnd_127x99_ball_carryable", "HMG_M2"] call ace_crewserved_fnc_loadMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_turret", "_unit", "_carryMag", "_weapon"];
TRACE_5("loadMagazine",_vehicle,_turret,_unit,_carryMag,_weapon);

private _vehicleMag = [_weapon, _carryMag] call FUNC(getVehicleMagazine);

private _extraParams = [];
private _carryGroup = configFile >> QGVAR(groups) >> _carryMag;

private _loadedMagazine = [];
private _allMagazinesInCSW = _vehicle magazinesTurret _turret;
{
    if (_x == ((_vehicle magazinesTurret _turret) select 0)) exitWith {
        _loadedMagazine = _x;
    };
} forEach _allMagazinesInCSW;

if (getNumber(_carryGroup >> _loadedMagazine) != 1) then {
    // Wrong magazine type. Switch vehicle magazine to proper one
    _extraParams pushBack _loadedMagazine;
};

private _maxAmmo = getNumber (configFile >> "CfgMagazines" >> _vehicleMag >> "count");

private _addedMagazine = "";
private _ammoAvailable = 0;

// Figure out what we can add from the magazines we have
{
    _x params ["_xMag", "_xAmmo"];
    if (_xMag == _carryMag) exitWith {
        private _added = (_maxAmmo - _ammoAvailable) min _xAmmo;
        _xAmmo = _xAmmo - _added;   // Knapsack problem, could rewrite to find optimal, lol
        _ammoAvailable = _ammoAvailable + _added;
        _addedMagazine = _xMag;
    };
} forEach (magazinesAmmo _unit);

_unit removeMagazineGlobal _addedMagazine;

// Add ammo to turret (run addMagazineTurret where local)
TRACE_4("calling addTurretMag event", _vehicle, _turret, _vehicleMag, _ammoAvailable);
[QGVAR(addTurretMag), [_vehicle, _turret, _vehicleMag, _ammoAvailable, _extraParams]] call CBA_fnc_globalEvent;

TRACE_3("done",_playerMags,_ammoAvailable,_maxAmmo);

