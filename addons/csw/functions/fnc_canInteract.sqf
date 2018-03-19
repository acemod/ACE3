/*
 * Author: TCVM
 * Returns if the user can interact with the tripod
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * Can interact with weapon <BOOL>
 *
 * Example:
 * [weapon] call ace_csw_fnc_canMoveTripod
 *
 * Public: No
 */
params["_weapon"];

(!isNull _weapon) && {alive _weapon}

