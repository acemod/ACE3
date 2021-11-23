#include "script_component.hpp"

private _weapons = configProperties [configfile >> "CfgWeapons", QUOTE(isClass _x && (isText (_x >> QQGVAR(vehicle)))), true];

{
    private _name = configName _x;
    private _vehicle = getText (_x >> QGVAR(vehicle));
    GVAR(weaponCache) set [_name, _vehicle];
    GVAR(vehicleCache) set [_vehicle, _name];

    private _action = [
        _name,
        LLSTRING(actionPickUp),
        "",
        {[_target, _player] call FUNC(pickUpFlag)},
        {true}
    ] call ace_interact_menu_fnc_createAction;
    [_name, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach _weapons;
