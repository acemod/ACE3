// by commy2
#include "script_component.hpp"

private ["_unit", "_vehicle", "_cargo"];

_unit = _this select 0;
_vehicle = _this select 1;

// allow interaction with all cargo slots and all ffv slots
_cargo = [_vehicle, ["cargo", "ffv"], true] call EFUNC(common,getVehicleCrew);

// you can only interact if you are in cargo or ffv yourself. exit otherwise
if !(_unit in _cargo) exitWith {};

GVAR(InteractionMenu_Crew) = _cargo;

// prepare: add header and "OK" button to select menu
private "_actions";
_actions = [localize "STR_ACE_Interaction_InteractionMenu", localize "STR_ACE_Interaction_Interact"] call FUNC(prepareSelectMenu);

// prepare: add all cargo units as options to select menu
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

// open select menu
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
