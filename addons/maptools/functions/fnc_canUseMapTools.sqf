#include "script_component.hpp"
/*
 * Author: esteldunedain
 * canUseMapTools
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * call ACE_maptools_fnc_canUseMapTools
 *
 * Public: No
 */

visibleMap &&
{alive ACE_player} &&
{"ACE_MapTools" in (ACE_player call EFUNC(common,uniqueItems))} &&
{!GVAR(mapTool_isDragging)} &&
{!GVAR(mapTool_isRotating)} &&
{getUnitLoadout ACE_player param [9, []] param [0, ""] != ""}
