// by commy2 and esteldunedain
#include "script_component.hpp"

ACE_Modifier = 0;

["pardon", {(_this select 0) addRating -rating (_this select 0)}] call EFUNC(common,addEventHandler);

["getDown", {
    params ["_target"];

    _target setUnitPos "DOWN";
}] call EFUNC(common,addEventHandler);

["sendAway", {
    params ["_unit", "_position"];

    _unit setUnitPos "AUTO";
    _unit doMove _position;
}] call EFUNC(common,addEventHandler);

if (!hasInterface) exitWith {};

GVAR(isOpeningDoor) = false;

[{_this call FUNC(handleScrollWheel)}] call EFUNC(common,addScrollWheelEventHandler);

["tapShoulder", {
    params ["_unit", "_shoulderNum"];

    if (_unit == ACE_player) then {
        addCamShake [4, 0.5, 5];
        private _message = parseText format ([["%1 &gt;", localize LSTRING(YouWereTappedRight)], ["&lt; %1", localize LSTRING(YouWereTappedLeft)]] select (_shoulderNum == 0));
        [_message] call FUNC(displayTextStructured);
    };
}] call EFUNC(common,addEventHandler);

// restore global fire teams for JIP
private "_team";
{
    _team = _x getVariable [QGVAR(assignedFireTeam), ""];
    if (_team != "") then {_x assignTeam _team};
    false
} count allUnits;

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

    // Statement
    [ACE_player, cursorTarget, 0] call FUNC(tapShoulder);
    true
},
{false},
[20, [true, false, false]], false] call CBA_fnc_addKeybind;

["isNotSwimming", {!underwater (_this select 0)}] call EFUNC(common,addCanInteractWithCondition);
["isNotOnLadder", {getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState (_this select 0) >> "ACE_isLadder") != 1}] call EFUNC(common,addCanInteractWithCondition);
