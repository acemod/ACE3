// by commy2 and esteldunedain
#include "script_component.hpp"

ACE_Modifier = 0;

[QGVAR(pardon), {(_this select 0) addRating -rating (_this select 0)}] call CBA_fnc_addEventHandler;

[QGVAR(getDown), {
    params ["_target"];

    _target setUnitPos "DOWN";
}] call CBA_fnc_addEventHandler;

[QGVAR(sendAway), {
    params ["_unit", "_position"];

    _unit setUnitPos "AUTO";
    _unit doMove _position;
}] call CBA_fnc_addEventHandler;

[QGVAR(flip), {
    params ["_vehicle"];
    private _position = getPosATL _vehicle;
    _vehicle setVectorUp surfaceNormal _position;
    _vehicle setPosATL _position;
}] call CBA_fnc_addEventHandler;

[QGVAR(setLight), {
    params ["_lamp", "_state"];
    private _hitpoints = _lamp call EFUNC(common,getReflectorsWithSelections) select 1;
    {
        private _damage = _lamp getHit _x;
        if (_state) then {
            if (_damage == DISABLED_LAMP_DAMAGE) then {
                _lamp setHit [_x, 0];
            };
        } else {
            if (_damage < DISABLED_LAMP_DAMAGE) then {
                _lamp setHit [_x, DISABLED_LAMP_DAMAGE];
            };
        };
    } forEach _hitpoints;
    _lamp setVariable [QGVAR(isLightOn), _state, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(setCollisionLight), {
    (_this select 0) setCollisionLight (_this select 1);
}] call CBA_fnc_addEventHandler;

// Zeus action events
[QGVAR(zeusStance),{
    { _x setUnitPos (_this select 0); } forEach (_this select 1);
}] call CBA_fnc_addEventHandler;

// The following 3 events handle both waypoints and groups
[QGVAR(zeusBehaviour),{
    if (param [2,false]) then {
        { _x setWaypointBehaviour (_this select 0); } forEach (_this select 1);
    } else {
        { _x setBehaviour (_this select 0); } forEach (_this select 1);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(zeusSpeed),{
    if (param [2,false]) then {
        { _x setWaypointSpeed (_this select 0); } forEach (_this select 1);
    } else {
        { _x setSpeedMode (_this select 0); } forEach (_this select 1);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(zeusFormation),{
    if (param [2,false]) then {
        { _x setWaypointFormation (_this select 0); } forEach (_this select 1);
    } else {
        { _x setFormation (_this select 0); } forEach (_this select 1);
    };
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(replaceTerrainObject), FUNC(replaceTerrainObject)] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

GVAR(isOpeningDoor) = false;

[QEGVAR(interact_menu,renderNearbyActions), {
    if (!GVAR(interactWithTerrainObjects)) exitWith {};
    {
        if (
            isObjectHidden _x // after hiding on server 
            || {_x getVariable [QGVAR(terrainObjectReplaced), false]} // after checking but before hiding
            || {typeOf _x isNotEqualTo ""}
        ) then {continue};
        private _model = getModelInfo _x select 1;
        private _class = GVAR(replaceTerrainModels) get _model;
        if (isNil "_class") then {continue};
        _x setVariable [QGVAR(terrainObjectReplaced), true];
        [QGVAR(replaceTerrainObject), [_x, _class]] call CBA_fnc_serverEvent;
    } forEach nearestTerrainObjects [ACE_player, [], 5, false];
}] call CBA_fnc_addEventHandler;

[QGVAR(tapShoulder), {
    params ["_unit", "_shoulderNum"];

    if (_unit == ACE_player) then {
        addCamShake [4, 0.5, 5];
        private _message = parseText format ([["%1 &gt;", localize LSTRING(YouWereTappedRight)], ["&lt; %1", localize LSTRING(YouWereTappedLeft)]] select (_shoulderNum == 1));
        [_message] call EFUNC(common,displayTextStructured);
    };
}] call CBA_fnc_addEventHandler;

// add keybinds
["ACE3 Common", QGVAR(openDoor), localize LSTRING(OpenDoor), {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (GVAR(isOpeningDoor) || {[MACRO_DOOR_REACH_DISTANCE] call FUNC(getDoor) select 1 == ''}) exitWith {false};

    // Statement
    call EFUNC(interaction,openDoor);
    true
}, {
    //Probably don't want any conditions here, so variable never gets locked down
    // Statement
    GVAR(isOpeningDoor) = false;
    true
},
[57, [false, true, false]], false] call CBA_fnc_addKeybind; //Key CTRL+Space

["ACE3 Common", QGVAR(tapShoulder), localize LSTRING(TapShoulder), {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player, cursorTarget] call FUNC(canTapShoulder)) exitWith {false};

    //Tap whichever shoulder is closest
    private _shoulderNum = [0, 1] select (([cursorTarget, ACE_player] call BIS_fnc_relativeDirTo) > 180);

    // Statement
    [ACE_player, cursorTarget, _shoulderNum] call FUNC(tapShoulder);
    true
},
{false},
[20, [true, false, false]], false] call CBA_fnc_addKeybind;

["isNotSwimming", {!(_this call EFUNC(common,isSwimming))}] call EFUNC(common,addCanInteractWithCondition);
["isNotOnLadder", {getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState (_this select 0) >> "ACE_isLadder") != 1}] call EFUNC(common,addCanInteractWithCondition);

["CBA_settingsInitialized", {
    if (GVAR(disableNegativeRating)) then {
        player addEventHandler ["HandleRating", {
            (_this select 1) max 0
        }];
    };
}] call CBA_fnc_addEventHandler;

{
    [_x, {
        [QGVAR(clearWeaponAttachmentsActionsCache)] call CBA_fnc_localEvent;
    }] call CBA_fnc_addPlayerEventHandler;
} forEach ["loadout", "weapon"];
