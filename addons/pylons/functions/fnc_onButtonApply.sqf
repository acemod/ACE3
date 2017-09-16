/*
 * Author: 654wak654
 * Starts the pylon configuration.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onButtonApply
 *
 * Public: No
 */
#include "script_component.hpp"

private _pylonsToConfigure = [];
{
    // Pick combo boxes where current selection doesn't match original selection
    if ((lbCurSel (_x select 0)) != (_x select 3)) then {
        _pylonsToConfigure pushBack _forEachIndex;
    };
} forEach GVAR(comboBoxes);

if (_pylonsToConfigure isEqualTo []) exitWith {};

[_pylonsToConfigure, 0] call FUNC(configurePylons);
