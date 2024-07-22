#include "..\script_component.hpp"
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
    // Abort Condition
    if !(GVAR(run) && [ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {
        GVAR(outputPFH) = -1;
        135471 cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    // GRID
    private _gridArray = [(getPos ACE_player), false] call EFUNC(common,getMapGridFromPos);
    _gridArray params ["_gridArrayX","_gridArrayY"];
    private _dagrGrid = format ["%1 %2", ((_gridArrayX) select [0,4]), ((_gridArrayY) select [0,4])];

    // SPEED
    private _speed = speed (vehicle ACE_player);
    _speed = floor (_speed * 10) / 10;
    _speed = abs(_speed);
    _dagrspeed = str _speed + "kph";

    // Elevation
    private _elevation = getPosASL ACE_player;
    _elevation = floor ((_elevation select 2) + EGVAR(common,mapAltitude));
    private _dagrElevation = str _elevation + "m";

    // Heading
    private _dagrHeading = if (!GVAR(useDegrees)) then {
        floor (DEG_TO_MIL(direction (vehicle ACE_player)))
    } else {
        floor (direction (vehicle ACE_player))
    };

    // Time
    private _dagrTime = [daytime, "HH:MM"] call bis_fnc_timeToString;

    // Output
    __gridControl ctrlSetText _dagrGrid;
    __speedControl ctrlSetText _dagrSpeed;
    __elevationControl ctrlSetText _dagrElevation;
    __headingControl ctrlSetText (if (!GVAR(useDegrees)) then { str _dagrHeading } else { format ["%1 �", _dagrHeading] });
    __timeControl ctrlSetText _dagrTime;

}, GVAR(updateInterval), []] call CBA_fnc_addPerFrameHandler;
