#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL;}] call CBA_fnc_addEventHandler;

[QGVAR(flagPlaced), {
    params ["_unit", "_item", "_flag"];

    (GVAR(flagItemCache) get _item) params ["_flagName"];

    private _pickupFlag = [
        QGVAR(pickup),
        format [LLSTRING(Pickup), _flagName],
        QPATHTOF(data\icons\place\white_pickup_icon.paa),
        {
            params ["_flag", "_unit", "_item"];
            [_unit, _item, _flag] call FUNC(pickupFlag);
        },
        {[_player, _target] call EFUNC(common,canInteractWith)},
        {},
        _item,
        [0, -0.45, 0.75],
        2
    ] call EFUNC(interact_menu,createAction);
    [_flag, 0, [], _pickupFlag] call EFUNC(interact_menu,addActionToObject);
}] call CBA_fnc_addEventHandler;
