#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Context Menu. Return config of the "next" variant - if multiple variants are defined, it will choose randomly.
 * Maintains a history of the current and chosen variants as long as the inventory is open.
 * Already used variants from the hstory will be removed from the availabe options.
 * Once all options have been exhausted, the history will be reset.
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 *
 * Return Value:
 * Desired variant <CONFIG>
 *
 * Example:
 * [configFile >> "CfgWeapons" >> "U_B_CTRG_1", player] call ace_wardrobe_fnc_nextVariantGet
 *
 * Public: No
 */

params ["_cfgCurrent", "_player"];

private _cfgModifiableTo = [_cfgCurrent, false] call FUNC(getItemsModifiableTo);

if (_cfgModifiableTo isEqualTo []) exitWith { configNull };

private _cfgHistory = missionNamespace getVariable [QGVAR(variantHistory), nil];

if (isNil "_cfgHistory") then {
    
    _cfgHistory = [];
    _cfgHistory pushBackUnique _cfgCurrent;

    missionNamespace setVariable [QGVAR(variantHistory), _cfgHistory];

    _player addEventHandler ["InventoryClosed", {
        GVAR(variantHistory) = nil;
        ACE_player removeEventHandler [_thisEvent, _thisEventhandler];
    }];
};

private _remaining = _cfgModifiableTo - _cfgHistory;

_remaining = _remaining select { [_player, _cfgCurrent, _x] call FUNC(canModifyTo) };

// returns either a random remaining item or alternatively, a random one from the complete array
private _return = if (_remaining isNotEqualTo []) then {
    selectRandom _remaining
} else {
    _cfgHistory = [];
    missionNamespace setVariable [QGVAR(variantHistory), []];
    _cfgHistory pushBackUnique _cfgCurrent;
    selectRandom _cfgModifiableTo;
};

_cfgHistory pushBackUnique _return;
_return
