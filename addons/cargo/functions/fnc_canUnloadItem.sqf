/*
 * Author: Glowbal, ViperMaul
 * Check if item can be unloaded. (Unused, left as helper)
 *
 * Arguments:
 * 0: loaded Object <OBJECT>
 * 1: Object <OBJECT>
 *
 * Return value:
 * Can be unloaded <BOOL>
 *
 * Example:
 * [item, holder] call ace_cargo_fnc_canUnloadItem
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_loaded", "_validVehiclestate", "_emptyPos"];

params ["_item", "_vehicle"];

_loaded = _vehicle getVariable [QGVAR(loaded), []];
if !(_item in _loaded) exitWith {false};

_emptyPos = [_vehicle, (typeOf _item)] call EFUNC(common,findUnloadPosition);

(count _emptyPos == 3)
