// by commy2

if ((_this select 0) in (missionNamespace getVariable ["AGM_Debug", []])) then {
  private ["_type", "_argument", "_function", "_showInGame"];

  _this resize 4;

  _type = _this select 0;
  _argument = _this select 1;
  _function = _this select 2;
  _showInGame = _this select 3;

  if (isNil "_function") then {
    _function = {_this};
  };

  if (isNil "_showInGame") then {
    _showInGame = true;
  };

  private "_result";
  _result = _argument call _function;

  if (_showInGame) then {
    systemChat format ["%1", _result];
  };

  diag_log text format ["[AGM] Debug: %1 : %2 - %3 : %4", _type, diag_frameno, _fnc_scriptNameParent, _result];
};
