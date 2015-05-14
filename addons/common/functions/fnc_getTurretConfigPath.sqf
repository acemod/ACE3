/*
 * Author: commy2
 *
 * Get the config path of a vehicles turret.
 *
 * Argument:
 * 0: vehicles config (Config)
 * 1: Turret index (Array)
 *
 * Return value:
 * Turret config (Config)
 */
#include "script_component.hpp"

private ["_index", "_offset", "_config2", "_foundClasses"];

PARAMS_2(_config,_turretIndex);

for "_index" from 0 to (count _turretIndex - 1) do {
    _config = _config >> "Turrets";

    _offset = 0;
    _config2 = _config select 0;

    _foundClasses = 0;
    for "_a" from 0 to (count _config - 1) do {
        if (isClass _config2) then {
            _foundClasses = _foundClasses + 1;
        } else {
            _offset = _offset + 1;
        };
        _config2 = _config select (_turretIndex select _index) + _offset;

        if (_foundClasses == _turretIndex select _index) exitWith {};
    };
    _config = _config2;
};
_config
