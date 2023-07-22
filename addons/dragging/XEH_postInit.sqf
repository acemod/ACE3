// by PabstMirror, commy2
#include "script_component.hpp"

if (isServer) then {
    // 'HandleDisconnect' EH triggers too late
    addMissionEventHandler ["PlayerDisconnected", {
        private _unit = (getUserInfo (_this select 5)) select 10;

        _unit call FUNC(handleKilled);
    }];
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

// Extended EH doesn't fire for dead units, so add interactions manually
{
    _x call FUNC(initPerson);
} forEach allDeadMen;

["isNotDragging", {!((_this select 0) getVariable [QGVAR(isDragging), false])}] call EFUNC(common,addCanInteractWithCondition);
["isNotCarrying", {!((_this select 0) getVariable [QGVAR(isCarrying), false])}] call EFUNC(common,addCanInteractWithCondition);

// release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;
["weapon", FUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

// handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

// Handle local effect commands for clones
[QGVAR(cloneCreated), {
    params ["_unit", "_clone"];

    _clone setFace face _unit;
    _clone setMimic "unconscious";
}] call CBA_fnc_addEventHandler;

// display event handler
["MouseZChanged", {_this select 1 call FUNC(handleScrollWheel)}] call CBA_fnc_addDisplayHandler;

[QGVAR(carryingContainerClosed), {
    params ["_container", "_owner"];
    TRACE_2("carryingContainerClosed EH",_container,_owner);
    if !(_owner getVariable [QGVAR(isCarrying), false]) exitWith { ERROR_1("not carrying - %1",_this) };

    private _weight = 0;
    if !(_container getVariable [QGVAR(ignoreWeightCarry), false]) then {
        _weight = [_container] call FUNC(getWeight);
    };

    // drop the object if overweight
    if (_weight > ACE_maxWeightCarry) exitWith {
        [_owner, _container] call FUNC(dropObject_carry);
    };
    private _canRun = [_weight] call FUNC(canRun_carry);

    // force walking based on weight
    [_owner, "forceWalk", QUOTE(ADDON), !_canRun] call EFUNC(common,statusEffect_set);
    [_owner, "blockSprint", QUOTE(ADDON), _canRun] call EFUNC(common,statusEffect_set);
}] call CBA_fnc_addEventHandler;

[QGVAR(draggingContainerClosed), {
    params ["_container", "_owner"];
    TRACE_2("draggingContainerClosed EH",_container,_owner);
    if !(_owner getVariable [QGVAR(isDragging), false]) exitWith { ERROR_1("not dragging - %1",_this) };

    private _weight = 0;
    if !(_container getVariable [QGVAR(ignoreWeightDrag), false]) then {
        _weight = [_container] call FUNC(getWeight);
    };

     // drop the object if overweight
    if (_weight > ACE_maxWeightDrag) exitWith {
        [_owner, _container] call FUNC(dropObject);
    };
}] call CBA_fnc_addEventHandler;

//@todo Captivity?

//Add Keybind:
["ACE3 Common", QGVAR(drag), (localize LSTRING(DragKeybind)), {
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
}, {}, [-1, [false, false, false]]] call CBA_fnc_addKeybind; // UNBOUND

["ACE3 Common", QGVAR(carry), (localize LSTRING(CarryKeybind)), {
    if (!alive ACE_player) exitWith {false};
    if !([ACE_player, objNull, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {false};

    // If we are drag/carrying something right now then just drop it:
    if (ACE_player getVariable [QGVAR(isDragging), false]) exitWith {
        [ACE_player, ACE_player getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
        false
    };
    if (ACE_player getVariable [QGVAR(isCarrying), false]) exitWith {
        [ACE_player, ACE_player getVariable [QGVAR(carriedObject), objNull], true] call FUNC(dropObject_carry);
        false
    };

    private _cursor = cursorObject;
    if ((isNull _cursor) || {(_cursor distance ACE_player) > 2.6}) exitWith {false};
    if (!([ACE_player, _cursor] call FUNC(canCarry))) exitWith {false};

    [ACE_player, _cursor] call FUNC(startCarry);
    false
}, {}, [-1, [false, false, false]]] call CBA_fnc_addKeybind; // UNBOUND
