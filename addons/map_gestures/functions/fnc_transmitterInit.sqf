/*
 * Author: Dslyecxi, MikeMatrix
 * Initializes the transmitting event handlers.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_map_gestures_fnc_transmitterInit
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

private _mapCtrl = findDisplay 12 displayCtrl 51;

// MouseMoving EH.
if (!isNil QGVAR(MouseMoveHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["MouseMoving", GVAR(MouseMoveHandlerID)];
    GVAR(MouseMoveHandlerID) = nil;
};
GVAR(MouseMoveHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseMoving", {
    // Don't transmit any data if we're using the map tools
    if (!GVAR(EnableTransmit) || {(["ace_maptools"] call EFUNC(common,isModLoaded)) && {EGVAR(maptools,mapTool_isDragging) || EGVAR(maptools,mapTool_isRotating)}}) exitWith {};

    params ["_control", "_posX", "_posY"];

    if (!(ACE_player getVariable QGVAR(Transmit))) then {
        ACE_player setVariable [QGVAR(Transmit), true, true];
    };

    GVAR(pointPosition) = _control ctrlMapScreenToWorld [_posX, _posY];
}];

// MouseDown EH
if (!isNil QGVAR(MouseDownHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["MouseButtonDown",GVAR(MouseDownHandlerID)];
    GVAR(MouseDownHandlerID) = nil;
};
GVAR(MouseDownHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    if (!GVAR(enabled)) exitWith {};

    params ["", "_button"];

    if (_button == 0) then {call FUNC(initTransmit);};
}];

// MouseUp EH
if (!isNil QGVAR(MouseUpHandlerID)) then {
    _mapCtrl ctrlRemoveEventHandler ["MouseButtonUp", GVAR(MouseUpHandlerID)];
    GVAR(MouseUpHandlerID) = nil;
};
GVAR(MouseUpHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    if (!GVAR(enabled)) exitWith {};

    params ["", "_button"];

    if (_button == 0) then {call FUNC(endTransmit);};
}];
