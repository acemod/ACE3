#include "..\script_component.hpp"
/*
 * Author: PabstMirror, OverlordZorn
 * Function to check if the provided Unit has a wirecutter.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * hasWirecutter <BOOL>
 *
 * Example:
 * [cursorObject] call ace_logistics_wirecutter_fnc_hasWirecutter
 *
 * Public: yes
 */

params ["_unit"];

((_unit call EFUNC(common,uniqueItems)) arrayIntersect GVAR(possibleWirecutters)) isNotEqualTo []
|| {getNumber ((configOf (backpackContainer _unit)) >> QGVAR(hasWirecutter)) == 1}
|| {getNumber (configFile >> "CfgWeapons" >> (vest _unit) >> QGVAR(hasWirecutter)) == 1} // vestContainer returns something like "Supply140".
