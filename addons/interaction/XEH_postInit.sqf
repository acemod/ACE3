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

[QGVAR(setLampOn), {
    params ["_lamp", "_hitPointsDamage", "_disabledLampDMG"];
    {if((_x select 1) == _disabledLampDMG) then {_lamp setHit [_x select 0, 0];};nil} count _hitPointsDamage;
}] call CBA_fnc_addEventHandler;

[QGVAR(setLampOff), {
    params ["_lamp", "_hitPointsDamage", "_disabledLampDMG"];
    {_lamp setHit [_x select 0, (_x select 1) max _disabledLampDMG];nil} count _hitPointsDamage;
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

if (!hasInterface) exitWith {};

GVAR(isOpeningDoor) = false;

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
    //Probably don't want any condidtions here, so variable never gets locked down
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

["isNotSwimming", {!underwater (_this select 0)}] call EFUNC(common,addCanInteractWithCondition);
["isNotOnLadder", {getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState (_this select 0) >> "ACE_isLadder") != 1}] call EFUNC(common,addCanInteractWithCondition);
