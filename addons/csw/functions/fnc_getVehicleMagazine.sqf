/*
 * Author: PabstMirror
 * Finds the best vehicle magazines to create from a carryable magazine for a given weapon.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Magazine that is carryable <STRING>
 *
 * Return Value:
 * Vehicle Magazine <STRING>
 *
 * Example:
 * ["HMG_M2", "ACE_100Rnd_127x99_ball_carryable"] call ace_crewserved_fnc_getVehicleMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_weapon", "_carryMag"];
TRACE_2("getVehicleMagazine",_weapon,_carryMag);

private _ammoToAdd = getNumber (configFile >> "CfgMagazines" >> _carryMag >> "count");
private _carryGroup = configFile >> QGVAR(groups) >> _carryMag;

private _vehicleMag = "#";
private _vehicleMagCount = -1;

{
    if ((getNumber (_carryGroup >> _x)) == 1) then {
        private _xAmmo = getNumber (configFile >> "CfgMagazines" >> _x >> "ammo");
        if (((_xAmmo >= _vehicleMagCount) && {_vehicleMagCount < _ammoToAdd}) || {(_xAmmo >= _ammoToAdd) && {_xAmmo < _vehicleMagCount}}) then {
            _vehicleMag = _x;
            _vehicleMagCount = _xAmmo;
        };
    };
} forEach (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));

TRACE_3("best fit",_ammoToAdd,_vehicleMag,_vehicleMagCount);

_vehicleMag

