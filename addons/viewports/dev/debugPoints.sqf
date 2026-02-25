#include "..\script_component.hpp"
/*
    [] call compileScript ["\z\ace\addons\viewports\dev\debugPoints.sqf"];

    This is mostly just for placing the mem points in threeden
    left-click to place and adjust current point
    alt+left-click to place next point
    alt+right-click to output
    shift+right-click to reset

    // Tweak:
    z = (vehicle player) getVariable "ace_viewports_viewports";
    p = z # 0 # 4; z # 0 set [4, p vectorAdd [0,0.1,0]];

    // Place by view:
    v = (positionCameraToWorld [0,0,0.4]);
    m = (vehicle player) worldToModel v;
    z = (vehicle player) getVariable "ace_viewports_viewports";
    z # 0 set [4, m];
*/

#define IDD_3DEN 313

[] spawn {
    INFO_2("Pre-Init [is3den %1][3den display: %2]",is3DEN,!isNull findDisplay IDD_3DEN);
    if (!is3DEN) exitWith {};

    GVAR(3denIndex) = 0;
    GVAR(3denViewports) = [];

    disableSerialization;
    private _3den = findDisplay IDD_3DEN;
    if (_3den getVariable [QGVAR(setup), false]) exitWith {};
    _3den setVariable [QGVAR(setup), true];

    _3den displayAddEventHandler ["MouseButtonDown", {
        params ["", "_button", "_mouseX", "_mouseY", "_shift", "_ctrl", "_alt"];

        if (_shift && _button == 1) exitWith {
            systemChat "Reset/Reload";
            if ((supportInfo "u:diag_mergeConfigFile") isNotEqualTo []) then {
                call compile 'diag_mergeConfigFile ["P:\z\ace\addons\viewports\config.cpp"]';
            };
            GVAR(viewports) = createHashMap;
            GVAR(3denIndex) = 0;
            GVAR(3denViewports) = [];
            true
        };

        if (_alt) then {
            if (count GVAR(3denViewports) > GVAR(3denIndex)) then {
                systemChat "Advance to next index";
                GVAR(3denIndex) = GVAR(3denIndex) + 1;
            };
        };
        if (_alt && _button == 1) exitWith {
            private _vehicle = (get3DENSelected "object") param [0, objNull];
            private _config = configOf _vehicle;
            private _model = getText (_config >> "model");
            while {true} do {
                private _parent = inheritsFrom _config;
                if ((getText (_parent >> "model")) != _model) exitWith {};
                _config = _parent;
            };

            private _out = [];
            _out pushBack format ["    class %1: %2 {", configName _config, configName inheritsFrom _config];
            _out pushBack format ["        class ace_viewports {"];
            {
                _x params ["_name", "", "_camLocation", "_camAttach"];
                _out pushBack format ['            class %1 {', _name];
                _out pushBack format ['                camLocation[] = {%1, %2, %3};', _camLocation # 0, _camLocation # 1, _camLocation # 2];
                _out pushBack format ['                camAttach = %1;', _camAttach];
                // _out pushBack format ['                type = "%1";', _type];
                // _out pushBack format ['                screenLocation[] = {};'];
                // _out pushBack format ['                maxDistance = 99;'];
                // _out pushBack format ['                compartments[]={};'];
                // _out pushBack format ['                roles[]={};'];
               _out pushBack format ['            };'];
            } forEach GVAR(3denViewports);

            _out pushBack format ['        };'];
            _out pushBack format ['    };'];

            // Some inherited configs might use a different model which uses a different offset - yuck
            private _inherited = '((configName _x) isKindOf (configName _config)) && {_model != getText (_x >> "model")}' configClasses (configFile >> "CfgVehicles");
            _out pushBack format ["// Watch out for %1", _inherited apply {configName _x}];

            copyToClipboard (_out joinString endl);
            systemChat format ["copied %1 lines", count _out];
        };
        if (_button == 0) exitWith {
            private _vehicle = (get3DENSelected "object") param [0, objNull];
            if (isNull _vehicle) exitWith {};

            private _start = AGLToASL positionCameraToWorld [0,0,0];
            private _end = AGLToASL screenToWorld [_mouseX, _mouseY];
            private _intersections = lineIntersectsSurfaces [_start, _end];
            private _pointASL = _intersections # 0 # 0;
            if (isNil "_pointASL") exitWith {};
            _pointASL = _pointASL vectorAdd [0,0,0.09]; // Add a little bit up because it always sinks into the model
            private _pointMS = _vehicle worldToModel ASLToAGL _pointASL;

            private _name = format ["view_%1",GVAR(3denIndex)];
            // [_name, _type, _camLocation, _camAttach, _screenLocation, _maxDistance, _compartments, _roles]
            GVAR(3denViewports) set [GVAR(3denIndex), [_name, "", _pointMS, 0, _pointMS, 99, [], []]];
            true
        };
    }];
};

// this runs in both threeden and in-game
addMissionEventHandler ["Draw3D", {
    private _vehicle = if (is3DEN) then {
        (get3DENSelected "object") param [0, objNull]
    } else {
        vehicle player
    };

    if (isNull _vehicle) exitWith {};

    private _viewports = if (is3DEN && {GVAR(3denViewports) isNotEqualTo []}) then {
        GVAR(3denViewports)
    } else {
        _vehicle call FUNC(getViewports)
    };

    drawIcon3D ["#(argb,8,8,3)color(1,1,1,1)", [1,1,0,1], _vehicle modelToWorldVisual [0,0,0], 0.1, 0.1, 0, "", 1, 0.02, "TahomaB"];
    if (alive player) then { // not using ace_player so this works in 3den
        drawIcon3D ["#(argb,8,8,3)color(1,1,1,1)", [0,1,0,1], ASLToAGL eyePos player, 0.1, 0.1, 0, "eye", 1, 0.02, "TahomaB"];
        drawIcon3D ["#(argb,8,8,3)color(1,1,1,1)", [0,1,0,1], player modelToWorldVisual (player selectionPosition "pilot"), 0.1, 0.1, 0, "pilot", 1, 0.02, "TahomaB"];
    };
    // {
    //     private _pos = _vehicle modelToWorldVisual (_vehicle selectionPosition [_x, "Memory"]);
    //     drawIcon3D ["#(argb,8,8,3)color(1,1,1,1)", [0,0,1,0.2], _pos, 0.05, 0.05, 0, _x, 1, 0.02, "TahomaB"];
    // } forEach (_vehicle selectionNames "Memory");


    {
        _x params ["_name", "_type", "_camLocation", "_camAttach", "_screenLocation", "_maxDistance", "_compartments", "_roles"];

        if (_camLocation isEqualType "") then {
            _camLocation = _vehicle selectionPosition [_camLocation, "Memory"];
        };

        private _screenAGL = _vehicle modelToWorldVisual _screenLocation;
        drawIcon3D ["#(argb,8,8,3)color(0,0,1,1)", [1,0.5,1,1], _screenAGL, 0.05, 0.05, 0, format ["%1:%2",_forEachIndex,_compartments], 1, 0.03, "TahomaB"];

        private _camAGL = if (_camAttach isEqualType 0) then {
             _vehicle modelToWorldVisual _camLocation
        } else {
            private _turretConfig = [_vehicle, _camAttach] call CBA_fnc_getTurret;
            private _memoryPointGunnerOptics = getText(_turretConfig >> "memoryPointGunnerOptics");
            _vehicle modelToWorldVisual (_camLocation vectorAdd (_vehicle selectionPosition _memoryPointGunnerOptics))
        };
        drawIcon3D ["#(argb,8,8,3)color(1,0,0,1)", [0.5,1,1,1], _camAGL, 0.1, 0.1, 0, format ["%1:%2",_forEachIndex,_name], 1, 0.03, "TahomaB"];

        if (_camAttach isEqualType 0) then {
            private _camAGL = _vehicle modelToWorldVisual _camLocation;
            drawIcon3D ["#(argb,8,8,3)color(1,0,0,1)", [1,1,1,1], _camAGL, 0.1, 0.1, 0, _name, 1, 0.05, "TahomaB"];
            private _target = _vehicle modelToWorldVisual (_camLocation vectorAdd ([1, _camAttach, 0] call CBA_fnc_polar2vect));
            drawLine3D [_camAGL, _target, [0,1,0,1]];
            private _target = _vehicle modelToWorldVisual (_camLocation vectorAdd ([1, _camAttach, 1] call CBA_fnc_polar2vect));
            drawLine3D [_camAGL, _target, [0,1,0,1]];
            private _target = _vehicle modelToWorldVisual (_camLocation vectorAdd ([1, _camAttach, -1] call CBA_fnc_polar2vect));
            drawLine3D [_camAGL, _target, [0,1,0,1]];
            private _target = _vehicle modelToWorldVisual (_camLocation vectorAdd ([0.2, _camAttach+90, 0] call CBA_fnc_polar2vect));
            drawLine3D [_camAGL, _target, [1,0,1,1]];
            private _target = _vehicle modelToWorldVisual (_camLocation vectorAdd ([0.2, _camAttach-90, 0] call CBA_fnc_polar2vect));
            drawLine3D [_camAGL, _target, [1,0,1.2,1]];
        };
    } forEach _viewports;
}];
