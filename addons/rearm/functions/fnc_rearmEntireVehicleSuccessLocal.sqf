/*
 * Author: Tuupertunut
 * Rearm an entire turret locally.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: TurretPath <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, tank, [0]] call ace_rearm_fnc_rearmEntireVehicleSuccessLocal
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_truck", "_vehicle", "_turretPath"];
TRACE_3("rearmEntireVehicleSuccessLocal",_truck,_vehicle,_turretPath);

// Fetching all rearmable magazines in this turret
private _magazines = ([_vehicle] call FUNC(getNeedRearmMagazines)) select {(_x select 1) isEqualTo _turretPath};
{
    _x params ["_magazineClass", "_magTurretPath", "_isPylonMag", "_pylonIndex", "_maxMagazines", "_currentMagazines", "_maxRoundsPerMag", "_currentRounds"];
    
    // Array of planned ammo counts in every magazine after the rearm is complete
    private _plannedRounds = +_currentRounds;
    
    // Trying to fill all existing magazines.
    {
        if (_x < _maxRoundsPerMag) then {
            if ((GVAR(supply) == 0) || {[_truck, _magazineClass, (_maxRoundsPerMag - _x)] call FUNC(removeMagazineFromSupply)}) then {
                _plannedRounds set [_forEachIndex, _maxRoundsPerMag];
            };
        };
    } forEach _currentRounds;
    
    // Trying to add new full magazines, if there is space left.
    if (_currentMagazines < _maxMagazines) then {
        for "_idx" from 1 to (_maxMagazines - _currentMagazines) do {
            if ((GVAR(supply) == 0) || {[_truck, _magazineClass, _maxRoundsPerMag] call FUNC(removeMagazineFromSupply)}) then {
                _plannedRounds pushBack _maxRoundsPerMag;
            };
        };
    };
    
    TRACE_2("rearming",_x,_plannedRounds);
    
    // Updating new ammo counts to vehicle.
    if (_isPylonMag) then {
        _vehicle setAmmoOnPylon [_pylonIndex, (_plannedRounds select 0)];
    } else {
        [_vehicle, _magTurretPath, _magazineClass, _plannedRounds] call FUNC(setTurretMagazineAmmo);
    };
} forEach _magazines;

