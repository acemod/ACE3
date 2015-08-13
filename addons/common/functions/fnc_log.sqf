/*
 * Author: commy2
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_type", "_argument", ["_function", {_this}], ["_showInGame", true]];
if (_type in (missionNamespace getVariable ["ACE_Debug", []])) then {

    private "_result";
    _result = _argument call _function;

    if (_showInGame) then {
        systemChat format ["%1", _result];
    };

    diag_log text format ["[ACE] Debug: %1 : %2 - %3 : %4", _type, diag_frameno, _fnc_scriptNameParent, _result];
};
