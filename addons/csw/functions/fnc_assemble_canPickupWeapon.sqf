#include "script_component.hpp"
/*
 * Author: TCVM
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

private _assemblyMode = [false, true, GVAR(defaultAssemblyMode)] select (_staticWeapon getVariable [QGVAR(assemblyMode), 2]);
private _crewed = (crew _staticWeapon) isEqualTo [];
private _deadCrew = !(alive (gunner _staticWeapon)); // need to eject body???

_assemblyMode && {(!_crewed) || _deadCrew}

