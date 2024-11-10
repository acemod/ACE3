// by PabstMirror, commy2
#include "script_component.hpp"

[QGVAR(moveCorpse), {
    params ["_corpse", "_dir", "_posATL"];

    if (isNull _corpse) exitWith {};

    // Check if the corpse is already close to the target
    // If so, don't teleport
    if ((getPosATL _corpse) distance _posATL > 0.25) then {
        // Set direction before position
        _corpse setDir _dir;

        // Bring corpse back to clone's position
        _corpse setPosATL _posATL;
    };

    // Sync the corpse with its position
    [{
        _this awake true;

        [{
            _this awake false;
        }, _this] call CBA_fnc_execNextFrame;
    }, _corpse] call CBA_fnc_execNextFrame;

    // Allow the corpse to be synced for JIP players
    if (isServer) exitWith {
        GVAR(movedCorpses) pushBackUnique _corpse;
    };
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    // Release object on disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", LINKFUNC(handleKilled)];

    GVAR(movedCorpses) = [];

    ["CAManBase", "Deleted", {
        GVAR(movedCorpses) deleteAt (GVAR(movedCorpses) find (_this select 0));
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    [QGVAR(disableSyncMovedCorpseOnJIP), {
        params ["_corpse"];

        GVAR(movedCorpses) deleteAt (GVAR(movedCorpses) find _corpse);
    }] call CBA_fnc_addEventHandler;

    // Sync position of dead corpse for JIP unit (prevents weird invisible hitboxes on corpses)
    [QGVAR(requestSyncMovedCorpsesJIP), {
        params ["_clientOwner"];

        {
            [QGVAR(moveCorpse), [_x, getDir _x, getPosATL _x], _clientOwner] call CBA_fnc_ownerEvent;
        } forEach GVAR(movedCorpses);
    }] call CBA_fnc_addEventHandler;
} else {
    [QGVAR(requestSyncMovedCorpsesJIP), clientOwner] call CBA_fnc_serverEvent;
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

// Release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["unit", LINKFUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;
["weapon", LINKFUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

// When changing cameras, drop carried and dragged objects
["featureCamera", {
    params ["_unit", "_camera"];

    // Unit can either drag or carry, functions themselves handle which ones are executed
    switch (_camera) do {
        // Default camera
        case "": {
            _unit call FUNC(resumeDrag);
            _unit call FUNC(resumeCarry);
        };
        // Arsenals make the unit change animations, which makes the unit drop dragged/carried objects regardless
        case "arsenal";
        case "ace_arsenal": {
            _unit call FUNC(handleKilled);
        };
        default {
            _unit call FUNC(pauseDrag);
            _unit call FUNC(pauseCarry);
        };
    };
}] call CBA_fnc_addPlayerEventHandler;

// Handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", LINKFUNC(handleUnconscious)] call CBA_fnc_addEventHandler;

// Display event handler
["MouseZChanged", {(_this select 1) call FUNC(handleScrollWheel)}] call CBA_fnc_addDisplayHandler;

// Handle local effect commands for clones
[QGVAR(setCloneFace), {
    params ["_clone", "_corpse"];

    _clone setFace face _corpse;
    _clone setMimic "unconscious";
}] call CBA_fnc_addEventHandler;

// Handle surrendering and handcuffing
["ace_captiveStatusChanged", {
    params ["_unit", "_state"];

    // If surrended or handcuffed, drop dragged/carried object
    if (_state && {local _unit}) then {
        _unit call FUNC(handleKilled);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(startCarry), LINKFUNC(startCarryLocal)] call CBA_fnc_addEventHandler;
[QGVAR(startDrag), LINKFUNC(startDragLocal)] call CBA_fnc_addEventHandler;

[QGVAR(setCarryable), LINKFUNC(setCarryable)] call CBA_fnc_addEventHandler;
[QGVAR(setDraggable), LINKFUNC(setDraggable)] call CBA_fnc_addEventHandler;

[QGVAR(carryingContainerClosed), {
    params ["_container", "_owner"];
    TRACE_2("carryingContainerClosed EH",_container,_owner);
    if !(_owner getVariable [QGVAR(isCarrying), false]) exitWith { ERROR_1("not carrying - %1",_this) };

    private _weight = 0;
    if !(_container getVariable [QGVAR(ignoreWeightCarry), false]) then {
        _weight = [_container] call FUNC(getWeight);
    };

    // Drop the object if overweight
    if (_weight > ACE_maxWeightCarry) exitWith {
        [_owner, _container] call FUNC(dropObject_carry);
    };
    private _canRun = [_weight] call FUNC(canRun_carry);

    // Force walking based on weight
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

     // Drop the object if overweight
    if (_weight > ACE_maxWeightDrag) exitWith {
        [_owner, _container] call FUNC(dropObject);
    };
}] call CBA_fnc_addEventHandler;

#include "initKeybinds.inc.sqf"
