/*
 * Author: commy2
 * Reports true if a weapon is a machine gun.
 *
 * Arguments:
 * 0: Weapon class name <STRING>
 *
 * Return Value:
 * Is machine gun <BOOL>
 *
 * Example:
 * (currentWeapon player) call ace_gunbag_fnc_isMachineGun
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_weapon"];

private _config = _weapon call CBA_fnc_getItemConfig;

// definition of a machine gun by BIS_fnc_itemType
private _cursor = getText (_config >> "cursor");

if (toLower _cursor in ["", "emptycursor"]) then {
    _cursor = getText (_config >> "cursorAim");
};

_cursor == "MG"
