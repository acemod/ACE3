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

_mapCtrl ctrlAddEventHandler ["Draw", {
    if (!GVAR(enabled)) exitWith {};
    if (getClientStateNumber < 10) then {
        [_this select 0, GVAR(briefingMode)] call FUNC(drawMapGestures);
    } else {
        [_this select 0, [[ACE_player, GVAR(maxRange)]]] call FUNC(drawMapGestures);
    };
}];

// MouseMoving EH.
_mapCtrl ctrlAddEventHandler ["MouseMoving", {
    if (!GVAR(enabled)) exitWith {};
    params ["_control", "_posX", "_posY"];
    GVAR(cursorPosition) = _control ctrlMapScreenToWorld [_posX, _posY];

    // Don't transmit any data if we're using the map tools
    if (!GVAR(EnableTransmit) || {(["ace_maptools"] call EFUNC(common,isModLoaded)) && {EGVAR(maptools,mapTool_isDragging) || EGVAR(maptools,mapTool_isRotating)}}) exitWith {};
    if (GVAR(cursorPosition) distance2D (ACE_player getVariable [QGVAR(pointPosition), [0, 0, 0]]) >= 1) then {
        [ACE_player, QGVAR(pointPosition), GVAR(cursorPosition), GVAR(interval)] call EFUNC(common,setVariablePublic);
    };
}];

// MouseDown EH
_mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    if (!GVAR(enabled)) exitWith {};
        params ["", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];
        if (_button == 0 && {[_shift, _ctrl, _alt] isEqualTo [false, false, false]}) then {
            GVAR(EnableTransmit) = true;
            [ACE_player, QGVAR(pointPosition), GVAR(cursorPosition), GVAR(interval)] call EFUNC(common,setVariablePublic);
        };
}];

// MouseUp EH
_mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    if (!GVAR(enabled)) exitWith {};
    params ["", "_button"];
    if (_button == 0) then {
        GVAR(EnableTransmit) = false;
        ACE_player setVariable [QGVAR(pointPosition), nil, true]; // Instantly transmit nil to stop drawing icon
    };
}];
