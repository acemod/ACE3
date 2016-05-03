/*
 * Author: Ir0n1E
 * check gunbag status full/empty
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _state = (backpackContainer _unit) getVariable [QGVAR(GunbagWeapon),[]];

if (count _state <= 0) then {
	[localize LSTRING(empty)] call EFUNC(common,displayTextStructured);
} else {
	private _weapon = (_state select 0) select 0;
	[getText (configFile >> "CfgWeapons" >> _weapon >> "displayname"),
	getText (configFile >> "CfgWeapons" >> _weapon >> "picture")] call EFUNC(common,displayTextPicture);
};
