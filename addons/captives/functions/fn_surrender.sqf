// by commy2

private ["_unit", "_state"];

_unit = _this select 0;
_state = _this select 1;

if (!local _unit) exitWith {[_this, _fnc_scriptName, _unit] call AGM_Core_fnc_execRemoteFnc};

if (_state) then {
  if (_unit getVariable ["AGM_isSurrender", false]) exitWith {};

  _unit setVariable ["AGM_isSurrender", true, true];
  [_unit, "AGM_Surrendered", true] call AGM_Core_fnc_setCaptivityStatus;

  _unit spawn {
    // fix for lowered rifle animation glitch
    if (currentWeapon _this != "" && {currentWeapon _this == primaryWeapon _this} && {weaponLowered _this} && {stance _this == "STAND"}) then {
      _this playMove "amovpercmstpsraswrfldnon";
    };

    while {_this getVariable ["AGM_isSurrender", false]} do {
      sleep 0.001; //sleep in UI

      if (isPlayer _this) then {showHUD false};

      if (!alive _this || {_this getVariable ["AGM_isUnconscious", false]}) then {
        _this setVariable ["AGM_isSurrender", false, true];
      } else {
        _this playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
      };
    };
    if !(_this getVariable ["AGM_isUnconscious", false]) then {
      _this playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
    } else {
      _this playMoveNow "unconscious";
    };

    [_this, "AGM_Surrendered", false] call AGM_Core_fnc_setCaptivityStatus;

    if (isPlayer _this) then {showHUD true};
  };
} else {
  _unit setVariable ["AGM_isSurrender", false, true];
};

/*
player playMove "AmovPercMstpSsurWnonDnon"
player switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"
*/
