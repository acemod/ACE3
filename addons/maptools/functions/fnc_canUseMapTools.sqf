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
{
    scopeName "hasMap";
    {
        if (_x isKindOf ["ItemMap", configFile >> "CfgWeapons"]) exitWith {true breakOut "hasMap"};
    } forEach (assignedItems ACE_player);
    false
} &&
{"ACE_MapTools" in (ACE_player call EFUNC(common,uniqueItems))} &&
{!GVAR(mapTool_isDragging)} &&
{!GVAR(mapTool_isRotating)}
