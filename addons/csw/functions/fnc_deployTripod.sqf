/*
 * Author: TCVM
 * Deploys the tripod
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_deployTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

// Create a tripod
private _cswTripod = createVehicle [QGVAR(tripodObject), [0, 0, 0], [], 0, "NONE"];

// Remove the tripod from the launcher slot
_player removeWeaponGlobal QGVAR(carryTripod);

_posATL = _player getRelPos[2, 0];
_posATL set[2, ((getPosATL _player) select 2) + 0.5];

_cswTripod setPosATL _posATL;
_cswTripod setDir (direction _player);
_cswTripod setVectorUp (surfaceNormal _tripodPos);

[_player, "PutDown"] call EFUNC(common,doGesture);