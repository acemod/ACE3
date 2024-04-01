#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Returns if the GPS on the map can be used.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * GPS can be used <BOOL>
 *
 * Example:
 * call ace_maptools_fnc_canUseMapGPS
 *
 * Public: No
 */

visibleMap &&
{alive ACE_player} &&
{"ItemGPS" in (assignedItems ACE_player)}
