/*
 * Author: bux578
 * Switches back to the original player unit
 *
 * Arguments:
 * 0: Original player unit <OBJECT>
 * 1: Respawned unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_origPlayer, _respPlayer] call FUNC(switchBack)
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_origPlayerUnit"];

_origPlayerUnit = _this select 0;
[_origPlayerUnit] joinSilent GVAR(OriginalGroup);

DFUNC(pfhSwitchBack) = {
    
    private ["_args", "_originalPlayerUnit", "_currentUnit"];
    
    _args = _this select 0;
    
    _originalPlayerUnit = _args select 0;
    _currentUnit = _args select 1;

    if (local _originalPlayerUnit) exitWith {
        selectPlayer _originalPlayerUnit;
        deleteVehicle _currentUnit;
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
};

[FUNC(pfhSwitchBack), 0.2, _this] call CBA_fnc_addPerFrameHandler;
