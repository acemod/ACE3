#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL;}] call CBA_fnc_addEventHandler;

private _cfgWeapons = configFile >> "CfgWeapons";
private _weapons = (call (uiNamespace getVariable [QGVAR(flagItems), {[]}])) apply {_cfgWeapons >> _x};

{
    private _name = configName _x;
    private _vehicle = getText (_x >> QGVAR(vehicle));
    private _displayName = getText (_x >> "displayName");
    private _picture = getText (_x >> "picture");
    GVAR(flagCache) set [_name, [_vehicle, _displayName, _picture]];

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
