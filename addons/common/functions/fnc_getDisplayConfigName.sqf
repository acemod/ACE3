/*
 * Author: commy2
 * Get display classnames from config with given idd.
 *
 * Arguments:
 * 0: Display ID (idd) <NUMBER>
 *
 * Return Value:
 * Display Classnames <ARRAY>
 *
 * Public: Yes
 *
 * Note: Really slow due to iteration through whole config. Meant for debugging.
 */
#include "script_component.hpp"

params ["_idd"];

private ["_configNames", "_config"];

_configNames = [];

for "_index" from 0 to (count configFile - 1) do {
    _config = configFile select _index;

    if (isClass _config && {isNumber (_config >> "idd")} && {getNumber (_config >> "idd") == _idd}) then {
        _configNames pushBack configName _config;
    };
};

_configNames
