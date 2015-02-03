//author : Nic547
//Attaches a Captive to the player

private ["_unit", "_state"];

_unit = _this select 0;
_state = _this select 1;

if !("AGM_Handcuffed" in ([_unit] call AGM_Core_fnc_getCaptivityStatus)) exitWith {
  [localize "STR_AGM_Captives_NoCaptive"] call AGM_Core_fnc_displayTextStructured;
};

if (_state) then {
  if (player getVariable ["AGM_isEscorting", false]) exitWith {};

  [player, _unit] call AGM_Core_fnc_claim;
  player setVariable ["AGM_isEscorting", true, true];

  _unit attachTo [player, [0, 1, 0]];

  player setVariable ["AGM_escortedUnit", _unit, true];
  _actionID = player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_AGM_Captives_StopEscorting"], "[player getVariable ['AGM_escortedUnit', objNull], false] call AGM_Captives_fnc_escortCaptive;", nil, 20, false, true, "", "!isNull (player getVariable ['AGM_escortedUnit', objNull])"];

  [_unit, _actionID] spawn {
    _unit = _this select 0;
    _actionID = _this select 1;

    while {player getVariable ["AGM_isEscorting", false]} do {
      sleep 0.2;

      if (!alive _unit || {!alive player} || {!canStand _unit} || {!canStand player} || {_unit getVariable ["AGM_isUnconscious", false]} || {player getVariable ["AGM_isUnconscious", false]} || {!isNull (attachedTo player)}) then {
        player setVariable ["AGM_isEscorting", false, true];
      };
    };
    [objNull, _unit] call AGM_Core_fnc_claim;

    detach _unit;
    player removeAction _actionID;
  };
} else {
  player setVariable ["AGM_isEscorting", false, true];
  player setVariable ["AGM_escortedUnit", objNull, true];
};
