#include "script_component.hpp"
/*
* Author: chris579
* Removes camouflage from trench
*
* Arguments:
* 0: trench <OBJECT>
*
* Return Value:
* None
*
* Example:
* [TrenchObj] call ace_trenches_fnc_deleteCamouflage
*
* Public: No
*/

params ["_trench"];

private _camouflageObjects = _trench getVariable [QGVAR(camouflageObjects), []];

{
    deleteVehicle _x;
} forEach (_camouflageObjects select 0);

_camouflageObjects deleteAt 0;
_trench setVariable [QGVAR(camouflageObjects), _camouflageObjects, true];
