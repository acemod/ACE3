// by commy2

private "_name";

_name = name (_this select 0);

[_name, "{if (serverCommandAvailable '#kick') then {serverCommand format['#kick %1', _this]}}"] call GVAR(fnc_execRemoteFnc);
