#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a person's goggles/facewear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Desired variant <CONFIG>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _cfgTarget, _equipmentType] call ace_wardrobe_fnc_replaceOther
 *
 * Public: No
 */

params ["_unit", "_cfgTarget", "_equipmentType"];

switch (_equipmentType) do {
    case "HEADGEAR": {
        removeHeadgear _unit;
        _unit addHeadgear configName _cfgTarget;
    };
    case "FACEWEAR": {
        removeGoggles _unit;
        _unit addGoggles configName _cfgTarget;
    };
};
