/*
 * Author: KoffeinFlummi
 *
 * Takes an item, preferrably from the cursorTarget first.
 *
 * Arguments:
 * 0: The unit that does the treating.
 * 1: The unit being treated.
 * 2: The desired item (classname).
 *
 * Return Value:
 * True if item was successfully take, false otherwise.
 */

private ["_unit", "_target", "_item", "_config", "_displayName"];

_unit = _this select 0;
_target = _this select 1;
_item = _this select 2;
_config = configFile >> "CfgWeapons" >> _item >> "displayName";
_displayName = getText _config;

if ((_target == _unit) and (_item in items _unit)) exitWith {
  _unit removeItem _item;
  True
};

if (_item in (items _target)) exitWith {
  if ([_target] call AGM_Core_fnc_isPlayer) then {
    systemChat format [localize "STR_AGM_Medical_TakingItemPatient", _displayName];
  };
  _target removeItem _item;
  if (!(local _target) and isPlayer _target) then {
    [[_unit, _item, _config, _target], "{systemChat format [localize 'STR_AGM_Medical_TakingYourItem', [_this select 0] call AGM_Core_fnc_getName, getText (_this select 2)];}", _target] call AGM_Core_fnc_execRemoteFnc;
  };
  True
};

if (_item in (items _unit)) exitWith {
  _unit removeItem _item;
  if ([_unit] call AGM_Core_fnc_isPlayer) then {
    systemChat format [localize "STR_AGM_Medical_TakingItemSelf", _displayName];
  };
  True
};

[localize "STR_AGM_Medical_NoItem"] call AGM_Core_fnc_displayTextStructured;
False
