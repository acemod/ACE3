/*
 * Author: Nelson Duarte, AACO
 * Function used to handle map draw
 *
 * Arguments:
 * 0: Map control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleMapDraw
 *
 * Public: No
 */

#include "script_component.hpp"
#define MAP_MIN_ENTITY_DISTANCE 30

// Moved timer into map controls group, update here
CTRL_TIME ctrlSetText (["+", [time / 3600] call BIS_fnc_timeToString] joinString "");

BEGIN_COUNTER(drawMap);

params ["_map"];

// Track nearest unit
private _loc = _map ctrlMapScreenToWorld getMousePosition;
private _nearestEntity = objNull;
private _minDist = 999999;

// Draw unit icons
private _handledVehicles = [];
{
    private _dist = _x distance2D _loc;

    if (_dist < _minDist && { _dist < MAP_MIN_ENTITY_DISTANCE }) then {
        _minDist = _dist;
        _nearestEntity = _x;
    };

    private _vehicle = vehicle _x;
    if !(_vehicle in _handledVehicles) then {
        _handledVehicles pushBack _vehicle;

        private _vehicleTexture = [_vehicle] call EFUNC(common,getVehicleIcon);
        private _sideColor = [side group _vehicle] call BIS_fnc_sideColor;
        private _text = "";

        if (GVAR(uiMapHighlighted) == _vehicle || {GVAR(uiMapHighlighted) in _vehicle}) then {
            _text = ([GVAR(uiMapHighlighted)] call EFUNC(common,getName)) select [0, NAME_MAX_CHARACTERS];
            if !(isPlayer GVAR(uiMapHighlighted)) then { _text = format ["%1: %2", localize "str_player_ai", _text]; };
            _sideColor = [0.8, 0.8, 0.5, 1];
        };

        if (NEEDS_REVIVE(_vehicle)) then {
            _vehicleTexture = ICON_REVIVE;
            _sideColor = [0.5, 0, 0, 1];
        };

        if (time <= _vehicle getVariable [QGVAR(highlightTime), 0]) then {
            _sideColor = [1, 1, 1, 1];
        };

        _map drawIcon [_vehicleTexture, _sideColor, getPosASLVisual _vehicle, 24, 24, getDirVisual _vehicle, _text, 1, 0.04, "TahomaB", "right"];
    };
} forEach ([] call FUNC(getTargetEntities));

// Set highlighted unit
private _text = if (isNull _nearestEntity) then {
    ""
} else {
    format ["%1 [%2 m]", [_nearestEntity] call EFUNC(common,getName), round (_nearestEntity distance2D GVAR(camera))]
};

GVAR(uiMapHighlighted) = _nearestEntity;
CTRL_MAP_FOOTER ctrlSetText _text;

// Draw camera icon
if !(isNil QGVAR(camera)) then {
    private _cameraPos = getPosASLVisual GVAR(camera);
    private _cameraDir = getDirVisual GVAR(camera);
    _map drawIcon [ICON_CAMERA, [0.5, 1, 0.5, 1], _cameraPos, 32, 48, _cameraDir, "", 1, 0.05, "TahomaB", "right"];
    _map drawArrow [_cameraPos, (_cameraPos getPos [300, _cameraDir]), [0.5, 1, 0.5, 1]];
};

END_COUNTER(drawMap);
