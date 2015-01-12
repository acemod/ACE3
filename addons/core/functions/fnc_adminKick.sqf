// by commy2
#include "\z\ace\addons\core\script_component.hpp"

private "_name";

_name = name (_this select 0);

[_name, "{if (serverCommandAvailable '#kick') then {serverCommand format['#kick %1', _this]}}"] call FUNC(execRemoteFnc);
