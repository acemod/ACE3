/*
 * Author: Rosuto
 * DAGR data output loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_dagr_fnc_outputData
 *
 * Public: No
 */
#include "script_component.hpp"

135471 cutRsc ["DAGR_DISPLAY", "plain down"];

#define __display (uiNameSpace getVariable "DAGR_DISPLAY")

#define __gridControl (__display displayCtrl 266851)
#define __speedControl (__display displayCtrl 266852)
#define __elevationControl (__display displayCtrl 266853)
#define __headingControl (__display displayCtrl 266854)
#define __timeControl (__display displayCtrl 266855)
#define __background (__display displayCtrl 266856)

__background ctrlSetText QPATHTOF(UI\dagr_gps.paa);

if (GVAR(outputPFH) != -1) exitWith {};

GVAR(outputPFH) = [{
    private ["_dagrElevation", "_dagrGrid", "_dagrHeading", "_dagrSpeed", "_dagrTime", "_elevation", "_gridArray", "_speed"];

    // Abort Condition
    if !(GVAR(run) && [ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {
        GVAR(outputPFH) = -1;
        135471 cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    // GRID
    _gridArray = [(getPos ACE_player), false] call EFUNC(common,getMapGridFromPos);
    _gridArray params ["_gridArrayX","_gridArrayY"];
    _dagrGrid = format ["%1 %2", ((_gridArrayX) select [0,4]), ((_gridArrayY) select [0,4])];

    // SPEED
    _speed = speed (vehicle ACE_player);
    _speed = floor (_speed * 10) / 10;
    _speed = abs(_speed);
    _dagrspeed = str _speed + "kph";

    // Elevation
    _elevation = getPosASL ACE_player;
    _elevation = floor ((_elevation select 2) + EGVAR(common,mapAltitude));
    _dagrElevation = str _elevation + "m";

    // Heading
    _dagrHeading = if (!GVAR(useDegrees)) then {
        floor (DEG_TO_MIL(direction (vehicle ACE_player)))
    } else {
        floor (direction (vehicle ACE_player))
    };

    // Time
    _dagrTime = [daytime, "HH:MM"] call bis_fnc_timeToString;

    // Output
    __gridControl ctrlSetText format ["%1", _dagrGrid];
    __speedControl ctrlSetText format ["%1", _dagrSpeed];
    __elevationControl ctrlSetText format ["%1", _dagrElevation];
    __headingControl ctrlSetText (if (!GVAR(useDegrees)) then { format ["%1", _dagrHeading] } else { format ["%1 �", _dagrHeading] });
    __timeControl ctrlSetText format ["%1", _dagrTime];

}, GVAR(updateInterval), []] call CBA_fnc_addPerFrameHandler;
