#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive detonation selection
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_M26_Clacker"] call ACE_Explosives_fnc_addDetonateActions;
 *
 * Public: No
 */

params ["_unit", "_detonator"];
TRACE_2("params",_unit,_detonator);

private _detonatorConfig = configFile >> "CfgWeapons" >> _detonator;
private _range = getNumber (_detonatorConfig >> QGVAR(Range));

private _result = [_unit] call FUNC(getPlacedExplosives);
private _children = [];
private _explosivesList = [];
{
    if (!isNull(_x select 0)) then {
        private _required = getArray (configFile >> "ACE_Triggers" >> (_x select 4) >> "requires");
        if (_detonator in _required) then {
            private _item = configFile >> "CfgMagazines" >> (_x select 3);

            _explosivesList pushBack _x;

            // Prevent consolidated detonate actions from having the same icon as consolidated place actions of the same explosive type
            private _icon = if (
                EGVAR(interact_menu,consolidateSingleChild) &&
                {_detonator == GVAR(activeTrigger)} &&
                {count (_result select {(_x select 4) == getText (_detonatorConfig >> QGVAR(triggerType))}) < 2}
            ) then {
                getText (_detonatorConfig >> "picture")
            } else {
                getText (_item >> "picture")
            };

            _children pushBack [
                [
                    format ["Explosive_%1", _forEachIndex],
                    _x select 2,
                    _icon,
                    {(_this select 2) call FUNC(detonateExplosive);},
                    {true},
                    {},
                    [_unit,_range,_x,_detonator]
                ] call EFUNC(interact_menu,createAction),
                [],
                _unit
            ];
        };
    };
} forEach _result;

// If the detonator is not active, is a clacker and has assigned explosives, generate an interaction to make it the active detonator for use with the "trigger all" keybind
if (
    _detonator != GVAR(activeTrigger) &&
    {_detonator != "Cellphone"} &&
    {
        _explosivesList isNotEqualTo [] ||
        {_detonator == "ACE_DeadManSwitch" && {_unit getVariable [QGVAR(deadmanInvExplosive), ""] != ""}}
    }
) then {
    _children pushBack [
        [
            QGVAR(setActiveTrigger),
            LLSTRING(SetActiveTrigger),
            "",
            {GVAR(activeTrigger) = (_this select 2) select 0;},
            {true},
            {},
            [_detonator]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
};

if (_detonator != "ACE_DeadManSwitch") then {
    // Add action to detonate all explosives tied to the detonator
    if (count _explosivesList > 1) then {
        _children pushBack [
            [
                "Explosive_All",
                LLSTRING(DetonateAll),
                getText (_detonatorConfig >> "picture"),
                {(_this select 2) call FUNC(detonateExplosiveAll);},
                {true},
                {},
                [_unit, _range, _explosivesList, _detonator]
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
    };
} else {
    //Adds actions for the explosives you can connect to the deadman switch.
    private _connectedInventoryExplosive = _unit getVariable [QGVAR(deadmanInvExplosive), ""];
    if ((_connectedInventoryExplosive != "") && {!(_connectedInventoryExplosive in (magazines _unit))}) then {
        TRACE_1("set, but missing in inventory",_connectedInventoryExplosive);
        _unit setVariable [QGVAR(deadmanInvExplosive), "", true];
    };

    _connectedInventoryExplosive = _unit getVariable [QGVAR(deadmanInvExplosive), ""];

    //Add action to detonate all explosives (including the inventory explosive):
    if (_connectedInventoryExplosive != "" || {count _explosivesList > 1}) then {
        _children pushBack [
            [
                "Explosive_All_Deadman",
                LLSTRING(DetonateAll),
                getText (_detonatorConfig >> "picture"),
                {[_player] call FUNC(onIncapacitated)},
                {true}
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
    };

    if (_connectedInventoryExplosive != "") then {
        //Add the disconnect action
        private _magConfig = configFile >> "CfgMagazines" >> _connectedInventoryExplosive;
        private _name = getText (_magConfig >> "displayName");
        private _picture = getText (_magConfig >> "picture");

        _children pushBack [
            ([
                "Deadman_disconnect",
                format ["%1 %2", localize "str_disp_disconnect", _name],
                _picture,
                {
                    params ["_player"];
                    TRACE_1("clear",_player);
                    _player setVariable [QGVAR(deadmanInvExplosive), "", true];
                },
                {true}
            ] call EFUNC(interact_menu,createAction)),
            [],
            _unit
        ];

    } else {
        //Add all magazines that would work with the deadman switch
        private _procressedMags = [];
        {
            private _mag = _x;
            if !(_mag in _procressedMags) then {
                _procressedMags pushBack _x;
                private _magConfig = configFile >> "CfgMagazines" >> _mag;
                private _supportedTriggers = getArray (_magConfig >> "ACE_Triggers" >> "SupportedTriggers");
                if (({_x == "DeadmanSwitch"} count _supportedTriggers) == 1) then { //case insensitive search
                    private _name = getText (_magConfig >> "displayName");
                    private _picture = getText (_magConfig >> "picture");

                    _children pushBack [
                    ([
                    format ["Deadman_exp_%1", _mag],
                    format [localize LSTRING(connectInventoryExplosiveToDeadman), _name],
                    _picture,
                    {
                        params ["_player", "", "_mag"];
                        TRACE_2("set new",_player,_mag);
                        _player setVariable [QGVAR(deadmanInvExplosive), _mag, true];
                    },
                    {(_this select 2) in (magazines _player)},
                    {},
                    (_mag)
                    ] call EFUNC(interact_menu,createAction)), [], _unit];
                };
            };
        } forEach (magazines _unit);
    };
};

_children
