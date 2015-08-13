/*
 * Author: rocko
 *
 * Fixes animation issues that may get you stuck
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: yes
 */


#include "script_component.hpp"
private ["_pos","_dir","_anim"];
if (ACE_player != vehicle ACE_player  || {(ACE_player getvariable ["ace_isUnconscious", false])}) exitWith {};
titleCut ["", "BLACK"];
_pos = getposATL ACE_player;
_dir = getDir ACE_player;
_anim = animationState ACE_player;
// create invisible headbug fix vehicle
_ACE_HeadbugFix = createVehicle ["ACE_Headbug_Fix", getposATL ACE_player, [], 0, "NONE"];
_ACE_HeadbugFix setDir _dir;
ACE_player moveInAny _ACE_HeadbugFix;
sleep 1.0;
unassignVehicle ACE_player;
ACE_player action ["Eject", vehicle ACE_player];
sleep 1.0;
deleteVehicle _ACE_HeadbugFix;
ACE_player setposATL _pos;
ACE_player setDir _dir;
titleCut ["", "PLAIN"];
