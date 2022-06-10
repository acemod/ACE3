#include "script_component.hpp"

if (!hasinterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL;}] call CBA_fnc_addEventHandler;

[QGVAR(flagPlaced), {
    params ["_unit", "_item", "_flag"];

    (GVAR(cache) get _item) params ["_displayName"];

    private _pickupFlag = [
        QGVAR(pickup),
        format [LLSTRING(pickup), _displayName],
        QPATHTOF(data\icons\place\white_pickup_icon.paa),
        {
            params ["_flag", "_unit", "_args"];
            _args params ["_item"];

            [_unit, _item, _flag] call FUNC(pickupFlag);
        },
        {true},
        {},
        [_item],
        [0, 0, 0],
        PICKUP_RADIUS
    ] call ace_interact_menu_fnc_createAction;
    [_flag, 0, [], _pickupFlag] call ace_interact_menu_fnc_addActionToObject;
}] call CBA_fnc_addEventHandler;

private _flagItems = (call (uiNamespace getVariable [QGVAR(allFlagItems), {[]}])) apply {configFile >> "CfgWeapons" >> _x};
{
    private _name = configName _x;
    private _displayName = getText (_x >> "displayName");
    private _texture = getText (_x >> QGVAR(texture));
    private _actionIconPlace = getText (_x >> QGVAR(actionIconPlace));
    private _actionIconCarry = getText (_x >> QGVAR(actionIconCarry));

    GVAR(flagItemCache) set [_name, [_displayName, _texture, _actionIconPlace, _actionIconCarry]];
} forEach _flagItems;
