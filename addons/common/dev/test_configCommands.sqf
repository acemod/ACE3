#include "..\script_component.hpp"

// johnb43
// ["configCommands"] call ace_common_fnc_runTests;

INFO("Checking config commands");

private _testPass = true;

private _cases = [QGVAR(test1), QGVAR(test2), QGVAR(test3), QGVAR(test4), QGVAR(test5)];
private _base = configFile >> QGVAR(configCommandTestClasses);

// Subclasses only, no inheritance
private _configClasses = _cases apply {"true" configClasses (_base >> _x)};
private _configProperties = _cases apply {configProperties [_base >> _x, "isClass _x", false]};

if (_configClasses isNotEqualTo _configProperties) then {
    ERROR_2("Config commands (1) not behaving as expected: %1 - %2",_configClasses,_configProperties);
    _testPass = false;
};

// Specific subclass only, no inheritance
_configClasses = _cases apply {QUOTE(configName _x == QQGVAR(subclass1)) configClasses (_base >> _x)};
_configProperties = _cases apply {configProperties [_base >> _x, QUOTE(configName _x == QQGVAR(subclass1)), false]};

if (_configClasses isNotEqualTo _configProperties) then {
    ERROR_2("Config commands (2) not behaving as expected: %1 - %2",_configClasses,_configProperties);
    _testPass = false;
};

_configClasses = _cases apply {QUOTE(configName _x == QQGVAR(subclass2)) configClasses (_base >> _x)};
_configProperties = _cases apply {configProperties [_base >> _x, QUOTE(configName _x == QQGVAR(subclass2)), false]};

if (_configClasses isNotEqualTo _configProperties) then {
    ERROR_2("Config commands (3) not behaving as expected: %1 - %2",_configClasses,_configProperties);
    _testPass = false;
};

// Test if attribute is inherited or not
_configProperties = _cases apply {(configProperties [_base >> _x, "configName _x == 'test'", false]) isNotEqualTo []};
private _inheritsFrom = _cases apply {(_base >> _x) == inheritsFrom (_base >> _x >> "test")};

if (_configProperties isNotEqualTo _inheritsFrom) then {
    ERROR_2("Config commands (4) not behaving as expected: %1 - %2",_configProperties,_inheritsFrom);
    _testPass = false;
};

_testPass // return
