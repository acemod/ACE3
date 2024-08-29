#include "..\script_component.hpp"
/*
 * Author: tcvm
 * If the CSW is mounted or in use this will not allow you to dismount the weapon.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * Can dismount weapon <BOOL>
 *
 * Example:
 * cursorObject call ace_csw_fnc_assemble_canPickupWeapon
 *
 * Public: No
 */

params ["_vehicle"];

GVAR(defaultAssemblyMode) && {alive _vehicle} && {((crew _vehicle) findIf {alive _x && {!unitIsUAV _x}}) == -1} // return
