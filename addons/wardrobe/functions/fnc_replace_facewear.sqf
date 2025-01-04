#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to replace a persons goggles/facewear.
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

params ["_player", "_cfg_origin", "_cfg_tgt"];
removeGoggles _player;
_player addGoggles configName _cfg_tgt;
