#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL;}] call CBA_fnc_addEventHandler;

private _cfgWeapons = configFile >> "CfgWeapons";
private _weapons = (call (uiNamespace getVariable [QGVAR(flagItems), {[]}])) apply {_cfgWeapons >> _x};

{
    private _name = configName _x;
    private _vehicleClass = getText (_x >> QGVAR(vehicle));
    private _displayName = getText (_x >> "displayName");
    private _icon = getText (_x >> QGVAR(icon));
    GVAR(flagCache) set [_name, [_vehicleClass, _displayName, _icon]];

    private _action = [
        QGVAR(pickup),
        LLSTRING(ActionPickUp),
        QPATHTOF(ui\icons\white_pickup_icon.paa),
        {call FUNC(pickUpFlag)},
        {[_player, _target, []] call EFUNC(common,canInteractWith)},
        {},
        [_name],
        [0, 0.072, 0.2],
        2
    ] call EFUNC(interact_menu,createAction);
    [_vehicleClass, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
} forEach _weapons;
