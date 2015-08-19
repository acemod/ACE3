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

private ["_ammo", "_dummyName", "_dummy", "_actionID"];
params ["_args"];
_args params ["_unit", "_magazine"];

[_unit, QGVAR(vehRearm), true] call EFUNC(common,setForceWalkStatus);

_dummy = _unit getVariable [QGVAR(dummy), objNull];
_actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
if !(isNull _dummy) then {
    detach _dummy;
    deleteVehicle _dummy;
    _unit setVariable [QGVAR(dummy), objNull];
};
if (_actionID != -1) then {
    _unit removeAction _actionID;
};

_ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
_dummyName = getText (configFile >> "CfgAmmo" >> _ammo >> QGVAR(dummy));
_dummy = objNull;
if !(_dummyName == "") then {
    _dummy = _dummyName createVehicle (position _unit);
} else {
    _dummy = QGVAR(defaultCarriedObject) createVehicle (position _unit);
};
_dummy allowDamage false;
_dummy attachTo [_unit, [0,0.5,0], "pelvis"];
{
    [[_dummy, [[-1,0,0],[0,0,1]]], QUOTE(DFUNC(makeDummy)), _x] call EFUNC(common,execRemoteFnc);
} count (position _unit nearObjects ["CAManBase", 100]);
_dummy setVariable [QGVAR(magazineClass), _magazine, true];
_unit setVariable [QGVAR(dummy), _dummy];

_actionID = _unit addAction [
    format ["<t color='#FF0000'>%1</t>", localize ELSTRING(dragging,Drop)],
    'detach ((_this select 0) getVariable QGVAR(dummy)); (_this select 0) setVariable [QGVAR(dummy), objNull]; [(_this select 0), QGVAR(vehRearm), false] call EFUNC(common,setForceWalkStatus);', // TODO Move to func + unholster
    nil,
    20,
    false,
    true,
    "",
    '!isNull (_target getVariable [QGVAR(dummy), objNull])'
];
_unit setVariable [QGVAR(ReleaseActionID), _actionID];
