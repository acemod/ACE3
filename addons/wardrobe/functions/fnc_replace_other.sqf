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
 * [_player, _cfg_origin, _cfg_tgt] call ace_wardrobe_fnc_replace_facewear
 *
 * Public: No
 */

params ["_player", "_cfg_origin", "_cfg_tgt", "_additionalParams"];

switch (_additionalParams) do {
    case "HEADGEAR": {
        removeHeadgear _player;
        _player addHeadgear configName _cfg_tgt;
    };
    case "FACEWEAR": {
        removeGoggles _player;
        _player addGoggles configName _cfg_tgt;
    };
};
