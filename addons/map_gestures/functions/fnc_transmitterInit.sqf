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

private ["_mapCtrl", "_nameSane"];

disableSerialization;

_mapCtrl = findDisplay 12 displayCtrl 51;

// MouseMoving EH.
if (!isNil QGVAR(MouseMoveHandlerID)) then {_mapCtrl ctrlRemoveEventHandler ["MouseMoving", GVAR(MouseMoveHandlerID)]; GVAR(MouseMoveHandlerID) = nil;};
GVAR(MouseMoveHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseMoving", {
    if (EGVAR(maptools,drawing_isDrawing)) exitWith {};
    if (EGVAR(maptools,mapTool_isDragging)) exitWith {};
    if (EGVAR(maptools,mapTool_isRotating)) exitWith {};

    params ["_control", "_posX", "_posY"];

    if (GVAR(EnableTransmit)) then {
        if (!(ACE_player getVariable QGVAR(Transmit))) then {
            ACE_player setVariable [QGVAR(Transmit), true, true];
        };

        _nameSane = [name ACE_player] call FUNC(sanitizeName);
        call compile format [QUOTE(GVAR(%1_DrawPos) = %2), _nameSane, _control ctrlMapScreenToWorld [_posX, _posY]];
    };
}];

// MouseDown EH
if (!isNil QGVAR(MouseDownHandlerID)) then {_mapCtrl ctrlRemoveEventHandler ["MouseButtonDown",GVAR(MouseDownHandlerID)]; GVAR(MouseDownHandlerID) = nil;};
GVAR(MouseDownHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    if (!GVAR(enabled)) exitWith {};

    params ["", "_button"];

    if (_button == 0) then {call FUNC(initTransmit);};
}];

// MouseUp EH
if (!isNil QGVAR(MouseUpHandlerID)) then {_mapCtrl ctrlRemoveEventHandler ["MouseButtonUp", GVAR(MouseUpHandlerID)]; GVAR(MouseUpHandlerID) = nil;};
GVAR(MouseUpHandlerID) = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    params ["", "_button"];

    if (_button == 0) then {call FUNC(endTransmit);};
}];
