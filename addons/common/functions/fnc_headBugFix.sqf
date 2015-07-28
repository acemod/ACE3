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
if (player != vehicle player  || {(player getvariable ["ace_isUnconscious", false])}) exitWith {};
titleCut ["", "BLACK"];
_pos = getposATL player;
// create invisible headbug fix vehicle
_ACE_HeadbugFix = createVehicle ["ACE_Headbug_Fix", getposATL player, [], 0, "NONE"];
player moveinDriver _ACE_HeadbugFix;
sleep 1.0;
unassignVehicle player;
player action ["Eject", vehicle player];
sleep 1.0;
deleteVehicle _ACE_HeadbugFix;
player setposATL _pos;
titleCut ["", "PLAIN"];

