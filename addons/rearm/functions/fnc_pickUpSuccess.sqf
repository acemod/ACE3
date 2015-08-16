/*
 * Author: GitHawk
 * Picks up a magazine
 *
 * Arguments:
 * 0: The Params <ARRAY>
 * 0,0: The Unit <OBJECT>
 * 0,1: The Magazine <STRING>
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

private ["_dummy"];
params ["_args"];
_args params ["_unit", "_magazine"];

_unit setVariable [QGVAR(carriedMagazine), _magazine];
[_unit, QGVAR(vehRearm), true] call EFUNC(common,setForceWalkStatus);

_dummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _dummy) then {
    detach _dummy;
    deleteVehicle _dummy;
    _unit setVariable [QGVAR(dummy), objNull];
};
_ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
_dummy = getText (configFile >> "CfgAmmo" >> _ammo >> QGVAR(dummy));
if !(_dummy == "") then {
    _dummy = _dummy createVehicle (position _unit);
    _dummy attachTo [_unit, [0,0.5,0], "pelvis"];
    [[_dummy, [[-1,0,0],[0,0,1]]], QUOTE(DFUNC(turn)), 2] call EFUNC(common,execRemoteFnc);
    _dummy allowDamage false;
    _unit setVariable [QGVAR(dummy), _dummy];
};