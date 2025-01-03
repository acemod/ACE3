#include "../../script_component.hpp"

/*
* Author: Zorn
* function to return cfg the next variant. the choosen variant will be added to a gvar of previous variants. the array of possible variants has been exhausted, it will remove all possible variants from the backlog and start new.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
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
    _history_cfg = []; // _history_cfg select { !(_x in _modifiableTo_cfg) };
    missionNamespace setVariable [QGVAR(variant_history_cfg), [] ];
    _history_cfg pushBackUnique _cfg_current;
    selectRandom _modifiableTo_cfg;
};

_history_cfg pushBackUnique _return;
_return