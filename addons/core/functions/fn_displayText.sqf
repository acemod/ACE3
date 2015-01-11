/*
 * Author: commy2
 *
 * Display a message.
 *
 * Argument:
 * 0: Message (String)
 * 1: Play a clicking sound (Bool, optional default: false)
 * 2: How long before hiding the message in seconds (Number, optional default: 2 sec)
 * 3: Priority, higher priority messages will override lesser important ones (Number, optional default: 0)
 *
 * Return value:
 * Nothing
 */

#define DEFAULT_PLAY_SOUND false
#define DEFAULT_DELAY 2
#define DEFAULT_PRIORITY 0

if (isNil "GVAR(lastHint)") then {
  GVAR(lastHint) = [0, 0];
};

_this resize 4;

_this spawn {
  private ["_text", "_sound", "_delay", "_priority", "_lastHintTime", "_lastHintPriority", "_time"];

  _text = _this select 0;
  _sound = _this select 1;
  _delay = _this select 2;
  _priority = _this select 3;

  _lastHintTime = GVAR(lastHint) select 0;
  _lastHintPriority = GVAR(lastHint) select 1;

  if !(typeName _text in ["STRING", "TEXT"]) then {_text = str _text};
  if (isNil "_sound") then {_sound = DEFAULT_PLAY_SOUND};
  if (isNil "_delay") then {_delay = DEFAULT_DELAY};
  if (isNil "_priority") then {_priority = DEFAULT_PRIORITY};

  _time = time;
  if (_time > _lastHintTime + _delay || {_priority >= _lastHintPriority}) then {
    hintSilent _text;
    if (_sound) then {playSound "AGM_Sound_Click"};
    GVAR(lastHint) set [0, _time];
    GVAR(lastHint) set [1, _priority];

    sleep _delay;
    if (_time == GVAR(lastHint) select 0) then {hintSilent ""};
  };
};
