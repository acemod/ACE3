/*
 * Author: Ruthberg
 *
 * Start dismounting the concertina wire
 *
 * Arguments:
 * 0: wire <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

// If the cursorMenu is open, the loading bar will fail. If we execute the function one frame later, it will work fine
if (uiNamespace getVariable [QEGVAR(interact_menu,cursorMenuOpened),false]) exitWith {
    [{
        _this call FUNC(dismount);
    }, _this] call EFUNC(common,execNextFrame);
};
params ["_wire", "_unit"];

private ["_config", "_delay"];
_config = (configFile >> "CfgVehicles" >> typeOf _unit);
_delay = if (getNumber(_config >> "engineer") == 1 || getNumber(_config >> "canDeactivateMines") == 1) then {60} else {120};

// TODO: Animation?

[
    _delay,
    [_wire],
    {(_this select 0) call FUNC(dismountSuccess)},
    {},
    localize "STR_ACE_UNROLLWIRE",
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
