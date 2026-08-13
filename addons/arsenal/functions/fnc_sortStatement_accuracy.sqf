#include "..\script_component.hpp"
/*
 * Author: Alganthe, Brett Mayson
 * Statement to sort weapons by their accuracy.
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

private _dispersion = 1e40;

{
    private _weaponConfig = if (_x == "this") then {
        _config
    } else {
        _config >> _x
    };

    if (getNumber (_weaponConfig >> "showToPlayer") != 0) then {
        _dispersion = _dispersion min (getNumber (_weaponConfig >> "dispersion"));
    };
} forEach (getArray (_config >> "modes"));

if (!finite _dispersion || {_dispersion <= 0}) exitWith {10000000};

10000000 - round ((log _dispersion) * 100000)
