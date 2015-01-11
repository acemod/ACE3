/*
 * Author: commy2
 *
 * Execute all custom event script assigned to this object on every machine.
 *
 * Argument:
 * 0: Object the eventhandlers are assigned to or namespace (Object or Namespace)
 * 1: Name of the event (String)
 * 2: Arguments passed to the eventhandler script (Array, optional default: [Object the event handlers are assigned to])
 *
 * Return value:
 * None.
 */

[_this, "GVAR(fnc_callCustomEventHandlers)", 2] call GVAR(fnc_execRemoteFnc);
