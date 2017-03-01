/*
 * Author: PabstMirror
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: The souce object <OBJECT>
 * 1: Code to run when position is ready <CODE>
 * - Code is passed [Successful <BOOL>, Object <OBJECT>, Position ASL <ARRAY>]
 * 2: Text <STRING><OPTIONAL>
 * 3: Icon image file <STRING><OPTIONAL>
 * 4: Icon color <ARRAY><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, {systemChat format ["Done %1", _this]}] call ace_zeus_fnc_getModuleDestination
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_code", ["_text", ""], ["_icon", "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa"], ["_color", [1,0,0,1]]];

if (missionNamespace getVariable [QGVAR(moduleDestination_running), false]) exitWith {ERROR("already running");};

// if (ctrlShown ((findDisplay 312) displayCtrl 50)) exitWith {
// systemChat "xxx";
// };

GVAR(moduleDestination_running) = true;
GVAR(moduleDestination_displayEH) = [(findDisplay 312), "mouseButtonDown", {
    params ["", "_mouseButton"];
    if (_mouseButton == 0) then {
        _thisArgs params ["_object", "_code"];
        private _mousePosASL = if (ctrlShown ((findDisplay 312) displayCtrl 50)) then {
            private _pos2d = (((findDisplay 312) displayCtrl 50) ctrlMapScreenToWorld getMousePosition);
            _pos2d set [2, getTerrainHeightASL _pos2d];
            _pos2d
        } else {
            AGLToASL (screenToWorld getMousePosition);
        };
        TRACE_2("placed",_object,_mousePosASL);
        [true, _object, _mousePosASL] call _code;
        GVAR(moduleDestination_running) = false;
    };
}, [_object, _code]] call CBA_fnc_addBISEventHandler;

GVAR(moduleDestination_mapDrawEH) = [((findDisplay 312) displayCtrl 50), "draw", {
    params ["_mapCtrl", "_mouseButton"];
    _thisArgs params ["_object", "_text", "_icon", "_color"];
    private _pos2d = (((findDisplay 312) displayCtrl 50) ctrlMapScreenToWorld getMousePosition);
    _mapCtrl drawIcon [_icon,_color,_pos2d,24,24,45,_text,1,0.03,'TahomaB','right'];
    _mapCtrl drawLine [getPos _object, _pos2d, _color];
}, [_object, _text, _icon, _color]] call CBA_fnc_addBISEventHandler;

[{
    (_this select 0) params ["_object", "_code", "_icon", "_color"];
    if ((isNull _object) || {isNull findDisplay 312}) then {
        TRACE_2("null-exit",isNull _object,isNull findDisplay 312);
        GVAR(moduleDestination_running) = false;
        [false, _object, [0,0,0]] call _code;
    };
    if (GVAR(moduleDestination_running)) then {
        private _mousePosAGL = screenToWorld getMousePosition;
        drawIcon3D [_icon, _color, _mousePosAGL, 1.5, 1.5, 45, "Left Click"];
        drawLine3D [_mousePosAGL, ASLtoAGL (getPosASL _object), _color];;
    } else {
        TRACE_2("cleaning up",_this select 1, GVAR(moduleDestination_displayEH));
        (_this select 1) call CBA_fnc_removePerFrameHandler;
        (findDisplay 312) displayRemoveEventHandler ["mouseButtonDown", GVAR(moduleDestination_displayEH)];
        ((findDisplay 312) displayCtrl 50) ctrlRemoveEventHandler ["draw", GVAR(moduleDestination_mapDrawEH)];
    };
}, 0, [_object, _code, _icon, _color]] call CBA_fnc_addPerFrameHandler;
