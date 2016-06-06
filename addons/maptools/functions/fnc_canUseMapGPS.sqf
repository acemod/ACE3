/*
 * Author: esteldunedain
 * canUseMapGPS
 *
 * Arguments:
 * None
 *
 * Return Value:
 * <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

visibleMap &&
{alive ACE_player} &&
{"ItemGPS" in (assignedItems ACE_player)}
