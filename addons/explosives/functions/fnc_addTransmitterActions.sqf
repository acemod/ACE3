/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for selecting the transmitter
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ACE_Explosives_fnc_addTransmitterActions;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_unit", "_children", "_config", "_detonators"];
_unit = _this select 0;
_detonators = [_unit] call FUNC(getDetonators);
_children = [];
{
    _config = ConfigFile >> "CfgWeapons" >> _x;
    _children pushBack
        [
            [
                format ["Trigger_%1", _forEachIndex],
                getText(_config >> "displayName"),
                getText(_config >> "picture"),
                {},
                {true},
                {(_this select 2) call FUNC(addDetonateActions);},
                [ACE_player,_x]
            ] call EFUNC(interact_menu,createAction),
            [],
            ACE_Player
        ];
} foreach _detonators;

_children
