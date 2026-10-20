#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Focuses the Arma window
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *   - 1: Focus window
 *   - 2: Flash window
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_common_fnc_focusWindow
 *
 * Public: Yes
*/

params [["_mode", 1, [1]]];

// Start from 1 since 0 is usually used as a "disabled" option
switch (_mode) do {
    case 1: {
        "ace" callExtension ["window:focus", []];
    };
    case 2: {
        "ace" callExtension ["window:flash", []];
    };
};
