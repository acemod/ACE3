/*
 * Author: commy2
 *
 * Check if the given unit has it's flashlight attachment turned on.
 *
 * Argument:
 * 0: A unit with gunlight (Object)
 *
 * Return value:
 * Unit has flashlight turned on? (Bool).
 */
#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

private "_weapon";

_weapon = currentWeapon _unit;

// exit if flashlight is turned off
if !(_unit isFlashlightOn _weapon) exitWith {false};

// get type of attachment
private "_gunLight";
_gunLight = switch (_weapon) do {
    case (""): {""};
    case (primaryWeapon _unit): {
        primaryWeaponItems _unit select 1;
    };
    case (secondaryWeapon _unit): {
        secondaryWeaponItems _unit select 1;
    };
    case (handgunWeapon _unit): {
        handgunItems _unit select 1;
    };
    default {""};
};

// return false if the gunlight is a day laser
!(toLower _gunLight in ["ace_acc_pointer_red", "ace_acc_pointer_green"])
