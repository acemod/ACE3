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
 * [] call ace_map_gestures_fnc_bindEventHandler
 *
 * Public: No
 */

private _mapCtrl = (findDisplay 12) displayCtrl 51;

if (!isNil QGVAR(DrawMapHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["Draw", GVAR(DrawMapHandlerID)];
    GVAR(DrawMapHandlerID) = nil;
};
GVAR(DrawMapHandlerID) = _mapCtrl ctrlAddEventHandler ["Draw", {[_this select 0, ACE_player] call FUNC(drawMapGestures)}];


// MouseMoving EH.
if (!isNil QGVAR(MouseMoveHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["MouseMoving", GVAR(MouseMoveHandlerID)];
    GVAR(MouseMoveHandlerID) = nil;
};

GVAR(MouseMoveHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseMoving", {
    // Don't transmit any data if we're using the map tools
    if (!GVAR(EnableTransmit) || {(["ace_maptools"] call EFUNC(common,isModLoaded)) && {EGVAR(maptools,mapTool_isDragging) || EGVAR(maptools,mapTool_isRotating)}}) exitWith {};

    params ["_control", "_posX", "_posY"];
    private _position = _control ctrlMapScreenToWorld [_posX, _posY];
    if (_position distance2D GVAR(pointPosition) > 1) then { // Only transmit when actually moving
        [ACE_player, QGVAR(pointPosition), _position, GVAR(interval)] call EFUNC(common,setVariablePublic);
    };
    GVAR(pointPosition) = _position;
}];

// MouseDown EH
if (!isNil QGVAR(MouseDownHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["MouseButtonDown",GVAR(MouseDownHandlerID)];
    GVAR(MouseDownHandlerID) = nil;
};

GVAR(MouseDownHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    if (!GVAR(enabled)) exitWith {};
        params ["", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];
        if (_button == 0 && {[_shift, _ctrl, _alt] isEqualTo [false, false, false]}) then {
            GVAR(EnableTransmit) = true;
        };
}];

// MouseUp EH
if (!isNil QGVAR(MouseUpHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["MouseButtonUp", GVAR(MouseUpHandlerID)];
    GVAR(MouseUpHandlerID) = nil;
};

GVAR(MouseUpHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    if (!GVAR(enabled)) exitWith {};
    params ["", "_button"];
    if (_button == 0) then {
        GVAR(EnableTransmit) = false;
        ACE_player setVariable [QGVAR(pointPosition), nil, true];
    };
}];
