#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for selecting the transmitter.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * player call ace_explosives_fnc_addTransmitterActions
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("params",_unit);

private _cfgWeapons = configFile >> "CfgWeapons";

(_unit call FUNC(getDetonators)) apply {
    private _config = _cfgWeapons >> _x;

    [
        [
            QGVAR(trigger_) + _x,
            getText (_config >> "displayName"),
            getText (_config >> "picture"),
            {},
            {true},
            {(_this select 2) call FUNC(addDetonateActions)},
            [_unit, _x]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
} // return
