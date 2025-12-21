#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, CAA-Picard, mharis001
 * Returns children actions for explosive magazines in the player's inventory.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * player call ace_explosives_fnc_addExplosiveActions
 *
 * Public: No
 */

[_this, {
    params ["_unit"];
    TRACE_1("Creating explosive actions",_unit);

    private _cfgMagazines = configFile >> "CfgMagazines";
    private _magazines = magazines _unit;
    private _totalCount = count _magazines;

    private _actions = [];

    {
        private _config = _cfgMagazines >> _x;

        if (getNumber (_config >> QGVAR(placeable)) != 1) then {
            continue;
        };

        private _name = getText (_config >> "displayName");

        _actions pushBack [
            [
                _x,
                format ["%1 (%2)", _name, _totalCount - count (_magazines - [_x])],
                getText (_config >> "picture"),
                {[LINKFUNC(setupExplosive), _this] call CBA_fnc_execNextFrame},
                {true},
                {},
                _x
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
    } forEach ([_unit, 2] call EFUNC(common,uniqueItems));

    _actions
}, ACE_player, QGVAR(explosiveActions), 3600, "cba_events_loadoutEvent"] call EFUNC(common,cachedCall);
