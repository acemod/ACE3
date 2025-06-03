#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a person's goggles/facewear.
 *
 * Arguments:
 * 0: Unit <Object>
 * 1: Desired variant <CONFIG>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _cfgTarget, _equipmentType] call ace_wardrobe_fnc_replaceOther
 *
 * Public: No
 */

params ["_player", "_cfgTarget", "_equipmentType"];

switch (_equipmentType) do {
    case "HEADGEAR": {
        removeHeadgear _player;
        _player addHeadgear configName _cfgTarget;
    };
    case "FACEWEAR": {
        removeGoggles _player;
        _player addGoggles configName _cfgTarget;
    };
};
