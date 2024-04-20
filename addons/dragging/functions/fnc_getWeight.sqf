#include "..\script_component.hpp"
/*
 * Author: L-H, edited by commy2, rewritten by joko // Jonas, re-rewritten by mharis001
 * Returns the weight of the given object.
 * Weight is calculated from the object's mass, its current inventory, and PhysX mass if applicable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Weight <NUMBER>
 *
 * Example:
 * [cursorTarget] call ace_dragging_fnc_getWeight
 *
 * Public: No
 */

params ["_object"];

// Skip weight checking if it will be 0
if (GVAR(weightCoefficient) == 0) exitWith {0};

private _weight = loadAbs _object;

if !(GVAR(skipContainerWeight)) then {
    // Add the mass of the object itself
    // getMass handles PhysX mass, this should be 0 for SupplyX containers and WeaponHolders
    // Use originalMass in case we're checking weight for a carried object
    _weight = _weight + ((_object getVariable [QGVAR(originalMass), getMass _object]));
};

// Contents of backpacks get counted twice (https://github.com/acemod/ACE3/pull/8457#issuecomment-1062522447 and https://feedback.bistudio.com/T167469)
// This is a workaround until that is fixed on BI's end
{
    _x params ["", "_container"];
    _weight = _weight - (loadAbs _container);
} forEach (everyContainer _object);

// Mass in Arma isn't an exact amount but rather a volume/weight value
// This attempts to work around that by making it a usable value (sort of)
GVAR(weightCoefficient) * _weight * 0.5 // return
