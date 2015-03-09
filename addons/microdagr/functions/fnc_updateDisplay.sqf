/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Third Optional Argument <BOOL><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#include "script_component.hpp"

disableSerialization;
_display = (uiNamespace getVariable ["testGPS", displayNull]);
_isControl = true;
if (isNull _display) then {
    _display = (uiNamespace getVariable ["testGPS_T", displayNull]);
    _isControl = false;
};
if (isNull _display) exitWith {};

(_display displayCtrl IDC_CLOCKTEXT) ctrlSetText ([daytime, "HH:MM"] call bis_fnc_timeToString);

switch (GVAR(currentApplicationPage)) do {
case (0): {
        //Easting/Northing:
        _posString = mapGridPosition ACE_player;
        _eastingText = "";
        _northingText = "";
        if (count _posString > 0) then {
            _eastingText = (_posString select [0, ((count _posString)/2)]) + "e";
            _northingText = (_posString select [(count _posString)/2, (count _posString - 1)]) + "n";
        };

        (_display displayCtrl IDC_MODEDISPLAY_EASTING) ctrlSetText _eastingText;
        (_display displayCtrl IDC_MODEDISPLAY_NORTHING) ctrlSetText _northingText;

        //Elevation:
        _numASL = (GVAR(gpsPositionASL) select 2) + getNumber(configFile >> "CfgWorlds" >> worldName >> "elevationOffset");
        _aboveSeaLevelText = [_numASL, 5, 0] call CBA_fnc_formatNumber;
        _aboveSeaLevelText = if (_numASL > 0) then {"+" + _aboveSeaLevelText + " MSL"} else {_aboveSeaLevelText + " MSL"};
        (_display displayCtrl IDC_MODEDISPLAY_ELEVATIONNUM) ctrlSetText _aboveSeaLevelText;

        //Heading:
        _compassAngleText = [(floor (getDir ace_player)), 3, 1] call CBA_fnc_formatNumber;
        _compassAngleText = _compassAngleText + "°"; //degree symbol is in UTF-8
        (_display displayCtrl IDC_MODEDISPLAY_HEADINGNUM) ctrlSetText _compassAngleText;

        //Speed:
        (_display displayCtrl IDC_MODEDISPLAY_SPEEDNUM) ctrlSetText format ["%1kph", (round (speed (vehicle ace_player)))];;


        if (GVAR(currentWaypoint) == -1) then {
            (_display displayCtrl IDC_MODEDISPLAY_TIMEDISPLAYGREEN1) ctrlSetText "18-Feb-2010";
            (_display displayCtrl IDC_MODEDISPLAY_TIMEDISPLAYGREEN2) ctrlSetText ([daytime, "HH:MM:SS"] call bis_fnc_timeToString);
        } else {
            _targetPosName = "";
            _targetPosLocationASL = [];
            _bearingText = "----";
            _rangeText = "----";
            _aboveSeaLevelText = "----";
            _targetName = "----";

            if (GVAR(currentWaypoint) == -2) then {
                if (!(GVAR(rangeFinderPositionASL) isEqualTo [])) then {
                    _targetPosName = format ["[%1]", (mapGridPosition GVAR(rangeFinderPositionASL))];
                    _targetPosLocationASL = GVAR(rangeFinderPositionASL);
                };
            } else {
                if (GVAR(currentWaypoint) > ((count GVAR(waypointList) - 1))) exitWith {ERROR("bounds");};
                _targetPosName = (GVAR(waypointList) select GVAR(currentWaypoint)) select 0;
                _targetPosLocationASL = (GVAR(waypointList) select GVAR(currentWaypoint)) select 1;
            };

            if (!(_targetPosLocationASL isEqualTo [])) then {
                _bearing = [GVAR(gpsPositionASL), _targetPosLocationASL] call BIS_fnc_dirTo;
                _bearingText = format ["%1°M", [_bearing, 3, 1] call CBA_fnc_formatNumber];
                _2dDistanceKm = ((GVAR(gpsPositionASL) select [0,2]) distance (_targetPosLocationASL select [0,2])) / 1000;
                _rangeText = format ["%1km", ([_2dDistanceKm, 1, 1] call CBA_fnc_formatNumber)];
                _numASL = (_targetPosLocationASL select 2) + getNumber(configFile >> "CfgWorlds" >> worldName >> "elevationOffset");
                _aboveSeaLevelText = [_numASL, 5, 0] call CBA_fnc_formatNumber;
                _aboveSeaLevelText = if (_numASL > 0) then {"+" + _aboveSeaLevelText + " MSL"} else {_aboveSeaLevelText + " MSL"};
            };

            (_display displayCtrl IDC_MODEDISPLAY_TRACKNUM) ctrlSetText _bearingText;
            (_display displayCtrl IDC_MODEDISPLAY_TARGETRANGENUM) ctrlSetText _rangeText;
            (_display displayCtrl IDC_MODEDISPLAY_TARGETELEVATIONNUM) ctrlSetText _aboveSeaLevelText;
            (_display displayCtrl IDC_MODEDISPLAY_TARGETNAME) ctrlSetText _targetPosName;
        };


        // _modePositionInfo ctrlSetStructuredText parseText format ["<t font='EtelkaMonospacePro'><t size='1' align='left'>MGRS-New</t><t align='right'>WGD</t><br/><br/><t size='2' align='right'>%1 %2e<br/>%3n</t><br/><br/><t size='1' align='left'>Elevation:</t><t size='1.5' align='right'>+%4m MSL</t><br/><br/><t align='left'><img size='2' image='mapButton_track.paa'/><t size='1.5' align='center'>%5°</t><t size='1.5' align='right'>%6kph</t><br/><br/><t align='left'><img size='2' image='mapButton_track.paa'/><t size='1' color='#449d65' align='center'>%7 %8L</t></t>", _utmGrid, _easting, _northing, _aboveSeaLevel, _compassAngle, _playerSpeed, _date, _time];

        //bullshit gps accuracy: <t size='1' align='left'>EHE: +03.7</t><t size='1' align='right'>FOM: 1</t><br/><br/>
    };
case (1): {
        //Heading:
        _compassAngleText = [(floor (getDir ace_player)), 3, 1] call CBA_fnc_formatNumber;
        _compassAngleText = _compassAngleText + "°M"; //degree symbol is in UTF-8
        (_display displayCtrl IDC_MODECOMPASS_HEADING) ctrlSetText _compassAngleText;

        //Speed:
        _SpeedText = format ["%1kph", (round (speed (vehicle ace_player)))];;
        (_display displayCtrl IDC_MODECOMPASS_SPEED) ctrlSetText _SpeedText;

        if (GVAR(currentWaypoint) == -1) then {
            (_display displayCtrl IDC_MODECOMPASS_BEARING) ctrlSetText "";
            (_display displayCtrl IDC_MODECOMPASS_RANGE) ctrlSetText "";
            (_display displayCtrl IDC_MODECOMPASS_TARGET) ctrlSetText "";
        } else {
            _playerPos2d = GVAR(gpsPositionASL) select [0,2];

            _targetPosName = "";
            _targetPosLocationASL = [];

            if (GVAR(currentWaypoint) == -2) then {
                if (!(GVAR(rangeFinderPositionASL) isEqualTo [])) then {
                    _targetPosName = format ["[%1]", (mapGridPosition GVAR(rangeFinderPositionASL))];
                    _targetPosLocationASL = GVAR(rangeFinderPositionASL);
                };
            } else {
                if (GVAR(currentWaypoint) > ((count GVAR(waypointList) - 1))) exitWith {ERROR("bounds");};
                _targetPosName = (GVAR(waypointList) select GVAR(currentWaypoint)) select 0;
                _targetPosLocationASL = (GVAR(waypointList) select GVAR(currentWaypoint)) select 1;
            };

            _bearing = "---";
            _rangeText = "---";

            if (!(_targetPosLocationASL isEqualTo [])) then {
                _bearing = [GVAR(gpsPositionASL), _targetPosLocationASL] call BIS_fnc_dirTo;
                _bearing = format ["%1°M", [_bearing, 3, 1] call CBA_fnc_formatNumber];
                _2dDistanceKm = ((GVAR(gpsPositionASL) select [0,2]) distance (_targetPosLocationASL select [0,2])) / 1000;
                _rangeText = format ["%1km", ([_2dDistanceKm, 1, 1] call CBA_fnc_formatNumber)];
            };

            (_display displayCtrl IDC_MODECOMPASS_BEARING) ctrlSetText _bearing;
            (_display displayCtrl IDC_MODECOMPASS_RANGE) ctrlSetText _rangeText;
            (_display displayCtrl IDC_MODECOMPASS_TARGET) ctrlSetText _targetPosName;
        };
    };

case (APP_MODE_WAYPOINTS): {
        _wpListBox = _display displayCtrl IDC_MODEWAYPOINTS_LISTOFWAYPOINTS;
        _currentIndex = lbCurSel _wpListBox;

        lbClear _wpListBox;
        {
            EXPLODE_2_PVT(_x,_wpName,_wpPos);
            _wpListBox lbAdd _wpName;
            _2dDistanceKm = ((GVAR(gpsPositionASL) select [0,2]) distance (_wpPos select [0,2])) / 1000;
            _wpListBox lbSetTextRight [_forEachIndex, (format ["%1km", ([_2dDistanceKm, 1, 1] call CBA_fnc_formatNumber)])];
        } forEach GVAR(waypointList);

        _currentIndex = (_currentIndex max 0) min (count GVAR(waypointList));
        _wpListBox lbSetCurSel _currentIndex;
    };
};
