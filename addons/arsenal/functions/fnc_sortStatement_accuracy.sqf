#include "script_component.hpp"
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

private _fireModes = getArray (_config >> "modes");
private _dispersion = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") != 0) then {
        private _n = log getNumber (_config >> _x >> "dispersion");

        if (!finite _n) then {
            _n = 0;
        };

        _dispersion pushBackUnique _n;
    };
} foreach _fireModes;

_dispersion sort true;

10000000 - round ((_dispersion param [0, 0]) * 100000)
