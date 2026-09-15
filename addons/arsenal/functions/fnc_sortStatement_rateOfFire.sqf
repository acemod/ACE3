#include "..\script_component.hpp"
/*
 * Author: Alganthe, Brett Mayson
 * Statement to sort weapons by their rate of fire.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Sorting Value <NUMBER>
 *
 * Public: No
*/

params ["_config"];

private _modes = getArray (_config >> "modes");

if (_modes isEqualTo []) exitWith {0};

private _fireRate = 1e40;

{
    private _weaponConfig = if (_x == "this") then {
        _config
    } else {
        _config >> _x
    };

    if (getNumber (_weaponConfig >> "showToPlayer") != 0) then {
        _fireRate = _fireRate min (getNumber (_weaponConfig >> "reloadTime"));
    };
} forEach _modes;

if (!finite _fireRate || {_fireRate <= 0}) exitWith {0};

round (60 / _fireRate)
