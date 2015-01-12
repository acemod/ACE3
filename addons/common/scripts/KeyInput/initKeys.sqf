// by commy2
#include "\z\ace\addons\common\script_component.hpp"

_config = configFile >> QGVAR(Default_Keys);
_count = count _config;

_header = format ["_keyCode = [_this select 1, _this select 2, _this select 3, _this select 4] call %1; _keyIndex = floor _keyCode; if (_keyIndex == 0) exitWith {false}; if (!(profileNamespace getVariable ['ACE_enableNumberHotkeys', true]) && {_keyIndex < 12} && {_keyIndex > 1} && {_keyCode mod 1 == 0}) exitWith {false}; _time = time; _player = ACE_player; _vehicle = vehicle _player; _isInput = false;", QUOTE(FUNC(convertKeyCode))];
_headerUp = format ["_keyCode = _this select 1; _keyIndex = _keyCode; if (_keyIndex == 0) exitWith {false}; _time = time; _player = ACE_player; _vehicle = vehicle _player;"];

_handleDoubleTap = QUOTE(if (_time < (GVAR(keyTimes) select _keyIndex) + 0.5 && {_keyIndex == _keyCode}) then {_keyCode = _keyIndex + 0.8};);
_handleHold = QUOTE(_allowHold = false; _disallowHold = false; if (GVAR(keyStates) select _keyIndex > 1) exitWith {false}; if (GVAR(keyStates) select _keyIndex > 0) then {_keyCode = _keyIndex + 0.9};);
_handleHoldUp = QUOTE(if (GVAR(keyStates) select _keyIndex > 1) then {_keyCode = _keyIndex + 0.9};);

_debug = format ["if (!isNil 'ACE_Debug' && {'Keys' in ACE_Debug}) then {systemChat (str _keyCode + ' ' + str (%1 select _keyIndex))};", QGVAR(keyStates)];

_onKeyDown = "" + _debug;
_onKeyUp = "" + _debug;

for "_index" from 0 to (_count - 1) do {
  _configFile = _config select _index;

  _keyName = configName _configFile;
  _condition = getText (_configFile >> "condition");
  if (_condition == "") then {_condition = "true"};

  _statement = getText (_configFile >> "statement");

  _exceptions = getArray (_configFile >> "exceptions");
  _canInteract = format ["%1 call GVAR(canInteract)", _exceptions];

  _conditionName = format ["ACE_Key_%1_Condition", _keyName];
  _statementName = format ["ACE_Key_%1_Statement", _keyName];
  missionNamespace setVariable [_conditionName, compileFinal _condition];
  missionNamespace setVariable [_statementName, compileFinal _statement];

  _handleHolding = ["_disallowHold = true;", "_allowHold = true;"] select (getNumber (_configFile >> "allowHolding") == 1);

  if (_statement != "") then {
    _entry = format ["if (_keyCode == profileNamespace getVariable 'ACE_Key_%1' && {call %2}) then {if (%4) then {call %3};%5 _isInput = true;};", _keyName, _conditionName, _statementName, _canInteract, _handleHolding];
    _onKeyDown = _onKeyDown + _entry;
  };

  _condition = getText (_configFile >> "conditionUp");
  if (_condition == "") then {_condition = "true"};

  _statement = getText (_configFile >> "statementUp");

  _conditionName = format ["ACE_Key_%1_ConditionUp", _keyName];
  _statementName = format ["ACE_Key_%1_StatementUp", _keyName];
  missionNamespace setVariable [_conditionName, compileFinal _condition];
  missionNamespace setVariable [_statementName, compileFinal _statement];

  if (_statement != "") then {
    _entry = format ["if (_keyCode == floor (profileNamespace getVariable 'ACE_Key_%1') && {call %2}) then {call %3; _isInput = true;};", _keyName, _conditionName, _statementName];
    _onKeyUp = _onKeyUp + _entry;
  };
};

_halt = format ["if (!(_allowHold) || {_disallowHold}) then {%1 set [_keyIndex, (%1 select _keyIndex) + 1]; %2 set [_keyIndex, _time];};", QGVAR(keyStates), QGVAR(keyTimes)];
_haltUp = format ["%1 set [_keyIndex, 0];", QGVAR(keyStates)];

//_return = "_isInput";
_return = "if (profileNamespace getVariable ['ACE_enableNumberHotkeys', true] && {_keyIndex < 12} && {_keyIndex > 1}) then {true} else {_isInput}";

_repeat = "if (!_isInput && {_keyCode mod 1 > 0.75} && {_keyCode mod 1 < 0.85}) exitWith {_keyCode = _keyIndex; " + _onKeyDown + _return + "};";
_repeatUp = "if (!_isInput && {_keyCode mod 1 > 0.75} && {_keyCode mod 1 < 0.85}) exitWith {_keyCode = _keyIndex; " + _onKeyUp + "};";

_onKeyDown = _header + _handleDoubleTap + _handleHold + _onKeyDown + _halt + _repeat + _return;
_onKeyUp = _headerUp + _onKeyUp + _haltUp + _repeatUp;  //_headerUp + _handleHoldUp + _onKeyUp + _haltUp + _repeatUp;

GVAR(onKeyDown) = compileFinal _onKeyDown;
GVAR(onKeyUp) = compileFinal _onKeyUp;
