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
["HeadbugFixUsed", [profileName, (animationState ACE_player)]] call FUNC(serverEvent);
["HeadbugFixUsed", [profileName, (animationState ACE_player)]] call FUNC(localEvent);

if (ACE_player != vehicle ACE_player  || { !([ACE_player, objNull, ["isNotSitting"]] call FUNC(canInteractWith)) } ) exitWith {false};

_pos = getposATL ACE_player;
_dir = getDir ACE_player;

titleCut ["", "BLACK"];

// create invisible headbug fix vehicle
_ACE_HeadbugFix = createVehicle ["ACE_Headbug_Fix", [0,0,10000], [], 0, "NONE"];
_ACE_HeadbugFix setDir _dir;
ACE_player moveInAny _ACE_HeadbugFix;
_ACE_HeadbugFix setposATL _pos;
sleep 0.1;
unassignVehicle ACE_player;
ACE_player action ["Eject", vehicle ACE_player];
ACE_player setDir _dir;
ACE_player setposATL _pos;
sleep 1.0;
deleteVehicle _ACE_HeadbugFix;

titleCut ["", "PLAIN"];
true
