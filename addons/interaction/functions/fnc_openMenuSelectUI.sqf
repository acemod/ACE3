/*
 * Author: commy2
 * Opens menu select UI
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [unit, vehicle] call ace_interaction_fnc_openMenuSelectUI
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_cargo", "_actions"];
params ["_unit", "_vehicle"];

// Allow interaction with all cargo slots and all FFV slots
_cargo = [_vehicle, ["cargo", "ffv"], true] call EFUNC(common,getVehicleCrew);

// You can only interact if you are in cargo or FFV yourself. exit otherwise
if !(_unit in _cargo) exitWith {};

GVAR(InteractionMenu_Crew) = _cargo;

// Prepare: add header and "OK" button to select menu
_actions = [localize LSTRING(InteractionMenu), localize LSTRING(Interact)] call FUNC(prepareSelectMenu);

// Prepare: add all cargo units as options to select menu
{
    if (_x != _unit) then {
        _actions = [
            _actions,
            [_x] call EFUNC(common,getName),
            QUOTE(PATHTOF(UI\dot_ca.paa)),
            _forEachIndex
        ] call FUNC(addSelectableItem);
    };
} forEach _cargo;

// Open select menu
[
    _actions,
    {
        call FUNC(hideMenu);
        [0, GVAR(InteractionMenu_Crew) select _this, ""] spawn FUNC(showMenu);
        GVAR(InteractionMenu_Crew) = nil;
    },
    {
        call FUNC(hideMenu);
    }
] call FUNC(openSelectMenu);
