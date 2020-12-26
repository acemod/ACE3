#include "script_component.hpp";

["_ammo", "_currentMode"];

if (isNil "_currentMode") then {
    _currentMode = "";
};

private _modes = getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "aceModes");
private _index = _modes find _currentMode;
private _return = "";
if (count _modes > 0) then {_return = _modes select (_index % count _modes)};

_return
