/*
 * Author: Rosuto
 * DAGR waypoint output loop
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
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

__background ctrlSetText QUOTE(PATHTOF(UI\dagr_wp.paa));

[{
    private ["_pos", "_xGrid", "_yGrid", "_xCoord", "_yCoord", "_dagrHeading", "_dagrGrid", "_bearing", "_MYpos", "_WPpos", "_dagrDistance", "_distance"];
    
    // Abort Condition
    if !(GVAR(run) && [ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {
        135471 cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
    
    // GRID
    _pos = getPosASL ACE_player;
    
    // Incase grids go neg due to 99-00 boundry
    if (_pos select 0 < 0) then {_pos set [0, (_pos select 0) + 99999];};
    if (_pos select 1 < 0) then {_pos set [1, (_pos select 1) + 99999];};

    _xGrid = toArray Str(round(_pos select 0));
    while {count _xGrid < 5} do {
        _xGrid = [48] + _xGrid;
    };
    _xGrid resize 4;
    _xGrid = toString _xGrid;
    _xGrid = parseNumber _xGrid;

    _yGrid = toArray Str(round(_pos select 1));
    while {count _yGrid < 5} do {
        _yGrid = [48] + _yGrid;
    };
    _yGrid resize 4;
    _yGrid = toString _yGrid;
    _yGrid = parseNumber _yGrid;

    _xCoord = switch true do {
        case (_xGrid >= 1000): { "" + Str(_xGrid) };
        case (_xGrid >= 100): { "0" + Str(_xGrid) };
        case (_xGrid >= 10): { "00" + Str(_xGrid) };
        default             { "000" + Str(_xGrid) };
    };

    _yCoord = switch true do {
        case (_yGrid >= 1000): { "" + Str(_yGrid) };
        case (_yGrid >= 100): { "0" + Str(_yGrid) };
        case (_yGrid >= 10): { "00" + Str(_yGrid) };
        default             { "000" + Str(_yGrid) };
    };

    _dagrGrid = _xCoord + " " + _yCoord;

    // WP Grid
    _xGrid2 = floor (DAGR_WP_INFO / 10000);
    _yGrid2 = DAGR_WP_INFO - _xGrid2 * 10000;
    
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
    _WPpos = [[_xCoord2, _yCoord2], true] call CBA_fnc_mapGridToPos;
    _MYpos = [[_xCoord, _yCoord], true] call CBA_fnc_mapGridToPos;
    _distance = _MYpos distance _WPpos;
    _distance = floor (_distance * 10) / 10;
    _dagrDistance = str _distance + "m";
    
    // Heading
    _dagrHeading = floor (if (GVAR(useDegrees)) then {
        direction (vehicle ACE_player)
    } else {
        DEG_TO_MIL(direction (vehicle ACE_player))
    });

    // WP Heading
    _bearing = floor ((_WPpos vectorDiff _MYpos) call CBA_fnc_vectDir);
    
    // Output
    __gridControl ctrlSetText format ["%1", _dagrGrid];
    __speedControl ctrlSetText format ["%1", _bearing];
    __elevationControl ctrlSetText format ["%1", _dagrGrid2];
    __headingControl ctrlSetText (if (!GVAR(useDegrees)) then { format ["%1", _dagrHeading] } else { format ["%1°", _dagrHeading] });
    __timeControl ctrlSetText format ["%1", _dagrDistance];
    
}, GVAR(updateInterval), []] call CBA_fnc_addPerFrameHandler;
