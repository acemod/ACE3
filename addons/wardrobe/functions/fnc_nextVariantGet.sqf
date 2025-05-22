#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Context Menu - Return config the "next" variant - if multiple Variants are defined, it will choose randomly.
 * Maintains a History of the current and chosen variants as long as the Inventory is open.
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
 * _cfgCurrent call ace_wardrobe_fnc_nextVariantGet
 *
 * Public: No
 */


params ["_cfgCurrent"];

private _cfgModifiableTo = [_cfgCurrent, false] call FUNC(getItemsModifiableTo);

if (_cfgModifiableTo isEqualTo []) exitWith {false};

private _cfgHistory = missionNamespace getVariable [QGVAR(variantHistory), ""];

if (_cfgHistory isEqualTo "") then {
    
    _cfgHistory = [];
    _cfgHistory pushBackUnique _cfgCurrent;

    missionNamespace setVariable [QGVAR(variantHistory), _cfgHistory];

    ACE_player addEventHandler ["InventoryClosed", {
        missionNamespace setVariable [QGVAR(variantHistory), nil ];
        player removeEventHandler [_thisEvent, _thisEventhandler];
    }];
};


private _remaining = _cfgModifiableTo - _cfgHistory;

_remaining = _remaining select { [ace_player, _cfgCurrent, _x] call FUNC(canModifyTo) };

// Returns ether a random remaining item or alternatively, a random one from the complete array.
private _return = if (_remaining isNotEqualTo []) then {
    selectRandom _remaining
} else {
    // _cfgHistory select { !(_x in _cfgModifiableTo) };
    _cfgHistory = [];
    missionNamespace setVariable [QGVAR(variantHistory), [] ];
    _cfgHistory pushBackUnique _cfgCurrent;
    selectRandom _cfgModifiableTo;
};

_cfgHistory pushBackUnique _return;
_return
