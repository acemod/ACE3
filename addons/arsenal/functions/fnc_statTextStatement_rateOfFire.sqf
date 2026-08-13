#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Rate of fire text statement.
 *
 * Arguments:
 * 0: Stats array (not used) <ARRAY>
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["", "_config"];
TRACE_1("statTextStatement_rateOfFire",_config);

private _modes = getArray (_config >> "modes");

if (_modes isEqualTo []) exitWith {"PEWPEWPEW"};

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

if (!finite _fireRate || {_fireRate <= 0}) exitWith {"PEWPEWPEW"};

format ["%1 rpm", round (60 / _fireRate)]
