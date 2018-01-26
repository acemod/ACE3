/*
 * Author: Rosuto
 * DAGR waypoint output loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_dagr_fnc_outputWP
 *
 * Public: No
 */
#include "script_component.hpp"

135471 cutRsc ["DAGR_DISPLAY", "plain down"];

#define __display (uiNameSpace getVariable "DAGR_DISPLAY")

#define __gridControl (__display displayCtrl 266851)
#define __speedControl (__display displayCtrl 266858)
#define __elevationControl (__display displayCtrl 266857)
#define __headingControl (__display displayCtrl 266854)
#define __timeControl (__display displayCtrl 266859)
#define __background (__display displayCtrl 266856)

__background ctrlSetText QPATHTOF(UI\dagr_wp.paa);

if (GVAR(outputPFH) != -1) exitWith {};

GVAR(outputPFH) = [{
    // Abort Condition
    if !(GVAR(run) && [ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {
        GVAR(outputPFH) = -1;
        135471 cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    // GRID
    private _gridArray = [(getPos ACE_player), false] call EFUNC(common,getMapGridFromPos);
    _gridArray params ["_gridArrayX","_gridArrayY"];
    private _dagrGrid = format ["%1 %2", (_gridArrayX select [0,4]), (_gridArrayY select [0,4])];

    // WP Grid
    private _xGrid2 = floor (DAGR_WP_INFO / 10000);
    private _yGrid2 = DAGR_WP_INFO - _xGrid2 * 10000;

    _xCoord2 = switch true do {
        case (_xGrid2 >= 1000): { "" + Str(_xGrid2) };
        case (_xGrid2 >= 100): { "0" + Str(_xGrid2) };
        case (_xGrid2 >= 10): { "00" + Str(_xGrid2) };
        default             { "000" + Str(_xGrid2) };
    };

    _yCoord2 = switch true do {
        case (_yGrid2 >= 1000): { "" + Str(_yGrid2) };
        case (_yGrid2 >= 100): { "0" + Str(_yGrid2) };
        case (_yGrid2 >= 10): { "00" + Str(_yGrid2) };
        default             { "000" + Str(_yGrid2) };
    };

    _dagrGrid2 = _xCoord2 + " " + _yCoord2;

    // Distance
    private _WPpos = [_dagrGrid2, true] call EFUNC(common,getMapPosFromGrid);
    private _MYpos = [_dagrGrid, true] call EFUNC(common,getMapPosFromGrid);
    private _distance = _MYpos distance _WPpos;
    _distance = floor (_distance * 10) / 10;
    private _dagrDistance = str _distance + "m";

    // Heading
    private _dagrHeading = floor (if (GVAR(useDegrees)) then {
        direction (vehicle ACE_player)
    } else {
        DEG_TO_MIL(direction (vehicle ACE_player))
    });

    // WP Heading
    private _bearing = floor (if (GVAR(useDegrees)) then {
        ((_WPpos vectorDiff _MYpos) call CBA_fnc_vectDir)
    } else {
        DEG_TO_MIL(((_WPpos vectorDiff _MYpos) call CBA_fnc_vectDir))
    });

    // Output
    __gridControl ctrlSetText format ["%1", _dagrGrid];
    __speedControl ctrlSetText format ["%1", _bearing];
    __elevationControl ctrlSetText format ["%1", _dagrGrid2];
    __headingControl ctrlSetText (if (!GVAR(useDegrees)) then { format ["%1", _dagrHeading] } else { format ["%1°", _dagrHeading] });
    __timeControl ctrlSetText format ["%1", _dagrDistance];

}, GVAR(updateInterval), []] call CBA_fnc_addPerFrameHandler;
