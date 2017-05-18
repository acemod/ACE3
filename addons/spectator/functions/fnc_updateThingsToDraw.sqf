/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used update the things to 3D draw
 *
 * Public: No
 */

#include "script_component.hpp"

#define ICON_UNIT "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa"

private _thingsToDraw = [];
private _entitiesToDraw = [];

{
    private _vehicle = vehicle _x;
    private _inVehicle = (_vehicle != _x);
    private _distanceToCamera = GVAR(camera) distance _x;

    if (_distanceToCamera <= 3000.0 && { !_inVehicle || { _x == effectiveCommander _vehicle } }) then {
        private _group = group _x;
        private _groupSide = side _group;
        private _groupName = groupId _group;
        private _groupLeader = leader _group;
        private _groupColor = [_groupSide] call BIS_fnc_sideColor;

        // Calculate distance fade
        (_distanceToCamera call {
            if (_this <= 500) exitWith {
                [1.0, 4.0, -2.5, 0.04]
            };
            if (_this <= 1000) exitWith {
                [0.75, 3.5, -2.2, 0.035]
            };
            if (_this <= 1500) exitWith {
                [0.5, 3.0, -1.9, 0.03]
            };
            if (_this <= 2000) exitWith {
                [0.3, 2.5, -1.6, 0.025]
            };
            if (_this <= 2500) exitWith {
                [0.2, 2.0, -1.3, 0.02]
            };
            [0.15, 1.5, -1.0, 0.015]
        }) params ["_fadeByDistance", "_sizeByDistance", "_heightByDistance", "_fontSizeByDistance"];

        // Apply color fade
        _groupColor set [3, _fadeByDistance];

        private _name = [_x, false, false, NAME_MAX_CHARACTERS] call EFUNC(common,getName);
        if !(isPlayer _x) then { _name = format ["%1: %2", localize "str_player_ai", _name]; };

        if (_inVehicle) then {
            private _crewCount = (({alive _x} count (crew _vehicle)) - 1);
            if (_crewCount > 0) then {
                _name = format ["%1 (+%2)", _name, _crewCount];
            };
        };

        // Show unit name only if camera is near enough
        if (_distanceToCamera < DISTANCE_NAMES) then {
            // Unit name
            _thingsToDraw pushBack [_x, 2, [
                "",
                [1,1,1,1],
                [0,0,0],
                0.0,
                _heightByDistance,
                0.0,
                _name,
                2,
                _fontSizeByDistance,
                "PuristaMedium",
                "center"
            ]];
        } else {
            if (_x == _groupLeader) then {
                // Group name
                _thingsToDraw pushBack [_x, 0, [
                    "",
                    [1,1,1,_fadeByDistance],
                    [0,0,0],
                    0.0,
                    _heightByDistance,
                    0.0,
                    _groupName,
                    2,
                    _fontSizeByDistance,
                    "PuristaMedium",
                    "center"
                ]];
            };
        };

        if (_x == _groupLeader || { _inVehicle && { _x == effectiveCommander _vehicle } }) then {
            // Group icon
            _thingsToDraw pushBack [_x, 0, [
                ICON_GROUP,
                _groupColor,
                [0,0,0],
                _sizeByDistance,
                _sizeByDistance,
                0.0,
                "",
                0,
                0.035,
                "PuristaMedium",
                "center"
            ]];
        };

        // Draw unit icon
        _thingsToDraw pushBack [_x, 1, [
            [ICON_UNIT, ICON_REVIVE] select (NEEDS_REVIVE(_x)),
            _groupColor,
            [0,0,0],
            _sizeByDistance,
            _sizeByDistance,
            0.0,
            "",
            0.0,
            0.035,
            "PuristaMedium",
            "center"
        ]];
    };

    // Track entities themselves for use with fired EH
    _entitiesToDraw pushBack _x;

    // Add fired EH for drawing and icon highlighting
    if (GETVAR(_x,GVAR(firedEH),-1) == -1) then {
        SETVAR(_x,GVAR(firedEH),_x addEventHandler [ARR_2("Fired",{_this call FUNC(handleFired)})]);
    };

    nil // Speed loop
} count ([] call FUNC(getTargetEntities));

GVAR(thingsToDraw) = _thingsToDraw;
GVAR(entitiesToDraw) = _entitiesToDraw;
