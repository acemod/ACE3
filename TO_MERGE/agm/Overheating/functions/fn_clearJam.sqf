// by commy2

private ["_unit", "_weapon", "_skipAnim", "_jammedWeapons"];

_unit = _this select 0;
_weapon = _this select 1;
_skipAnim = _this select 2;

_jammedWeapons = _unit getVariable ["AGM_Overheating_jammedWeapons", []];

if (_weapon in _jammedWeapons) then {
  _jammedWeapons = _jammedWeapons - [_weapon];

  _unit setVariable ["AGM_Overheating_jammedWeapons", _jammedWeapons];

  if (count _jammedWeapons == 0) then {
    private "_id";

    _id = _unit getVariable ["AGM_JammingActionID", -1];
    //_unit removeAction _id;
    //[_unit, "DefaultAction", _id] call AGM_Core_fnc_removeActionMenuEventHandler;
    [_unit, "DefaultAction", _id] call AGM_Core_fnc_removeActionEventHandler;
    _unit setVariable ["AGM_JammingActionID", -1];
  };

  if !(_skipAnim) then {
    private "_clearJamAction";

    _clearJamAction = getText (configFile >> "CfgWeapons" >> _weapon >> "AGM_clearJamAction");

    if (_clearJamAction == "") then {
      _clearJamAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
    };

    _unit playActionNow _clearJamAction;
  };

  [localize "STR_AGM_Overheating_WeaponUnjammed"] call AGM_Core_fnc_displayTextStructured;
};
