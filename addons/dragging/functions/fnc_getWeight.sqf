#include "script_component.hpp"
/*
 * Author: L-H, edited by commy2, rewritten by joko // Jonas, re-rewritten by mharis001
 * Returns the weight of the given object.
 * Weight is calculated from the object's mass and its current inventory.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Weight <NUMBER>
 *
 * Example:
 * [_object] call ace_dragging_fnc_getWeight
 *
 * Public: No
 */

params ["_object"];

private _weight = loadAbs _object;

// Add the mass of the object itself
// The container object is generally of type SupplyX and has mass of zero
_weight = _weight + getNumber (configOf _object >> "mass");

// Mass in Arma isn't an exact amount but rather a volume/weight value
// This attempts to work around that by making it a usable value (sort of)
_weight * 0.5;
