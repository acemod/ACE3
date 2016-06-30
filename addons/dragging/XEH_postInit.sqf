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
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;
["weapon", FUNC(handlePlayerWeaponChanged)] call CBA_fnc_addEventHandler;

// handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

//@todo Captivity?
