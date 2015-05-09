/*
 * Author: Winter
 * Assigns the Event Handler which fires when a player adjusts their view distance in the menu
 * 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_initViewDistance;
 *
 * Public: Yes
 */
 
#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Set the EH which waits for the View Distance setting to be changed
["SettingChanged",{
    if (_this select 0  == QGVAR(viewDistance)) then {
        [] call FUNC(changeViewDistance);
    };
},true] call ace_common_fnc_addEventHandler;