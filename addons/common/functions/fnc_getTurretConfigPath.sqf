#include "script_component.hpp"
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
 * Example:
 * [CfgVehicle, [Array]] call ace_common_fnc_getTurretConfigPath
 *
 * Public: Yes
 */

params ["_config", "_turretIndex"];

for "_index" from 0 to (count _turretIndex - 1) do {
    _config = _config >> "Turrets";

    private _offset = 0;
    private _config2 = _config select 0;
    private _foundClasses = 0;

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
