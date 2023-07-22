// by PabstMirror, commy2
#include "script_component.hpp"

// Release object on disconnection. Function is identical to killed
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
};

if (!hasInterface) exitWith {};

if (isNil "ACE_maxWeightDrag") then {
    ACE_maxWeightDrag = 800;
};

if (isNil "ACE_maxWeightCarry") then {
    ACE_maxWeightCarry = 600;
};

if (isNil QGVAR(maxWeightCarryRun)) then {
    GVAR(maxWeightCarryRun) = 50;
};

["isNotDragging", {!((_this select 0) getVariable [QGVAR(isDragging), false])}] call EFUNC(common,addCanInteractWithCondition);
["isNotCarrying", {!((_this select 0) getVariable [QGVAR(isCarrying), false])}] call EFUNC(common,addCanInteractWithCondition);

// Release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["unit", LINKFUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;
["weapon", LINKFUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

// Handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", LINKFUNC(handleUnconscious)] call CBA_fnc_addEventHandler;

// Display event handler
["MouseZChanged", {(_this select 1) call FUNC(handleScrollWheel)}] call CBA_fnc_addDisplayHandler;

#include "initKeybinds.sqf"

//@todo Captivity?
