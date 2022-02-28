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
{getText (configFile >> "CfgWeapons" >> (assignedItems ACE_player param [0, ""]) >> "simulation") == "ItemMap"} &&
{"ACE_MapTools" in (ACE_player call EFUNC(common,uniqueItems))} &&
{!GVAR(mapTool_isDragging)} &&
{!GVAR(mapTool_isRotating)}
