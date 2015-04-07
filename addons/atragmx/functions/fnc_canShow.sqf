/*
 * Authors: Ruthberg
 * Tests if the ATragMX can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow (bool)
 *
 * Example:
 * call ace_atragmx_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_returnValue"];

_returnValue = ("ACE_ATragMX" in (items ACE_player)) && {[ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)} && {!(underwater ACE_player)};

_returnValue
