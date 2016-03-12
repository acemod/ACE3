/*
 * Author: KoffeinFlummi, Commy2
 * Check if weapon optics changed and reset zeroing if needed
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_scopes_fnc_inventoryCheck
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

private _adjustment = _player getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _supportsAdjustment = _player getVariable [QGVAR(SupportsAdjustment), [[false, false], [false, false], [false, false]]];
private _oldOptics = _player getVariable [QGVAR(Optics), ["", "", ""]];
private _newOptics = [_player] call FUNC(getOptics);

private _oldAdjustment = +_adjustment;
private _oldSupportsAdjustment = +_supportsAdjustment;
{
    private _newOptic = _newOptics select _forEachIndex;
    if (_newOptic != _x) then {
        // Check if the new optic supports adjusting
        private _opticConfig = configFile >> "CfgWeapons" >> _newOptic;
        _adjustment set [_forEachIndex, [0, 0, 0]];
        _supportsAdjustment set [_foreachindex,
            [(count getArray (_opticConfig >> "ACE_ScopeAdjust_Horizontal")) == 2,
            (count getArray (_opticConfig >> "ACE_ScopeAdjust_Verical")) == 2]];

        // The optic for this weapon changed, set adjustment to zero
        _adjustment set [_forEachIndex, [0, 0, 0]];
    };
} forEach _oldOptics;

// If some adjustment changed, broadcast it
if !(_adjustment isEqualTo _oldAdjustment) then {
    [_player, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);
};
// If some scope started/finished supporting adjustment, broadcast it
if !(_supportsAdjustment isEqualTo _oldSupportsAdjustment) then {
    [_player, QGVAR(SupportsAdjustment), _supportsAdjustment, 0.5] call EFUNC(common,setVariablePublic);
};

_player setVariable [QGVAR(Optics), _newOptics];
