#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Rate of fire text statement.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["", "_config"];
TRACE_1("statTextStatement_rateOfFire",_config);

private _fireRate = [];

{
    _fireRate pushBackUnique (getNumber (_config >> _x >> "reloadTime"));
} forEach (getArray (_config >> "modes"));

_fireRate sort true;
_fireRate = _fireRate param [0, 0];

if (_fireRate == 0) exitWith {"PEWPEWPEW"};

format ["%1 rpm", round (60 / _fireRate)]
