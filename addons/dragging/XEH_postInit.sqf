// by PabstMirror, commy2
#include "script_component.hpp"

if (isServer) then {
    // release object on hard disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
};

if (!hasInterface) exitWith {};

if (isNil "ACE_maxWeightDrag") then {
    ACE_maxWeightDrag = 800;
};

if (isNil "ACE_maxWeightCarry") then {
    ACE_maxWeightCarry = 600;
};

["isNotDragging", {!((_this select 0) getVariable [QGVAR(isDragging), false])}] call EFUNC(common,addCanInteractWithCondition);
["isNotCarrying", {!((_this select 0) getVariable [QGVAR(isCarrying), false])}] call EFUNC(common,addCanInteractWithCondition);

// release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;
["weapon", FUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

// handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

//@todo Captivity?

//Add Keybind:
["ACE3 Common", QGVAR(drag), (localize LSTRING(DragKeybind)),
{
    if (!alive ACE_player) exitWith {false};
    if !([ACE_player, objNull, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // If we are drag/carrying something right now then just drop it:
    if (ACE_player getVariable [QGVAR(isDragging), false]) exitWith {
        [ACE_player, ACE_player getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
        false
    };
    if (ACE_player getVariable [QGVAR(isCarrying), false]) exitWith {
        [ACE_player, ACE_player getVariable [QGVAR(carriedObject), objNull]] call FUNC(dropObject_carry);
        false
    };

    private _cursor = cursorObject;
    if ((isNull _cursor) || {(_cursor distance ACE_player) > 2.6}) exitWith {false};
    if (!([ACE_player, _cursor] call FUNC(canDrag))) exitWith {false};

    [ACE_player, _cursor] call FUNC(startDrag);
    false
},
{false},
[-1, [false, false, false]]] call CBA_fnc_addKeybind; // UNBOUND

