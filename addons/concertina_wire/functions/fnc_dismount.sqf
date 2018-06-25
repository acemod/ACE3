#include "script_component.hpp"
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
 * Example:
 * [wire, bob] call ace_concertina_wire_fnc_dismount
 *
 * Public: No
 */

// If the cursorMenu is open, the loading bar will fail. If we execute the function one frame later, it will work fine
if (uiNamespace getVariable [QEGVAR(interact_menu,cursorMenuOpened),false]) exitWith {
    [{
        _this call FUNC(dismount);
    }, _this] call CBA_fnc_execNextFrame;
};
params ["_wire", "_unit"];

private _config = (configFile >> "CfgVehicles" >> typeOf _unit);
private _delay = [45, 30] select ([_unit] call EFUNC(common,isEngineer) || {[_unit] call EFUNC(common,isEOD)});

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
