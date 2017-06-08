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
#include "script_component.hpp"

visibleMap &&
{alive ACE_player} &&
{
    scopeName "hasMap";
    {
        if (_x isKindOf ["ItemMap", configFile >> "CfgWeapons"]) exitWith {true breakOut "hasMap"};
    } forEach (assignedItems ACE_player);
    false
} &&
{"ACE_MapTools" in (items ACE_player)} &&
{!GVAR(mapTool_isDragging)} &&
{!GVAR(mapTool_isRotating)}
