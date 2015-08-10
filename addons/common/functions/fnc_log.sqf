// by commy2
#include "script_component.hpp"

if ((_this select 0) in (missionNamespace getVariable ["ACE_Debug", []])) then {
    _this resize 4;

    PARAMS_4(_type,_argument,_function,_showInGame);

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

    diag_log text format ["[ACE] Debug: %1 : %2 - %3 : %4", _type, diag_frameno, _fnc_scriptNameParent, _result];
};
