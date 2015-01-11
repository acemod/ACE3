// by commy2

#define FORBIDDEN_KEYS [42, 54, 29, 157, 56, 184, 0, 183, 197, 1]

_key = _this select 1;
_shft = _this select 2;
_ctrl = _this select 3;
_alt =_this select 4;

if (_key in FORBIDDEN_KEYS) exitWith {true};

_keyCode = [_key, _shft, _ctrl, _alt] call FUNC(convertKeyCode);

_keyIndex = floor _keyCode;
_time = time;

if (_time < (GVAR(keyTimes) select _keyIndex) + 0.5 && {_keyIndex == _keyCode}) then {_keyCode = _keyIndex + 0.8};
if (GVAR(keyStates) select _keyIndex > 1) exitWith {true};
if (GVAR(keyStates) select _keyIndex > 0 && {_keyIndex == _keyCode}) then {_keyCode = _keyIndex + 0.9};

GVAR(keyStates) set [_keyIndex, (GVAR(keyStates) select _keyIndex) + 1];
GVAR(keyTimes) set [_keyIndex, _time];

GVAR(keyNewTemp) = [_key, [_shft, _ctrl, _alt], _keyCode];
true
