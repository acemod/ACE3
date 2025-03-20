#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Context Menu - Return config the "next" variant - if multiple Variants are defined, it will choose randomly.
 * Maintains a Histroy of the current and chosen variants as long as the Inventory is open.
 * Already used variants from the History will be removed from the availabe options.
 * Once all options have been exhausted, the history will be purged and start over.
 *
 * Arguments:
 * 0: Current Variant <CONFIG>
 *
 * Return Value:
 * Desired Variant <CONFIG>
 *
 * Example:
 * [_cfg_current] call ace_wardrobe_fnc_getNextVariant
 *
 * Public: No
 */


params ["_cfg_current"];

private _modifiableTo_cfg = [_cfg_current, false] call FUNC(getItems_modifiableTo);

if (count _modifiableTo_cfg == 0) exitWith {false};

private _history_cfg = missionNamespace getVariable [QGVAR(variant_history_cfg), "404"];

if (_history_cfg isEqualTo "404") then {
    
    _history_cfg = [];
    _history_cfg pushBackUnique _cfg_current;

    missionNamespace setVariable [QGVAR(variant_history_cfg), _history_cfg];

    player addEventHandler ["InventoryClosed", {
        missionNamespace setVariable [QGVAR(variant_history_cfg), nil ];
        player removeEventHandler [_thisEvent, _thisEventhandler];
    }];
};


private _remaining = _modifiableTo_cfg - _history_cfg;


// Returns ether a random remaining item or alternatively, a random one from the complete array.
private _return = if (count _remaining > 0) then {
    selectRandom _remaining
} else {
    // _history_cfg select { !(_x in _modifiableTo_cfg) };
    _history_cfg = [];
    missionNamespace setVariable [QGVAR(variant_history_cfg), [] ];
    _history_cfg pushBackUnique _cfg_current;
    selectRandom _modifiableTo_cfg;
};

_history_cfg pushBackUnique _return;
_return
