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

private ["_newOptics", "_adjustment"];

params ["_player"];

_adjustment = ACE_player getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
    ACE_player setVariable [QGVAR(Adjustment), _adjustment];
    [ACE_player, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);
};

if (isNil QGVAR(Optics)) then {
    GVAR(Optics) = ["", "", ""];
};
_newOptics = [_player] call FUNC(getOptics);

{
    if (_newOptics select _forEachIndex != _x) then {
        // The optic for this weapon changed, set adjustment to zero
        if (!((_adjustment select _foreachindex) isEqualTo [0, 0, 0])) then {
            _adjustment set [_forEachIndex, [0, 0, 0]];
            [ACE_player, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);
        };
    };
} forEach GVAR(Optics);

_adjustment = ACE_player getVariable QGVAR(Adjustment);
GVAR(Optics) = _newOptics;
