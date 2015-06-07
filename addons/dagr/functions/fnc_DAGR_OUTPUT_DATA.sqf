/*
 * Author: Rosuto
 * DAGR data output loop
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

private ["_pos", "_x", "_y", "_xgrid", "_pos", "_ygrid", "_lastY", "_lastX", "_xcoord", "_ycoord", "_display", "_speed", "_vic", "_dagrHeading", "_dagrGrid", "_background", "_dagrElevation", "_dagrSpeed", "_dagrTime", "_elevation", "_elevationControl", "_grid", "_gridControl", "_headingControl", "_speedControl", "_timeControl"];

135471 cutRsc ["DAGR_DISPLAY", "plain down"];
_display = (uiNameSpace getVariable "DAGR_DISPLAY");

_gridControl = _display displayCtrl 266851;
_speedControl = _display displayCtrl 266852;
_elevationControl = _display displayCtrl 266853;
_headingControl = _display displayCtrl 266854;
_timeControl = _display displayCtrl 266855;
_background = _display displayCtrl 266856;

_background ctrlSetText QUOTE(PATHTOF(UI\dagr_gps.paa));

while {DAGR_RUN} do {
    if (Dagr_Map_Info == "default") then {
        _dagrGrid = mapGridPosition ACE_player;
    } else {
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
                    } else{
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
                    } else{
                        "000" + str _ygrid;
                    };
                };
            };
        _dagrGrid = _xcoord + " " + _ycoord;
    };

    //SPEED
    if (vehicle ACE_player != ACE_player) then {
        _vic = vehicle ACE_player;
        _speed = speed _vic;
    } else{
        _speed = speed ACE_player;
    };
    _speed = floor (_speed *10) / 10;
    _speed = abs(_speed);
    _dagrspeed = str _speed + "kph";

    //Elevation
    _elevation = getPosASL ACE_player;
    _elevation = floor ((_elevation select 2) + EGVAR(weather,altitude));
    _dagrElevation = str _elevation + "m";

    //Heading
    if (vehicle ACE_player != ACE_player) then {
        _vic = vehicle ACE_player;
        _dagrHeading = if (!DAGR_DIRECTION) then {floor ((direction _vic)/360*6400)} else {floor (direction _vic);};
    } else{
        _dagrHeading = if (!DAGR_DIRECTION) then {floor ((direction ACE_player)/360*6400)} else {floor (direction ACE_player);};
    };

    //Time
    _dagrTime = [daytime, "HH:MM"] call bis_fnc_timeToString;

    //output
    _gridControl ctrlSetText format ["%1", _dagrGrid];
    _speedControl ctrlSetText format ["%1", _dagrSpeed];
    _elevationControl ctrlSetText format ["%1", _dagrElevation];
    _headingControl ctrlSetText (if (!DAGR_DIRECTION) then { format ["%1", _dagrHeading] } else { format ["%1 °", _dagrHeading] });
    _timeControl ctrlSetText format ["%1", _dagrTime];

    sleep DAGRSLEEP;
    if !([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {
        DAGR_RUN = false;
        135471 cutText ["", "PLAIN"];
    };
};
