/*
 * Author: NouberNou and esteldunedain
 * Compile the self action menu from config for an object's class
 *
 * Argument:
 * 0: Object or class name <OBJECT> or <STRING>
 * 1: Actions class name <STRING> (Default "ACE_SelfActions")
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp";

private ["_target", "_actionsClassName"];
_target = _this select 0;
_actionsClassName = if ((count _this) > 1) then {_this select 1} else {"ACE_SelfActions"};

[_target, _actionsClassName, true] call FUNC(compileMenu);
