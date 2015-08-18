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

private ["_dummy", "_ammo"];
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
    _dummy allowDamage false;
    _dummy attachTo [_unit, [0,0.5,0], "pelvis"];
    {
        [[_dummy, [[-1,0,0],[0,0,1]]], QUOTE(DFUNC(makeDummy)), _x] call EFUNC(common,execRemoteFnc);
    } count (position _unit nearObjects ["CAManBase", 100]);
    _unit setVariable [QGVAR(dummy), _dummy];
};
