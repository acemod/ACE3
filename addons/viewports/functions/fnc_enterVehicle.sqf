#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handle playerEH for new changing vehicle, check if it has any viewports and start PFEH
 *
 * Arguments:
 * 0: player <OBJECT>
 * 1: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player] call ace_viewports_fnc_enterVehicle
 *
 * Public: No
 */

params ["_player", "_vehicle"];
TRACE_2("enterVehicle",_player,_vehicle);

if (GVAR(pfeh) != -1) then {
    TRACE_1("cleaning up",GVAR(pfeh));
    [GVAR(pfeh)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfeh) = -1;
    call FUNC(viewCleanup);
};

if (!GVAR(enabled)) exitWith {};
if (_player == _vehicle) exitWith {};

private _viewports = [_vehicle] call FUNC(getViewports);
if (_viewports isEqualTo []) exitWith {};

GVAR(pfeh) = [LINKFUNC(eachFrame), 0, [_player, _vehicle, _viewports, -1, -1]] call CBA_fnc_addPerFrameHandler;
TRACE_3("start pfeh",GVAR(pfeh),typeOf _vehicle,count _viewports);
