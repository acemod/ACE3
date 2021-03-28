#include "script_component.hpp"
/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used update the things to 3D draw
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Examples:
 * [] call ace_spectator_fnc_ui_updateIconsToDraw
 *
 * Public: No
 */

private _iconsToDraw = [];
private _entitiesToDraw = [];

// camToWorld is used instead of camera object to account for FPP
private _camPos = AGLToASL positionCameraToWorld [0,0,0];
{
    private _vehicle = vehicle _x;
    private _inVehicle = (_vehicle != _x);
    private _distanceToCameraSqr = _camPos distanceSqr _x;

    if (_distanceToCameraSqr <= DISTANCE_ICONS_SQR && { !_inVehicle || { _x == effectiveCommander _vehicle } }) then {
        private _group = group _x;
        private _isLeader = _x == leader _group;
        private _groupColor = [side _group] call BIS_fnc_sideColor;

        // Calculate distance fade
        (_distanceToCameraSqr call {
            if (_this <= 250000) exitWith { // 500^2
                [1, 4, -2.5, 0.04]
            };
            if (_this <= 1000000) exitWith { // 1000^2
                [0.75, 3.5, -2.2, 0.035]
            };
            if (_this <= 2250000) exitWith { // 1500^2
                [0.5, 3, -1.9, 0.03]
            };
            if (_this <= 4000000) exitWith { // 2000^2
                [0.3, 2.5, -1.6, 0.025]
            };
            if (_this <= 6250000) exitWith { // 2500^2
                [0.2, 2, -1.3, 0.02]
            };
            [0.15, 1.5, -1, 0.015]
        }) params ["_fadeByDistance", "_sizeByDistance", "_heightByDistance", "_fontSizeByDistance"];

        // Apply color fade
        _groupColor set [3, _fadeByDistance];

        // Show unit name only if camera is near enough
        if (_distanceToCameraSqr < DISTANCE_NAMES_SQR) then {
            private _name = ([_x] call EFUNC(common,getName)) select [0, NAME_MAX_CHARACTERS];
            if !(isPlayer _x) then { _name = format ["%1: %2", localize "str_player_ai", _name]; };

            if (_inVehicle) then {
                private _crewCount = (({alive _x} count (crew _vehicle)) - 1);
                if (_crewCount > 0) then {
                    _name = format ["%1 (+%2)", _name, _crewCount];
                };
            };

            // Draw unit name for effective commander or all units on foot
            _iconsToDraw pushBack [_x, 2, [
                "",
                [1,1,1,1],
                [0,0,0],
                0,
                _heightByDistance,
                0,
                _name,
                2,
                _fontSizeByDistance,
                "PuristaMedium",
                "center"
            ]];
        } else {
            // Draw group name for effective commander or leader on foot
            if (_inVehicle || _isLeader) then {
                _iconsToDraw pushBack [_x, 0, [
                    "",
                    [1,1,1,_fadeByDistance],
                    [0,0,0],
                    0,
                    _heightByDistance,
                    0,
                    groupID _group,
                    2,
                    _fontSizeByDistance,
                    "PuristaMedium",
                    "center"
                ]];
            };
        };

        // Draw group icon for effective commander or leader on foot
        if (_inVehicle || _isLeader) then {
            _iconsToDraw pushBack [_x, 0, [
                [_group, true] call FUNC(getGroupIcon),
                _groupColor,
                [0,0,0],
                _sizeByDistance,
                _sizeByDistance,
                0,
                "",
                0,
                0.035,
                "PuristaMedium",
                "center"
            ]];
        };

        // Draw unit icon for effective commander or all units on foot
        _iconsToDraw pushBack [_x, 1, [
            [ICON_UNIT, ICON_REVIVE] select (NEEDS_REVIVE(_x)),
            _groupColor,
            [0,0,0],
            _sizeByDistance,
            _sizeByDistance,
            0,
            "",
            0,
            0.035,
            "PuristaMedium",
            "center"
        ]];

        // Track entities themselves for use with fired EH
        _entitiesToDraw pushBack _vehicle;

        // Add fired EH for drawing and icon highlighting
        if (GETVAR(_vehicle,GVAR(firedEH),-1) == -1) then {
            SETVAR(_vehicle,GVAR(firedEH),_vehicle addEventHandler [ARR_2("Fired",{_this call FUNC(handleFired)})]);
        };
    };
} forEach ([] call FUNC(getTargetEntities));

GVAR(iconsToDraw) = _iconsToDraw;
GVAR(entitiesToDraw) = _entitiesToDraw;
