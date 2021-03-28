#include "script_component.hpp"
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
 * call ACE_maptools_fnc_canUseMapGPS
 *
 * Public: No
 */

visibleMap &&
{alive ACE_player} &&
{"ItemGPS" in (assignedItems ACE_player)}
