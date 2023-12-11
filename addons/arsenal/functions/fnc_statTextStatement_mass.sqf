#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the mass stat.
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
TRACE_1("statTextStatement_mass",_config);

private _mass = getNumber (_config >> "mass");

if (_mass == 0 && {isClass (_config >> "itemInfo")}) then {
    _mass = getNumber (_config >> "itemInfo" >> "mass");
};

if (_mass == 0 && {isClass (_config >> "WeaponSlotsInfo")}) then {
    _mass = getNumber (_config >> "WeaponSlotsInfo" >> "mass");
};

format ["%1kg (%2lb)", ((_mass * 0.1 * (1 / 2.2046) * 100) / 100) toFixed 2, ((_mass * 0.1 * 100) / 100) toFixed 2]
