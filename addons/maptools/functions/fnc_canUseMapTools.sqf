#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Returns if the map tools can be used.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Map tools can be used <BOOL>
 *
 * Example:
 * call ace_maptools_fnc_canUseMapTools
 *
 * Public: No
 */

visibleMap &&
{alive ACE_player} &&
{!GVAR(mapTool_isDragging)} &&
{!GVAR(mapTool_isRotating)} &&
{ACE_player getSlotItemName TYPE_MAP != ""} &&
{[ACE_player, "ACE_MapTools"] call EFUNC(common,hasItem)}
