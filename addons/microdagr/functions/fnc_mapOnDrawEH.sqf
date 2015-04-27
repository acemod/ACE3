/*
 * Author: PabstMirror
 * Handles the draw event from all 3 maps (compass + 2 minimaps)
 *
 * Arguments:
 * 0: The Map <CONTROL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [compassMap] call ace_microdagr_fnc_mapOnDrawEH
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_theMap);

private ["_mapSize", "_waypoints", "_size", "_targetPos", "_relBearing", "_wpName", "_wpPos", "_alpha"];

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
        _theMap ctrlMapAnimAdd [0, (GVAR(mapZoom)/_mapSize), (getPosASL ace_player)];
        ctrlMapAnimCommit _theMap;
    };
    _size = 48 * _mapSize;
    _theMap drawIcon [QUOTE(PATHTO_R(images\icon_self.paa)), [0.533,0.769,0.76,0.75], (getPosASL ace_player), _size, _size, (getDir ace_player), '', 0 ];

    if (GVAR(settingShowAllWaypointsOnMap)) then {
        _size = 32 * _mapSize;
        {
            EXPLODE_2_PVT(_x,_wpName,_wpPos);
            _alpha = if (_forEachIndex == GVAR(currentWaypoint)) then {1} else {0.5};
            _theMap drawIcon [QUOTE(PATHTO_R(images\icon_mapWaypoints.paa)), [1,1,1,_alpha], _wpPos, _size, _size, 0, '', 0 ];
        } forEach _waypoints;
    };
};
