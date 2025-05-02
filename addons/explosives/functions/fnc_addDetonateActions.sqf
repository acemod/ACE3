#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive detonation selection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger classname <STRING>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player, "ACE_M26_Clacker"] call ace_explosives_fnc_addDetonateActions
 *
 * Public: No
 */

params ["_unit", "_detonator"];
TRACE_2("params",_unit,_detonator);

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAceTriggers = configFile >> "ACE_Triggers";
private _detonatorConfig = _cfgWeapons >> _detonator;
private _range = getNumber (_detonatorConfig >> QGVAR(range));

// Get explosives that can be triggered by detonator
private _explosivesList = (_unit call FUNC(getPlacedExplosives)) select {_detonator in ((getArray (_cfgAceTriggers >> _x select 4 >> "requires")) apply {_x call EFUNC(common,getConfigName)})};
private _consolidate = EGVAR(interact_menu,consolidateSingleChild) && {_detonator == GVAR(activeTrigger)} && {{(_x select 4) == getText (_detonatorConfig >> QGVAR(triggerType))} count _explosivesList < 2};
private _children = _explosivesList apply {
    [
        [
            format [QGVAR(explosive_%1), _x select 3],
            _x select 2,
            // Prevent consolidated detonate actions from having the same icon as consolidated place actions of the same explosive type
            if (_consolidate) then {
                getText (_detonatorConfig >> "picture")
            } else {
                getText (_cfgMagazines >> _x select 3 >> "picture")
            },
            {(_this select 2) call FUNC(detonateExplosive)},
            {true},
            {},
            [_unit, _range, _x, _detonator]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ]
};

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
            {GVAR(activeTrigger) = (_this select 2) select 0},
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
                QGVAR(explodeAll),
                LLSTRING(DetonateAll),
                getText (_detonatorConfig >> "picture"),
                {
                    (_this select 2) params ["_unit", "_range", "_explosivesList", "_detonator"];

                    {
                        [_unit, _range, _x, _detonator] call FUNC(detonateExplosive);
                    } forEach _explosivesList;
                },
                {true},
                {},
                [_unit, _range, _explosivesList, _detonator]
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
    };
} else {
    // Adds actions for the explosives you can connect to the deadman switch
    private _connectedInventoryExplosive = _unit getVariable [QGVAR(deadmanInvExplosive), ""];

    if (_connectedInventoryExplosive != "" && {!([_unit, _connectedInventoryExplosive] call EFUNC(common,hasMagazine))}) then {
        TRACE_1("set, but missing in inventory",_connectedInventoryExplosive);

        _unit setVariable [QGVAR(deadmanInvExplosive), "", true];

        _connectedInventoryExplosive = "";
    };

    // Add action to detonate all explosives tied to the detonator (including the inventory explosive)
    if (_connectedInventoryExplosive != "" || {count _explosivesList > 1}) then {
        _children pushBack [
            [
                QGVAR(explodeAllDeadman),
                LLSTRING(DetonateAll),
                getText (_detonatorConfig >> "picture"),
                {_player call FUNC(onIncapacitated)},
                {true}
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
    };

    if (_connectedInventoryExplosive != "") then {
        // Add the disconnect action
        private _configMagazine = _cfgMagazines >> _connectedInventoryExplosive;

        _children pushBack [
            ([
                QGVAR(disconnectDeadman),
                format ["%1 %2", localize "str_disp_disconnect", getText (_configMagazine >> "displayName")],
                getText (_configMagazine >> "picture"),
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
        // Add all magazines that would work with the deadman switch
        {
            private _configMagazine = _cfgMagazines >> _x;

            if (((getArray (_configMagazine >> "ACE_Triggers" >> "SupportedTriggers")) findIf {_x == "DeadmanSwitch"}) == -1) then {
                continue;
            };

            _children pushBack [
                [
                    format [QGVAR(explodeDeadman_%1), _x],
                    format [LLSTRING(connectInventoryExplosiveToDeadman), getText (_configMagazine >> "displayName")],
                    getText (_configMagazine >> "picture"),
                    {
                        params ["_player", "", "_magazine"];
                        TRACE_2("set new",_player,_magazine);

                        _player setVariable [QGVAR(deadmanInvExplosive), _magazine, true];
                    },
                    {[_player, _this select 2] call EFUNC(common,hasMagazine)},
                    {},
                    _x
                ] call EFUNC(interact_menu,createAction),
                [],
                _unit
            ];
        } forEach ([_unit, 2] call EFUNC(common,uniqueItems));
    };
};

_children // return
