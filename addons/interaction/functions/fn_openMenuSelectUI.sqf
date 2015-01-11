// by commy2

private ["_unit", "_vehicle", "_cargo"];

_unit = _this select 0;
_vehicle = _this select 1;

// allow interaction with all cargo slots and all ffv slots
_cargo = [_vehicle, ["cargo", "ffv"], true] call AGM_Core_fnc_getVehicleCrew;

// you can only interact if you are in cargo or ffv yourself. exit otherwise
if !(_unit in _cargo) exitWith {};

AGM_InteractionMenu_Crew = _cargo;

// prepare: add header and "OK" button to select menu
private "_actions";
_actions = [localize "STR_AGM_Interaction_InteractionMenu", localize "STR_AGM_Interaction_Interact"] call AGM_Interaction_fnc_prepareSelectMenu;

// prepare: add all cargo units as options to select menu
{
  if (_x != _unit) then {
    _actions = [
      _actions,
      [_x] call AGM_Core_fnc_getName,
      "\AGM_Interaction\UI\dot_ca.paa",
      _forEachIndex
    ] call AGM_Interaction_fnc_AddSelectableItem;
  };
} forEach _cargo;

// open select menu
[
  _actions,
  {
    call AGM_Interaction_fnc_hideMenu;
    [0, AGM_InteractionMenu_Crew select _this, ""] spawn AGM_Interaction_fnc_showMenu;
    AGM_InteractionMenu_Crew = nil;
  },
  {
    call AGM_Interaction_fnc_hideMenu;
  }
] call AGM_Interaction_fnc_openSelectMenu;
