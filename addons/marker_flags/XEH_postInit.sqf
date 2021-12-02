#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _weapons = configProperties [configfile >> "CfgWeapons", QUOTE(isClass _x && (isText (_x >> QQGVAR(vehicle)))), true];

{
    private _name = configName _x;
    private _vehicle = getText (_x >> QGVAR(vehicle));
    GVAR(flagCache) set [_name, _vehicle];

    private _action = [
        _name,
        LLSTRING(ActionPickUp),
        "",
        {[_player, _target] call FUNC(pickUpFlag)},
        {true}
    ] call ace_interact_menu_fnc_createAction;
    [_name, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
} forEach _weapons;
