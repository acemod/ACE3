/*
 * Author: PabstMirror
 * Checks the conditions for being able to disarm
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: type of disarm <STRING><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, cursorTarget, "backpack"] call ace_disarming_fnc_canDisarm
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_caller,_target);
DEFAULT_PARAM(2,_type,"");

_returnValue = false;

if ((_target getVariable ["ACE_isUnconscious", false]) ||
        {_target getVariable [QEGVAR(captives,isHandcuffed), false]} ||
        {_target getVariable [QEGVAR(captives,isSurrendering), false]}) then {

    switch (toLower _type) do {
    case (""): {_returnValue = true;};
    case ("primaryweapononly"): {_returnValue = ((primaryWeapon _target) != "");};
    case ("secondaryweapononly"): {_returnValue = ((secondaryWeapon _target) != "");};
    case ("handgunweapononly"): {_returnValue = ((handgunWeapon _target) != "");};
    case ("backpack"): {_returnValue = ((backpack _target) != "");};
    case ("alldangerous"): {_returnValue = ((count (weapons _target)) > 0) || {(count (magazines _target)) > 0} || {({_x in DANGEROUS_ITEMS} count ((items _target) + (assignedItems _target))) > 0};};
    case ("strip"): {_returnValue = true;};
        default {systemChat "type unknown"; ERROR("type unknown");};
    };
};

_returnValue
