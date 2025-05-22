#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a person's goggles/facewear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Current Variant <CONFIG>
 * 2: Desired Variant <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _cfgOrigin, _cfgTarget] call ace_wardrobe_fnc_replaceOther
 *
 * Public: No
 */

params ["_player", "_cfgOrigin", "_cfgTarget", "_additionalParams"];

switch (_additionalParams) do {
    case "HEADGEAR": {
        removeHeadgear _player;
        _player addHeadgear configName _cfgTarget;
    };
    case "FACEWEAR": {
        removeGoggles _player;
        _player addGoggles configName _cfgTarget;
    };
};
