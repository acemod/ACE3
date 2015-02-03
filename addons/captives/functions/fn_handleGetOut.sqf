// by commy2

private ["_vehicle", "_unit", "_cargoIndex"];

_vehicle = _this select 0;
_unit = _this select 2;

_cargoIndex = _unit getVariable ["AGM_Captives_CargoIndex", -1];

if (_cargoIndex != -1) exitWith {
  _unit moveInCargo [_vehicle, _cargoIndex];
};

[_unit, 'AGM_AmovPercMstpScapWnonDnon', 2] call AGM_Core_fnc_doAnimation;
