#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if the unit can deploy a tripod
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * player call ace_csw_fnc_canDeployTripod
 *
 * Public: No
 */

params ["_unit"];

private _secondaryWeapon = secondaryWeapon _unit;

_secondaryWeapon != "" && {getText (configFile >> "CfgWeapons" >> _secondaryWeapon >> QUOTE(ADDON) >> "type") == "mount"} // return
