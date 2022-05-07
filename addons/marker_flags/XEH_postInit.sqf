#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _weapons = (call (uiNamespace getVariable [QGVAR(flagItems), {[]}])) apply {configFile >> "CfgWeapons" >> _x};

{
    private _name = configName _x;
    private _vehicle = getText (_x >> QGVAR(vehicle));
    GVAR(flagCache) set [_name, _vehicle];

    private _action = [
        QGVAR(pickup),
        LLSTRING(ActionPickUp),
        "",
        {call FUNC(pickUpFlag)},
        {[_player, _target, []] call EFUNC(common,canInteractWith)},
        {},
        [_name]
    ] call EFUNC(interact_menu,createAction);
    [_vehicle, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
} forEach _weapons;
