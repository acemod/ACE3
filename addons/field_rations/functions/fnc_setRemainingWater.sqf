#include "script_component.hpp"
/*
 * Author: mharis001, PabstMirror
 * Sets the remaining water supply for given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Amount (-10 - Infinite, -1 - Disabled) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_source, 1000] call ace_field_rations_fnc_setRemainingWater
 *
 * Public: Yes
 */

params [["_source", objNull, [objNull]], ["_water", nil, [0]]];

if (!alive _source || {isNil "_water"}) exitWith {};

_source setVariable [QGVAR(currentWaterSupply), _water, true];
