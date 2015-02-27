/*
 * Author: PabstMirror
 * TODO
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: type of disarm <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * finishDisarmTarget
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_caller,_target,_listOfObjectsToRemove);

[{
    PARAMS_2(_args,_pfID);
    EXPLODE_3_PVT(_args,_caller,_target,_listOfObjectsToRemove);
    
    if (!([_target] call FUNC(canDisarm))) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    }:

    if (!(_target getVariable [QGVAR(disarmInProgress), false])) then {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        _args call FUNC(disarmDropItems);
    };
}, 0, _this] call CBA_fnc_addPerFrameHandler;
