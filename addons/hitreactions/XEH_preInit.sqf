#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["ACE3 Weapons", QGVAR(ThrowWeapon), [LSTRING(ThrowWeapon), LSTRING(ThrowWeaponTooltip)], {
    ACE_player call FUNC(throwWeapon);
    false
}, {false}, [0, [false, false, false]], false] call CBA_fnc_addKeybind;

[QGVAR(minDamageToTrigger), "SLIDER", LSTRING(minDamageToTriggerFall), localize ELSTRING(common,ACEKeybindCategoryWeapons), [-1, 1, 0.1, 1]] call CBA_fnc_addSetting;
[QGVAR(minDamageToTriggerThrow), "SLIDER", LSTRING(minDamageToTriggerThrow), localize ELSTRING(common,ACEKeybindCategoryWeapons), [-1, 1, 0.1, 1]] call CBA_fnc_addSetting;

["CAManBase", "Hit", {_this call FUNC(handleHit)}] call CBA_fnc_addClassEventHandler;

ADDON = true;
