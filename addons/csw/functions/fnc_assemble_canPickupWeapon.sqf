#include "..\script_component.hpp"
/*
 * Author:tcvm
 * If the CSW is mounted or in use this will not allow you to dismount the weapon
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * Can Dismount <BOOL>
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_assemble_canPickupWeapon
 *
 * Public: No
 */

params ["_vehicle"];

// Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
private _assemblyMode = [false, true, true, GVAR(defaultAssemblyMode)] select (_vehicle getVariable [QGVAR(assemblyMode), 3]);
private _notCrewed = (crew _vehicle) isEqualTo [];
private _deadCrew = !(alive (gunner _vehicle)); // need to eject body???

_assemblyMode && {_notCrewed || _deadCrew}
