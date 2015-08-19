/*
 * Author: GitHawk
 * Picks up a magazine.
 *
 * Arguments:
 * 0: Params <ARRAY>
 *   0: Unit <OBJECT>
 *   1: Magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, "500Rnd_127x99_mag_Tracer_Red"]] call ace_rearm_fnc_pickUpSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_ammo", "_dummyName", "_dummyObj"];
params ["_args"];
_args params ["_unit", "_magazine"];

_unit setVariable [QGVAR(carriedMagazine), _magazine]; // TODO move to carried object
[_unit, QGVAR(vehRearm), true] call EFUNC(common,setForceWalkStatus);

// TODO use ace carry
_dummyObj = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _dummyObj) then {
    detach _dummyObj;
    deleteVehicle _dummyObj;
    _dummyObj setVariable [QGVAR(dummy), objNull];
};

_ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
_dummyName = getText (configFile >> "CfgAmmo" >> _ammo >> QGVAR(dummy));
_dummyObj = objNull;
if !(_dummyName == "") then {
    _dummyObj = _dummyName createVehicle (position _unit);
} else {
    _dummyObj = QGVAR(defaultCarriedObject) createVehicle (position _unit);
};
_dummyObj allowDamage false;
_dummyObj attachTo [_unit, [0,0.5,0], "pelvis"];
{
    [[_dummyObj, [[-1,0,0],[0,0,1]]], QUOTE(DFUNC(makeDummy)), _x] call EFUNC(common,execRemoteFnc);
} count (position _unit nearObjects ["CAManBase", 100]);
_dummyObj setVariable [QGVAR(magazineClass), _magazine, true];
_unit setVariable [QGVAR(dummy), _dummyObj];
