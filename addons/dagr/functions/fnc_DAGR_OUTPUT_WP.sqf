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

disableSerialization;

private ["_pos", "_x", "_y", "_xgrid", "_ygrid", "_lastY", "_lastX", "_xcoord", "_ycoord", "_sec", "_min", "_hour", "_time", "_display", "_speed", "_vic", "_dagrHeading", "_WPHeading", "_dagrGrid", "_bearing", "_MYpos", "_WPpos", "_background", "_dagrDistance", "_distance", "_elevationControl", "_grid", "_gridControl", "_headingControl", "_speedControl", "_timeControl"];

135471 cutRsc ["DAGR_DISPLAY", "plain down"];
_display = (uiNameSpace getVariable "DAGR_DISPLAY");

_gridControl = _display displayCtrl 266851;
_speedControl = _display displayCtrl 266858;
_elevationControl = _display displayCtrl 266857;
_headingControl = _display displayCtrl 266854;
_timeControl = _display displayCtrl 266859;
_background = _display displayCtrl 266856;

_background ctrlSetText QUOTE(PATHTOF(UI\dagr_wp.paa));

while {DAGR_RUN} do {
    //if (Dagr_Map_Info == "default") exitwith {_gridControl ctrlSetText "ERROR"};
    //GRID
    _pos = getPos ACE_player;
    _x = _pos select 0;
    _y = _pos select 1;

    _grid = ACE_player call FUNC(mapCoord);
    _xgrid = floor (call compile (_grid select 0));
    _ygrid = floor (call compile (_grid select 1));

    //Incase grids go neg due to 99-00 boundry
    if (_xgrid < 0) then {_xgrid = _xgrid + 9999;};
    if (_ygrid < 0) then {_ygrid = _ygrid + 9999;};

    _xcoord =
        if (_xgrid >= 1000) then {
            str _xgrid;
        } else {
            if (_xgrid >= 100) then {
                "0" + str _xgrid;
            } else {
                if (_xgrid >= 10) then {
                    "00" + str _xgrid;
                }else{
                    "000" + str _xgrid;
                };
            };
        };

    _ycoord =
        if (_ygrid >= 1000) then {
            str _ygrid;
        } else {
            if (_ygrid >= 100) then {
                "0" + str _ygrid;
            } else {
                if (_ygrid >= 10) then {
                    "00" + str _ygrid;
                }else{
                    "000" + str _ygrid;
                };
            };
        };

    _dagrGrid = _xcoord + " " + _ycoord;

    //WP Grid
    _xgrid2 = floor (DAGR_WP_INFO / 10000);
    _ygrid2 = DAGR_WP_INFO - _xgrid2 * 10000;

    _xcoord2 =
        if (_xgrid2 >= 1000) then {
            str _xgrid2;
        } else {
            if (_xgrid2 >= 100) then {
                "0" + str _xgrid2;
            } else {
                if (_xgrid2 >= 10) then {
                    "00" + str _xgrid2;
                }else{
                    "000" + str _xgrid2;
                };
            };
        };

    _ycoord2 =
        if (_ygrid2 >= 1000) then {
            str _ygrid2;
        } else {
            if (_ygrid2 >= 100) then {
                "0" + str _ygrid2;
            } else {
                if (_ygrid2 >= 10) then {
                    "00" + str _ygrid2;
                }else{
                    "000" + str _ygrid2;
                };
            };
        };

    _dagrGrid2 = _xcoord2 + " " + _ycoord2;

    //Distance
    _WPpos = [[_xcoord2, _ycoord2], true] call CBA_fnc_mapGridToPos;
    _MYpos = [[_xcoord, _ycoord], true] call CBA_fnc_mapGridToPos;
    _distance = _MYpos distance _WPpos;
    _distance = floor (_distance * 10);
    _distance = _distance / 10;
    _dagrDistance = str _distance + "m";


    //ACE_player Heading
    if (vehicle ACE_player != ACE_player) then {
        _vic = vehicle ACE_player;
        if (DAGR_DIRECTION) then {
            _dagrHeading = floor (direction _vic);
        } else {
            _dagrHeading = floor ((direction _vic)/360*6400);
        };
    }else{
        if (DAGR_DIRECTION) then {
            _dagrHeading = floor (direction ACE_player);
        } else {
            _dagrHeading = floor ((direction ACE_player)/360*6400);
        };
    };

    //WP Heading
    _x = ((_WPpos select 0) - (_MYpos select 0));
    _y = ((_WPpos select 1) - (_MYpos select 1));

    if (_distance == 0) then {
        _bearing = 0;
    } else {
        _bearing = _x / _distance;
        if (_bearing >= 1) then {_bearing = 1;};
        if (_bearing <= -1) then {_bearing = -1;};
        _bearing = acos _bearing;
        //_bearing = floor (_bearing);
        if (_x >= 0 && {_y >= 0}) then {_bearing = 0 - _bearing + 90;};
        if (_x < 0 && {_y >= 0}) then {_bearing = 0 - _bearing + 450;};
        if (_x < 0 && {_y < 0}) then {_bearing = _bearing + 90;};
        if (_x >= 0 && {_y < 0}) then {_bearing = _bearing + 90;};
        if (!DAGR_DIRECTION) then {_bearing = floor (_bearing/360*6400)} else {_bearing = floor (_bearing)};
    };

    //output
    _gridControl ctrlSetText format ["%1", _dagrGrid];
    _speedControl ctrlSetText format ["%1", _bearing];
    _elevationControl ctrlSetText format ["%1", _dagrGrid2];
    _headingControl ctrlSetText (if (!DAGR_DIRECTION) then { format ["%1", _dagrHeading] } else { format ["%1°", _dagrHeading] });
    _timeControl ctrlSetText format ["%1", _dagrDistance];

    sleep DAGRSLEEP;
    if !([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {
        DAGR_RUN = false;
        135471 cutText ["", "PLAIN"];
    };
};
