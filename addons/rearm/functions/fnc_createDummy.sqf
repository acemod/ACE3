#include "script_component.hpp"
/*
 * Author: GitHawk
 * Creates a carryable ammunition dummy object.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return Value:
 * Created Dummy <OBJECT>
 *
 * Example:
 * [player, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_createDummy
 *
 * Public: No
 */

params ["_unit", "_magazineClass"];

private _ammo = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");
private _dummyName = getText (configFile >> "CfgAmmo" >> _ammo >> QGVAR(dummy));
private _dummy = objNull;
if !(_dummyName == "") then {
    _dummy = _dummyName createVehicle (position _unit);
} else {
    _dummy = QGVAR(defaultCarriedObject) createVehicle (position _unit);
};
_dummy allowDamage false;
_dummy setVariable [QGVAR(magazineClass), _magazineClass, true];

TRACE_4("createdDummy",_unit,_magazineClass,_dummyName,_dummy);

_dummy
