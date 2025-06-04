#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a person's goggles/facewear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Desired variant as classname <STRING>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "G_Bandanna_blk", FACEWEAR] call ace_wardrobe_fnc_replaceOther
 * [player, "G_Bandanna_aviator", FACEWEAR] call ace_wardrobe_fnc_replaceOther
 *
 * Public: No
 */

params ["_unit", "_classTarget", "_equipmentType"];

switch (_equipmentType) do {
    case "HEADGEAR": {
        removeHeadgear _unit;
        _unit addHeadgear _classTarget;
    };
    case "FACEWEAR": {
        removeGoggles _unit;
        _unit addGoggles _classTarget;
    };
};
