/*
 * Author: SilentSpike
 * Correctly handles toggling of spectator interface elements for clean UX
 *
 * Arguments:
 * 0: Display
 * 1: Toogle compass <BOOL> <OPTIONAL>
 * 2: Toogle help <BOOL> <OPTIONAL>
 * 3: Toogle interface <BOOL> <OPTIONAL>
 * 4: Toogle map <BOOL> <OPTIONAL>
 * 5: Toogle toolbar <BOOL> <OPTIONAL>
 * 6: Toogle unit list <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [_dsiplay, nil, true] call ace_spectator_fnc_toggleInterface
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display", ["_toggleComp",false], ["_toggleHelp",false], ["_toggleInterface",false], ["_toggleMap",false], ["_toggleTool",false], ["_toggleUnit",false]];

// Map and help operate outside of interface
GVAR(showHelp) = [GVAR(showHelp), !GVAR(showHelp)] select _toggleHelp;
GVAR(showMap) = [GVAR(showMap), !GVAR(showMap)] select _toggleMap;

// When help changes with map open, minimise the map
if (GVAR(showMap) && _toggleHelp) then {
    GVAR(showHelp) = true;
    GVAR(showMap) = false;
};

(_display displayCtrl IDC_HELP) ctrlShow GVAR(showHelp);
(_display displayCtrl IDC_MAP) ctrlShow GVAR(showMap);

if (GVAR(showMap)) then {
    // When map is shown, temporarily hide interface to stop overlapping
    {
        (_display displayCtrl _x) ctrlShow false;
    } forEach [IDC_COMP,IDC_HELP,IDC_TOOL,IDC_UNIT];
} else {
    // Can only toggle interface with map minimised
    GVAR(showInterface) = [GVAR(showInterface), !GVAR(showInterface)] select _toggleInterface;

    if (GVAR(showInterface)) then {
        // Can only toggle interface elements with interface shown
        GVAR(showComp) = [GVAR(showComp), !GVAR(showComp)] select _toggleComp;
        GVAR(showTool) = [GVAR(showTool), !GVAR(showTool)] select _toggleTool;
        GVAR(showUnit) = [GVAR(showUnit), !GVAR(showUnit)] select _toggleUnit;

        (_display displayCtrl IDC_COMP) ctrlShow GVAR(showComp);
        (_display displayCtrl IDC_TOOL) ctrlShow GVAR(showTool);
        (_display displayCtrl IDC_UNIT) ctrlShow GVAR(showUnit);
    } else {
        {
            (_display displayCtrl _x) ctrlShow false;
        } forEach [IDC_COMP,IDC_TOOL,IDC_UNIT];
    };
};
