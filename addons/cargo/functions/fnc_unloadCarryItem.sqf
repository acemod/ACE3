#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Dragging integration. Unloader starts carrying unloaded object.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Unloader <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_unloadCarryItem
 *
 * Public: No
 */
params ["_unloader", "_object"];

if !(["ace_dragging"] call EFUNC(common,isModLoaded)) exitWith {false};

switch (true) do {
    case ([_unloader, _object] call EFUNC(dragging,canCarry)): {
        [_unloader, _object] call EFUNC(dragging,startCarry);
    };
    case ([_unloader, _object] call EFUNC(dragging,canDrag)): {
        [_unloader, _object] call EFUNC(dragging,startDrag);
    };
};
