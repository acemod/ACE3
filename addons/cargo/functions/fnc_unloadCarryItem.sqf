#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Dragging integration. Unloader starts carrying unloaded object.
 *
 * Arguments:
 * 0: Unloader <OBJECT>
 * 1: Item <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, object] call ace_cargo_fnc_unloadCarryItem
 *
 * Public: No
 */
params ["_unloader", "_object"];
TRACE_2("unloadCarryItem-start",_unloader,_object);

if !(["ace_dragging"] call EFUNC(common,isModLoaded)) exitWith {};
if (!GVAR(carryAfterUnload) || {getNumber (configOf _object >> QGVAR(blockUnloadCarry)) > 0}) exitWith {};

// When unloading attached objects, this code will run before server has finished moving object to the safe position
[{
    params ["_unloader", "_object"];
    (_unloader distance _object) < 10
}, {
    params ["_unloader", "_object"];
    TRACE_2("unloadCarryItem-unloaded",_unloader,_object);
    if ([_unloader, _object] call EFUNC(dragging,canCarry)) exitWith {
        [_unloader, _object] call EFUNC(dragging,startCarry);
    };
    if ([_unloader, _object] call EFUNC(dragging,canDrag)) exitWith {
        [_unloader, _object] call EFUNC(dragging,startDrag);
    };
}, _this, 1.0, {  // delay is based on how long it will take server event to trigger and take effect
    // not a hard error if this fails, could have just unloaded to other side of vehicle because of findSafePos
    TRACE_1("unloadCarryItem-failed to unload nearby player",_this);
}] call CBA_fnc_waitUntilAndExecute;
