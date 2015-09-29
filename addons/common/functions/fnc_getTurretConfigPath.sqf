/*
 * Author: commy2
 * Get the config path of a vehicles turret.
 *
 * Arguments:
 * 0: Vehicle Config <CONFIG>
 * 1: Turret indecies <ARRAY>
 *
 * Return Value:
 * Turret config <CONFIG>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_config", "_turretIndex"];

private ["_offset", "_config2", "_foundClasses"];

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
