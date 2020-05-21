#include "script_component.hpp"
/*
 * Author: Alganthe, SynixeBrett
 * Statement for the rate of fire sort.
 *
 * Arguments:
 * 0: item config path (CONFIG)
 *
 * Return Value:
 * Number to sort by
 *
 * Public: No
*/

private _fireModes = getArray (_this >> "modes");
private _fireRate = [];

{
    _fireRate pushBackUnique (getNumber (_this >> _x >> "reloadTime"));
} foreach _fireModes;

_fireRate sort true;
_fireRate param [0, 0]
