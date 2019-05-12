#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _replacementItems = [];

{
    _replacementItems pushBack [configName _x, getArray _x];
} forEach configProperties [configFile >> QEGVAR(medical,replacementItems), "isArray _x"];

uiNamespace setVariable [QGVAR(replacementItems), _replacementItems];
