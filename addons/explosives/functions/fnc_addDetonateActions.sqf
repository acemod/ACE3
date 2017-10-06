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
#include "script_component.hpp"

params ["_unit", "_detonator"];
TRACE_2("params",_unit,_detonator);

private _range = getNumber (ConfigFile >> "CfgWeapons" >> _detonator >> QGVAR(Range));

private _result = [_unit] call FUNC(getPlacedExplosives);
private _children = [];
private _explosivesList = [];
{
    if (!isNull(_x select 0)) then {
        private _required = getArray (ConfigFile >> "ACE_Triggers" >> (_x select 4) >> "requires");
        if (_detonator in _required) then {
            private _item = ConfigFile >> "CfgMagazines" >> (_x select 3);

            _explosivesList pushBack _x;

            _children pushBack
                [
                    [
                        format ["Explosive_%1", _forEachIndex],
                        _x select 2,
                        getText(_item >> "picture"),
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
if (_detonator != "ACE_DeadManSwitch") then {
    // Add action to detonate all explosives tied to the detonator
    if (count _explosivesList > 0) then {
        _children pushBack [
        [
            "Explosive_All",
            localize LSTRING(DetonateAll),
            getText(ConfigFile >> "CfgWeapons" >> _detonator >> "picture"),
            {(_this select 2) call FUNC(detonateExplosiveAll);},
            {true},
            {},
            [_unit,_range,_explosivesList, _detonator]
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ];
    };
} else {
    //Add action to detonate all explosives (including the inventory explosive):
    _children pushBack [
    [
    "Explosive_All_Deadman",
    localize LSTRING(DetonateAll),
    getText(ConfigFile >> "CfgWeapons" >> _detonator >> "picture"),
    {[_player] call FUNC(onIncapacitated)},
    {true}
    ] call EFUNC(interact_menu,createAction),
    [],
    _unit
    ];

    //Adds actions for the explosives you can connect to the deadman switch.
    private _connectedInventoryExplosive = _unit getVariable [QGVAR(deadmanInvExplosive), ""];
    if ((_connectedInventoryExplosive != "") && {!(_connectedInventoryExplosive in (magazines _unit))}) then {
        TRACE_1("set, but missing in inventory",_connectedInventoryExplosive);
        _unit setVariable [QGVAR(deadmanInvExplosive), "", true];
    };

    _connectedInventoryExplosive = _unit getVariable [QGVAR(deadmanInvExplosive), ""];
    if (_connectedInventoryExplosive != "") then {
        //Add the disconect action
        private _magConfig = configFile >> "CfgMagazines" >> _connectedInventoryExplosive;
        private _name = if ((getText (_magConfig >> "displayNameShort")) != "") then {
            getText (_magConfig >> "displayNameShort")
        } else {
            getText(_magConfig >> "displayName")
        };
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
        ] call EFUNC(interact_menu,createAction)), [], _unit];

    } else {
        //Add all magazines that would work with the deadman switch
        private _procressedMags = [];
        {
            private _mag = _x;
            if (!(_mag in _procressedMags)) then {
                _procressedMags pushBack _x;
                private _magConfig = configFile >> "CfgMagazines" >> _mag;
                private _supportedTriggers = getArray (_magConfig >> "ACE_Triggers" >> "SupportedTriggers");
                if (({_x == "DeadmanSwitch"} count _supportedTriggers) == 1) then { //case insensitive search
                    private _name = if ((getText (_magConfig >> "displayNameShort")) != "") then {
                        getText (_magConfig >> "displayNameShort")
                    } else {
                        getText(_magConfig >> "displayName")
                    };
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
