#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if the player can deploy the tripod.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * player call ace_csw_fnc_canDeployTripod
 *
 * Public: No
 */

params ["_player"];

private _secondaryWeapon = secondaryWeapon _player;

_secondaryWeapon != "" && {getText (configFile >> "CfgWeapons" >> _secondaryWeapon >> QUOTE(ADDON) >> "type") == "mount"} // return
