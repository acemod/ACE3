/*
 * Author: commy2
 *
 * Execute all custom event script assigned to this object.
 *
 * Argument:
 * 0: Object the eventhandlers are assigned to or namespace (Object or Namespace)
 * 1: Name of the event (String)
 * 2: Arguments passed to the eventhandler script (Array, optional default: [Object the event handlers are assigned to])
 *
 * Return value:
 * None.
 */

private ["_object", "_type", "_argument", "_name", "_actions"];

_object = _this select 0;
_type = _this select 1;
_argument = _this select 2;

if (isNil "_argument") then {_argument = [_object]};

_name = format ["AGM_CustomEventHandlers_%1", _type];

_actions = (_object getVariable [_name, [-1, [], []]]) select 2;

{
  _argument call _x; nil;
} count _actions;
nil
