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

_theMap = _this select 0;
_mapSize = (ctrlPosition _theMap) select 3;

_waypoints = [] call FUNC(deviceGetWaypoints);

if (GVAR(currentApplicationPage) == 1) then {
    _theMap ctrlMapAnimAdd [0, DUMMY_ZOOM, DUMMY_POS];
    ctrlMapAnimCommit _theMap;
    _size = 412 * _mapSize;
    _theMap drawIcon [QUOTE(PATHTO_R(images\compass_starInverted.paa)), [1,1,1,1], DUMMY_POS, _size, _size, (-1 * (getDir ace_player)), '', 0 ];
    _theMap drawIcon [QUOTE(PATHTO_R(images\compass_needle.paa)), [0.533,0.769,0.76,1], DUMMY_POS, _size, _size, 0, '', 0 ];

    if (GVAR(currentWaypoint) != -1) then {
        _targetPos = [];
        if (GVAR(currentWaypoint) == -2) then {
            if ((count GVAR(rangeFinderPositionASL)) == 3) then {
                _targetPos = GVAR(rangeFinderPositionASL);
            };
        } else {
            if (GVAR(currentWaypoint) < (count _waypoints)) then {
                _targetPos = (_waypoints select GVAR(currentWaypoint)) select 1;
            };
        };
        if ((count _targetPos) == 3) then {
            _relBearing = [ace_player, _targetPos] call BIS_fnc_relativeDirTo;
            _theMap drawIcon [QUOTE(PATHTO_R(images\compass_needle.paa)), [1,0.564,0.564,1], DUMMY_POS, _size, _size, _relBearing, '', 0 ];
        };
    };

} else { //Map Mode:
    if (GVAR(mapAutoTrackPosition)) then {
        _theMap ctrlMapAnimAdd [0, (GVAR(mapZoom)/_mapSize), GVAR(gpsPositionASL)];
        ctrlMapAnimCommit _theMap;
    };
    _size = 32 * _mapSize;
    _theMap drawIcon [QUOTE(PATHTO_R(images\icon_self.paa)), [0.533,0.769,0.76,0.75], GVAR(gpsPositionASL), _size, _size, (getDir ace_player), '', 0 ];

    if (GVAR(settingShowAllWaypointsOnMap)) then {
        _size = 24 * _mapSize;
        {
            EXPLODE_2_PVT(_x,_wpName,_wpPos);
            _alpha = if (_forEachIndex == GVAR(currentWaypoint)) then {1} else {0.5};
            _theMap drawIcon [QUOTE(PATHTO_R(images\icon_mapWaypoints.paa)), [1,1,1,_alpha], _wpPos, _size, _size, 0, '', 0 ];
        } forEach _waypoints;
    };
};
