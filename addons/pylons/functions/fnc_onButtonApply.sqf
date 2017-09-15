/*
 * Author: 654wak654
 * Applies the current configuration of pylons to the aircraft
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

// Pick combo boxes where current selection doesn't match original selection
private _pylonsToConfigure = GVAR(comboBoxes) select {(lbCurSel (_x select 0)) != (_x select 3)};

{
    [
        GVAR(timePerPylon),
        _x,
        {
            // TODO: Change pylon
            if (GVAR(rearmNewPylons)) then {
                // TODO: Rearm
            };
        },
        {
            ["", false, 5] call EFUNC(common,displayText); // TODO: Failed text
        },
        format [LSTRING(ConfiguringPylon), _forEachIndex + 1, count _pylonsToConfigure]
    ] call EFUNC(common,progressBar);
} forEach _pylonsToConfigure;
