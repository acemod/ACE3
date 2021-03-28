#include "script_component.hpp"
/*
 * Author: Rosuto
 * DAGR vector output loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_dagr_fnc_outputVector
 *
 * Public: No
 */

135471 cutRsc ["DAGR_DISPLAY", "plain down"];

#define __display (uiNameSpace getVariable "DAGR_DISPLAY")

#define __gridControl (__display displayCtrl 266851)
#define __speedControl (__display displayCtrl 266858)
#define __elevationControl (__display displayCtrl 266853)
#define __headingControl (__display displayCtrl 266854)
#define __timeControl (__display displayCtrl 266855)
#define __background (__display displayCtrl 266856)

__background ctrlSetText QPATHTOF(UI\dagr_vector.paa);

if (GVAR(noVectorData)) exitWith {};
GVAR(LAZPOS) params ["_lazPosX", "_lazPosY", "_lazPosZ"];

// Incase grids go neg due to 99-00 boundry
if (_lazPosX < 0) then { _lazPosX = _lazPosX + 99999;};
if (_lazPosY < 0) then {_lazPosY = _lazPosY + 99999;};

// Find laser position
private _xGrid = toArray Str(round _lazPosX);

while {count _xGrid < 5} do {
    _xGrid = [48] + _xGrid;
};
_xGrid resize 4;
_xGrid = toString _xGrid;
_xGrid = parseNumber _xGrid;

private _yGrid = toArray Str(round _lazPosY);
while {count _yGrid < 5} do {
    _yGrid = [48] + _yGrid;
};
_yGrid resize 4;
_yGrid = toString _yGrid;
_yGrid = parseNumber _yGrid;

private _xCoord = switch true do {
    case (_xGrid >= 1000): { "" + Str(_xGrid) };
    case (_xGrid >= 100): { "0" + Str(_xGrid) };
    case (_xGrid >= 10): { "00" + Str(_xGrid) };
    default             { "000" + Str(_xGrid) };
};

private _yCoord = switch true do {
    case (_yGrid >= 1000): { "" + Str(_yGrid) };
    case (_yGrid >= 100): { "0" + Str(_yGrid) };
    case (_yGrid >= 10): { "00" + Str(_yGrid) };
    default             { "000" + Str(_yGrid) };
};

private _dagrGrid = _xCoord + " " + _yCoord;

// Find target elevation
private _elevation = floor ((_lazPosZ) + EGVAR(common,mapAltitude));
private _dagrElevation = str _elevation + "m";

// Time
private _dagrTime = [daytime, "HH:MM"] call bis_fnc_timeToString;

// Bearing
private _bearing = GVAR(LAZHEADING);
if (_bearing >= 360) then {_bearing = _bearing - 360;};
if (!GVAR(useDegrees)) then {_bearing = DEG_TO_MIL(_bearing)};
_bearing = floor (_bearing);

// Distance
private _dagrDist = str GVAR(LAZDIST) + "m";

// Put grid into variable so DAGR menu can access it
GVAR(vectorGrid) = _dagrGrid;

// OUTPUT
__gridControl ctrlSetText format ["%1", _dagrGrid];
__speedControl ctrlSetText format ["%1", _dagrDist];
__elevationControl ctrlSetText format ["%1", _dagrElevation];
__headingControl ctrlSetText (if (!GVAR(useDegrees)) then { format ["%1", _bearing] } else { format ["%1°", _bearing] });
__timeControl ctrlSetText format ["%1", _dagrTime];
