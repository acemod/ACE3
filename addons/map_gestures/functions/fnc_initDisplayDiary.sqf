#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix, joko // Jonas
 * Bind all required EventHandlers to Player map.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * _mapCtrl call ace_map_gestures_fnc_initDisplayDiary
 *
 * Public: No
 */
params ["_mapCtrl"];
TRACE_1("initDisplayDiary",_mapCtrl);

_mapCtrl ctrlAddEventHandler ["Draw", { [_this select 0, [ACE_player]] call FUNC(drawMapGestures); }];

// MouseMoving EH.
_mapCtrl ctrlAddEventHandler ["MouseMoving", {
    if (!GVAR(enabled)) exitWith {};
    params ["_control", "_posX", "_posY"];
    private _position = _control ctrlMapScreenToWorld [_posX, _posY];
    GVAR(cursorPosition) = _position;
    // Don't transmit any data if we're using the map tools
    if (!GVAR(EnableTransmit) || {(["ace_maptools"] call EFUNC(common,isModLoaded)) && {EGVAR(maptools,mapTool_isDragging) || EGVAR(maptools,mapTool_isRotating)}}) exitWith {};
    if (_position distance2D (ACE_player getVariable [QGVAR(pointPosition), [0, 0, 0]]) >= 1) then {
        [ACE_player, QGVAR(pointPosition), _position, GVAR(interval)] call EFUNC(common,setVariablePublic);
    };
}];

// MouseDown EH
_mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    if (getClientStateNumber < 10) exitWith {};
    if (!GVAR(enabled)) exitWith {};
        params ["", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];
        if (_button == 0 && {[_shift, _ctrl, _alt] isEqualTo [false, false, false]}) then {
            GVAR(EnableTransmit) = true;
        };
}];

// MouseUp EH
_mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    if (getClientStateNumber < 10) exitWith {};
    if (!GVAR(enabled)) exitWith {};
    params ["", "_button"];
    if (_button == 0) then {
        GVAR(EnableTransmit) = false;
        ACE_player setVariable [QGVAR(pointPosition), nil, true]; // Instantly transmit nil to stop drawing icon
        GVAR(cursorPosition) = nil;
    };
}];
