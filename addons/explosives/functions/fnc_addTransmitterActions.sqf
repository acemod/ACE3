#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for selecting the transmitter
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACE_Explosives_fnc_addTransmitterActions;
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("params",_unit);

private _detonators = [_unit] call FUNC(getDetonators);
private _children = [];
{
    private _config = configFile >> "CfgWeapons" >> _x;
    _children pushBack
        [
            [
                format ["Trigger_%1", _forEachIndex],
                getText(_config >> "displayName"),
                getText(_config >> "picture"),
                {},
                {true},
                {(_this select 2) call FUNC(addDetonateActions);},
                [_unit,_x]
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
} forEach _detonators;

_children
