#include "..\script_component.hpp"
/*
 * Author: tcvm
 * If the CSW is mounted or in use this will not allow you to dismount the weapon
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * Can Dismount <BOOL>
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_assemble_canPickupWeapon
 *
 * Public: No
 */

params ["_staticWeapon"];

private _notCrewed = (crew _staticWeapon) isEqualTo [];
private _deadCrew = !(alive (gunner _staticWeapon)); // need to eject body???

GVAR(defaultAssemblyMode) && {_notCrewed || _deadCrew}
