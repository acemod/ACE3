#include "script_component.hpp"
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

TRACE_1("transmitterInit",_this);

// MouseMoving EH.
["MouseMoving", {
    // Don't transmit any data if we're using the map tools
    if (!GVAR(EnableTransmit) || {(["ace_maptools"] call EFUNC(common,isModLoaded)) && {EGVAR(maptools,mapTool_isDragging) || EGVAR(maptools,mapTool_isRotating)}}) exitWith {};

    params ["_control", "_posX", "_posY"];
    if (!(ACE_player getVariable QGVAR(Transmit))) then {
        ACE_player setVariable [QGVAR(Transmit), true, true];
    };

    GVAR(pointPosition) = _control ctrlMapScreenToWorld [_posX, _posY];
}, true] call EFUNC(common,addMapEventHandler);

// MouseDown EH
["MouseButtonDown", {
    if (!GVAR(enabled)) exitWith {};

    params ["", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

    if (_button == 0 && {[_shift, _ctrl, _alt] isEqualTo [false, false, false]}) then {
        call FUNC(initTransmit);
    };
}, true] call EFUNC(common,addMapEventHandler);

// MouseUp EH
["MouseButtonUp", {
    if (!GVAR(enabled)) exitWith {};

    params ["", "_button"];

    if (_button == 0) then {
        call FUNC(endTransmit);
    };
}, true] call EFUNC(common,addMapEventHandler);
