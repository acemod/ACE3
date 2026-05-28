#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function
 *
 * Arguments:
 * 0: TYPENUMBER <NUMBER>
 *
 * Return Value:
 * Localised Displayname <STRING>
 *
 * Example:
 * TYPE_HMD call ace_wardrobe_fnc_getSlotName;
 *
 * Public: No
 */

params ["_typeNumber"];

switch (_typeNumber) do {
    case TYPE_UNIFORM:  { localize "str_a3_rscdisplayarsenal_tab_uniform" };
    case TYPE_VEST:     { localize "str_a3_rscdisplayarsenal_tab_vest" };
    case TYPE_BACKPACK: { localize "str_a3_rscdisplayarsenal_tab_backpack" };
    case TYPE_HEADGEAR: { localize "str_a3_rscdisplayarsenal_tab_headgear" };
    case TYPE_GOGGLE:   { localize "str_a3_rscdisplayarsenal_tab_goggles" };
    case TYPE_HMD:      { localize "str_a3_rscdisplayarsenal_tab_nvgs" };
    default { "" };
} // return
