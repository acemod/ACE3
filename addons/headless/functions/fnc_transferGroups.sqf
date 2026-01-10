#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Transfers AI groups to Headess Client(s).
 *
 * Arguments:
 * 0: Force <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_headless_fnc_transferGroups
 *
 * Public: No
 */

params ["_force"];

// Filter out any invalid entries
GVAR(headlessClients) = GVAR(headlessClients) select {!isNull _x};

// Don't want to filter out local HCs permanently, as bad locality could be temporary
private _HCs = GVAR(headlessClients) select {!local _x};
private _countHC = count _HCs;

if (_countHC == 0) exitWith {
    TRACE_1("No Valid HC to transfer to",GVAR(headlessClients));

    if (XGVAR(log)) then {
        INFO("No Valid HC to transfer to");
    };
};

if (XGVAR(log)) then {
    INFO_2("Present HCs: %1 - Full Rebalance: %2",GVAR(headlessClients),_force);
};

// Enable round-robin load balancing if more than one HC is present
private _loadBalance = _countHC > 1;
private _currentIndexHC = 0;

// Get IDs
private _idsHC = _HCs apply {owner _x};

// Prepare statistics
private _numTransferred = [];
_numTransferred resize [_countHC, 0];

// Transfer AI groups
{
    private _units = units _x;

    // No transfer if empty group or if group is blacklisted
    if (_units isEqualTo [] || {_x getVariable [QXGVAR(blacklist), false]}) then {
        continue;
    };

    // No transfer if waypoints with synchronized triggers exist for the group
    if (((waypoints _x) select {(synchronizedTriggers _x) isNotEqualTo []}) isNotEqualTo []) then {
        continue;
    };

    private _transfer = true;

    {
        // No transfer if already transferred
        if (!_force && {(owner _x) in _idsHC}) exitWith {
            _transfer = false;
        };

        // No transfer if any unit in group is blacklisted
        if (_x getVariable [QXGVAR(blacklist), false]) exitWith {
            _transfer = false;
        };

        // No transfer if player or UAV in this group
        if (isPlayer _x || {unitIsUAV _x}) exitWith {
            _transfer = false;
        };

        private _vehicle = objectParent _x;

        // No transfer if the vehicle the unit is in or if the crew in that vehicle is blacklisted
        if ((_vehicle getVariable [QXGVAR(blacklist), false]) || {unitIsUAV _vehicle}) exitWith {
            _transfer = false;
        };

        // Save gear if unit about to be transferred with current loadout (naked unit work-around)
        if (XGVAR(transferLoadout) == 1) then {
            _x setVariable [QGVAR(loadout), _x call CBA_fnc_getLoadout, true];
        };
    } forEach _units;

    if (!_transfer) then {
        continue;
    };

    // Round robin between HCs if load balance enabled, else pass all to one HC
    private _previousOwner = groupOwner _x;
    private _HC = _HCs select _currentIndexHC;
    private _idHC = _idsHC select _currentIndexHC;

    // Don't transfer if it's already local to HC
    if (_previousOwner != _idHC) then {
        [QGVAR(groupTransferPre), [_x, _HC, _previousOwner, _idHC], _previousOwner] call CBA_fnc_ownerEvent; // API
        [QGVAR(groupTransferPre), [_x, _HC, _previousOwner, _idHC], _idHC] call CBA_fnc_ownerEvent; // API

        private _transferred = _x setGroupOwner _idHC;

        [QGVAR(groupTransferPost), [_x, _HC, _previousOwner, _idHC, _transferred], _previousOwner] call CBA_fnc_ownerEvent; // API
        [QGVAR(groupTransferPost), [_x, _HC, _previousOwner, _idHC, _transferred], _idHC] call CBA_fnc_ownerEvent; // API

        if (_transferred) then {
            _numTransferred set [_currentIndexHC, (_numTransferred select _currentIndexHC) + 1];
        };
    };

    // Find the next valid HC if more than one HC is present
    if (_loadBalance) then {
        if (_currentIndexHC < _countHC) then {
            _currentIndexHC = _currentIndexHC + 1;
        } else {
            _currentIndexHC = 0;
        };
    };
} forEach allGroups;

if (XGVAR(log)) then {
    private _numTransferredTotal = 0;

    {
        _numTransferredTotal = _numTransferredTotal + _x;
    } forEach _numTransferred;

    INFO_2("Groups Transferred: Total: %1 - per HC: %2",_numTransferredTotal,_numTransferred);
};

// Allow rebalance flag
GVAR(inRebalance) = false;
