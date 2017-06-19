/*
 * Author: esteldunedain
 * canUseMapGPS
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * call ACE_map_fnc_canUseMapGPS
 *
 * Public: No
 */
#include "script_component.hpp"

visibleMap &&
{alive ACE_player} &&
{"ItemGPS" in (assignedItems ACE_player)}
