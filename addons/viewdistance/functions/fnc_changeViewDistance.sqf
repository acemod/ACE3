/*
 * Author: Winter
 * Sets the player's current view distance according to allowed values.
 * 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_changeViewDistance;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_new_view_distance_index","_new_view_distance"];

_new_view_distance_index = GVAR(newViewDistance);

_new_view_distance = [_new_view_distance_index] call FUNC(returnViewDistanceValue);

/*
hint format ["DEBUG: Player: %1 new view distance index: %2 new view distance value: %3",(name player),_new_view_distance_index,_new_view_distance];
diag_log format ["DEBUG: Player: %1 new view distance index: %2 new view distance value: %3",(name player),_new_view_distance_index,_new_view_distance];
*/


// To do: add a check against a sever or module top limit here.

if !GVAR(changeAllowed) then
{
  hint "You cannot change the view distance!"
}
else
{
  setViewDistance _new_view_distance;
};