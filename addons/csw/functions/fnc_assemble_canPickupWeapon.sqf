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

// Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
private _assemblyMode = [false, true, true, GVAR(defaultAssemblyMode)] select (_staticWeapon getVariable [QGVAR(assemblyMode), 3]);
private _notCrewed = (crew _staticWeapon) isEqualTo [];
private _deadCrew = !(alive (gunner _staticWeapon)); // need to eject body???

_assemblyMode && {_notCrewed || _deadCrew}

