/**
 * fnc_headbugfix.sqf
 * @Descr: Fixes animation issues that may get you stuck
 * @Author: rocko
 *
 * @Arguments:
 * @Return: nil
 * @PublicAPI: true
 */

#include "script_component.hpp"
private ["_pos","_dir","_anim"];

_anim = animationState ACE_player;
["HeadbugFixUsed", [profileName, _anim]] call FUNC(serverEvent);
["HeadbugFixUsed", [profileName, _anim]] call FUNC(localEvent);

if (ACE_player != vehicle ACE_player  || { !([ACE_player, objNull, ["isNotSitting"]] call FUNC(canInteractWith)) } ) exitWith {false};

_pos = getposATL ACE_player;
_dir = getDir ACE_player;

titleCut ["", "BLACK"];
[ACE_Player, "headBugFix"] call FUNC(hideUnit);

// create invisible headbug fix vehicle
_ACE_HeadbugFix = "ACE_Headbug_Fix" createVehicleLocal _pos;
_ACE_HeadbugFix setDir _dir;
ACE_player moveInAny _ACE_HeadbugFix;
sleep 0.1;

unassignVehicle ACE_player;
ACE_player action ["Eject", vehicle ACE_player];
ACE_player setDir _dir;
ACE_player setposATL _pos;
sleep 1.0;

deleteVehicle _ACE_HeadbugFix;

[ACE_Player, "headBugFix"] call FUNC(unhideUnit);
titleCut ["", "PLAIN"];
true
