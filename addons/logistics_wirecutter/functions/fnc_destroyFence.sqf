#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Destroys the given fence and replaces it with a destroyed fence if possible.
 *
 * Arguments:
 * 0: Fence <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fence] call ace_logistics_wirecutter_fnc_destroyFence
 *
 * Public: No
 */

params ["_fence"];

private _fenceModel = toLower ((getModelInfo _fence)#0);

// If fence cannot be replaced with destroyed model, just knock it over
if !(_fenceModel in GVAR(replacements)) exitWith {
    _fence setDamage 1;
};

// Remove old fence
if ([_fence] call CBA_fnc_isTerrainObject) then {
    _fence setDamage 1;
    _fence hideObjectGlobal true;
} else {
    deleteVehicle _fence;
};

// Create replacement(s)
{
    _x params ["_type", "_position", "_dir"];

    private _replacement = _type createVehicle [0, 0, 0];
    _replacement setPosWorld (_fence modelToWorldWorld _position);
    _replacement setDir (direction _fence + _dir);
} forEach (GVAR(replacements) get _fenceModel);
