/*
 * Authors: Ruthberg
 * Tests if the Kestrel 4500 can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow (bool)
 *
 * Example:
 * [mode] call ace_kestrel4500_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_returnValue"];

_returnValue = ("ACE_Kestrel4500" in (items ACE_player)) && {[ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)} && {!(underwater ACE_player)};

_returnValue
