/*
 * Author: Glowbal, ViperMaul
 * Check if item can be unloaded
 *
 * Arguments:
 * 0: loaded object <OBJECT>
 * 1: Object <OBJECT>
 *
 * Return value:
 * Can be unloaded <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_loaded", "_position", "_validVehiclestate", "_emptyPos"];
params ["_item", "_vehicle"];
_loaded = _vehicle getvariable [QGVAR(loaded), []];
if !(_item in _loaded) exitwith {false};

_validVehiclestate = true;
_emptyPos = [];
if (_vehicle isKindOf "Ship" ) then {
    if !(speed _vehicle <1 && {(((getPosATL _vehicle) select 2) < 2)}) then {_validVehiclestate = false};
    _emptyPos = ((getPosASL _vehicle) call EFUNC(common,ASLtoPosition) findEmptyPosition [0, 15, typeOf _item]); // TODO: if spot is underwater pick another spot.
} else {
    if (_vehicle isKindOf "Air" ) then {
        if !(speed _vehicle <1 && {isTouchingGround _vehicle})  then {_validVehiclestate = false};
        _emptyPos = (getPosASL _vehicle) call EFUNC(common,ASLtoPosition);
        _emptyPos = [(_emptyPos select 0) + random(5), (_emptyPos select 1) + random(5), _emptyPos select 2 ];
    } else {
        if !(speed _vehicle <1 && {(((getPosATL _vehicle) select 2) < 2)})  then {_validVehiclestate = false};
        _emptyPos = ((getPosASL _vehicle) call EFUNC(common,ASLtoPosition) findEmptyPosition [0, 15, typeOf _item]);
    };
};

if (!_validVehiclestate) exitwith { false };
(count _emptyPos != 0);
