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

private ["_comp","_help","_map","_tool","_unit"];
_comp = _display displayCtrl IDC_COMP;
_help = _display displayCtrl IDC_HELP;
_map = _display displayCtrl IDC_MAP;
_tool = _display displayCtrl IDC_TOOL;
_unit = _display displayCtrl IDC_UNIT;

// Map operates outside of interface
GVAR(showMap) = [GVAR(showMap), !GVAR(showMap)] select _toggleMap;
_map ctrlShow GVAR(showMap);

if (GVAR(showMap)) then {
    // When map is shown, temporarily hide interface to stop overlapping
    {
        _x ctrlShow false;
    } forEach [_comp,_help,_tool,_unit];

    // Centre map on camera/unit upon opening
    if (_toggleMap) then {
        _map ctrlMapAnimAdd [0, 0.5, [GVAR(camUnit),GVAR(camera)] select (GVAR(camMode) == 0)];
        ctrlMapAnimCommit _map;
    };
} else {
    // Can only toggle interface with map minimised
    GVAR(showInterface) = [GVAR(showInterface), !GVAR(showInterface)] select _toggleInterface;

    if (GVAR(showInterface)) then {
        // Can only toggle interface elements with interface shown
        GVAR(showComp) = [GVAR(showComp), !GVAR(showComp)] select _toggleComp;
        GVAR(showHelp) = [GVAR(showHelp), !GVAR(showHelp)] select _toggleHelp;
        GVAR(showTool) = [GVAR(showTool), !GVAR(showTool)] select _toggleTool;
        GVAR(showUnit) = [GVAR(showUnit), !GVAR(showUnit)] select _toggleUnit;

        _comp ctrlShow GVAR(showComp);
        _help ctrlShow GVAR(showHelp);
        _tool ctrlShow GVAR(showTool);
        _unit ctrlShow GVAR(showUnit);
    } else {
        {
            _x ctrlShow false;
        } forEach [_comp,_help,_tool,_unit];
    };
};

// Only run PFHs when respective control is shown, otherwise kill
if (ctrlShown _comp) then {
    if (isNil QGVAR(compHandler)) then { GVAR(compHandler) = [FUNC(handleCompass), 0, _display] call CBA_fnc_addPerFrameHandler; };
} else {
    GVAR(compHandler) = nil;
};

if (ctrlShown _tool) then {
    if (isNil QGVAR(toolHandler)) then { GVAR(toolHandler) = [FUNC(handleToolbar), 0, _display] call CBA_fnc_addPerFrameHandler; };
} else {
    GVAR(toolHandler) = nil;
};
