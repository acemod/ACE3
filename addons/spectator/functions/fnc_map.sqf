/*
    Author:
    voiper

    Description:
    Manage spectator map.

    Arguments:
    0: Mode <String>
    1: Elements (depending on situation) <Array>

    Example:
    ["Init", [map]] call ace_spectator_fnc_map;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

_mode = _this select 0;
_this = _this select 1;

switch _mode do {

    case "Init": {
        _map = _this displayCtrl 1;

        if (isNil QGVAR(mapPos)) then {
            GVAR(mapPos) = (getPosASL GVAR(cam)) select [0,2];
        };

        if (isNil QGVAR(mapZoom)) then {
            GVAR(mapZoom) = 0.75;
        };

        _map ctrlMapAnimAdd [0, GVAR(mapZoom), GVAR(mapPos)];
        ctrlMapAnimCommit _map;
        setMousePosition [0.5, 0.5];

        _map ctrlAddEventHandler ["Draw", {['Draw', _this] call FUNC(map)}];
        _map ctrlAddEventHandler ["MouseButtonDblClick", {['Click', _this] call FUNC(map)}];
    };

    case "Close": {
        _map = _this displayCtrl 1;
        GVAR(mapPos) = _map ctrlMapScreenToWorld [0.5,0.5];
        GVAR(mapZoom) = ctrlMapScale _map;
    };

    case "Draw": {
        _map = _this select 0;
        _zoom = ctrlMapScale _map;

        if (GVAR(markers) > 0) then {
            if ((GVAR(markers) > 2) && GVAR(tracking)) then {
                [_map, _zoom] call FUNC(drawTracks2D);
            };
            [_map, _zoom] call FUNC(drawMines2D);
            [_map, _zoom] call FUNC(drawUnits2D);
        };

        if (GVAR(cameraOn)) then {
            _scale = 5 * safeZoneH / 100;
            _map drawIcon ["\A3\ui_f\data\gui\Rsc\RscDisplayMissionEditor\iconcamera_ca.paa", [1,1,1,1], getPos GVAR(cam), 500 * _scale, 500 * _scale, getDir GVAR(cam), "", 0, 0, "PuristaMedium"];
        };
    };

    case "Click": {
        _map = _this select 0;
        _button = _this select 1;
        _shift = _this select 4;
        _mapPos = _map ctrlMapScreenToWorld [_this select 2, _this select 3];

        if (_shift) then {
            if (GVAR(cameraOn)) then {
                _dir = [getPos GVAR(cam), _mapPos] call BIS_fnc_dirTo;
                GVAR(vector) set [0, _dir];
                [GVAR(cam), GVAR(vector)] call BIS_fnc_setObjectRotation;
            };
        } else {

            _newUnit = objNull;

            _scale = ctrlMapScale _map;
            _radius = _scale * 250;
            _units = [];

            //find units near spot, ignoring height (necessary since nearestObjects takes height into account)
            {
                if (alive _x) then {
                    _pos = getPos _x;
                    _pos set [2, 0];
                    if (_pos distance _mapPos <= _radius) then {
                        _units pushBack _x;
                    };
                };
            } forEach GVAR(units);

            //find closest unit to spot
            if (count _units > 0) then {
                _nearest = 0;
                for "_i" from 1 to (count _units - 1) do {
                    if (((_units select _i) distance _mapPos) < ((_units select _nearest) distance _mapPos)) then {
                        _nearest = _i;
                    };
                };
                _newUnit = _units select _nearest;
            };

            if (!isNull _newUnit) then {

                if (vehicle _newUnit != _newUnit) then {
                    _crew = crew (vehicle _newUnit);
                    _newUnit = _crew select 0;
                };

                GVAR(unit) = _newUnit;
                if (GVAR(cameraOn)) then {
                    ["Camera", ["Third"]] call FUNC(camera);
                } else {
                    if (GVAR(third)) then {
                        ["Camera", ["Third"]] call FUNC(camera);
                    } else {
                        ["Camera", ["First"]] call FUNC(camera);
                    };
                };
            } else {

                if (!GVAR(cameraOn)) then {
                    ["Camera", ["Free"]] call FUNC(camera);
                };
                _mapPos set [2, 10];
                GVAR(cam) setPosATL _mapPos;
            };
        };
    };

    case "KeyDown": {
        _key = _this select 1;
        _shift = _this select 2;
        _ctrl = _this select 3;
        _alt = _this select 4;
        _return = false;

        switch (_key) do {
            case (DIK_DELETE): {_return = true};
        };

        _return
    };
};
