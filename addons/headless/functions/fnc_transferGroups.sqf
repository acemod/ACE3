#include "script_component.hpp"
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

GVAR(headlessClients) params [
    ["_HC1", objNull, [objNull]],
    ["_HC2", objNull, [objNull]],
    ["_HC3", objNull, [objNull]]
];

if (XGVAR(log)) then {
    INFO_2("Present HCs: %1 - Full Rebalance: %2",GVAR(headlessClients),_force);
};

// Enable round-robin load balancing if more than one HC is present
private _loadBalance = [false, true] select (count GVAR(headlessClients) > 1);

// Get IDs and determine first HC to start with
private _idHC1 = -1;
private _idHC2 = -1;
private _idHC3 = -1;
private _currentHC = 0;

if (!local _HC1) then {
    _idHC1 = owner _HC1;
    _currentHC = 1;
};

if (!local _HC2) then {
    _idHC2 = owner _HC2;

    if (_currentHC == 0) then {
        _currentHC = 2;
    };
};

if (!local _HC3) then {
    _idHC3 = owner _HC3;

    if (_currentHC == 0) then {
        _currentHC = 3;
    };
};

// Prepare statistics
private _numTransferredHC1 = 0;
private _numTransferredHC2 = 0;
private _numTransferredHC3 = 0;

// Transfer AI groups
{
    // No transfer if empty group
    private _transfer = !(units _x isEqualTo []) && {!(_x getVariable [QXGVAR(blacklist), false])};
    if (_transfer) then {
        // No transfer if waypoints with synchronized triggers exist for the group
        private _allWaypointsWithTriggers = (waypoints _x) select {!((synchronizedTriggers _x) isEqualTo [])};
        if !(_allWaypointsWithTriggers isEqualTo []) exitWith {
            _transfer = false;
        };

        {
            // No transfer if already transferred
            if (!_force && {(owner _x) in [_idHC1, _idHC2, _idHC3]}) exitWith {
                _transfer = false;
            };

            // No transfer if player in this group
            if (isPlayer _x) exitWith {
                _transfer = false;
            };

            // No transfer if any unit in group is blacklisted
            if (_x getVariable [QXGVAR(blacklist), false]) exitWith {
                _transfer = false;
            };

            // No transfer if vehicle unit is in or crew in that vehicle is blacklisted
            if (vehicle _x != _x && {(vehicle _x) getVariable [QXGVAR(blacklist), false]}) exitWith {
                _transfer = false;
            };

            // Save gear if unit about to be transferred with current loadout (naked unit work-around)
            if (XGVAR(transferLoadout) == 1) then {
                _x setVariable [QGVAR(loadout), getUnitLoadout _x, true];
            };
        } forEach (units _x);
    };

    // Round robin between HCs if load balance enabled, else pass all to one HC
    if (_transfer) then {
        switch (_currentHC) do {
            case 1: {
                private _transferred = _x setGroupOwner _idHC1;
                if (_loadBalance) then {
                    _currentHC = [3, 2] select (!local _HC2);
                };
                if (_transferred) then {
                    _numTransferredHC1 = _numTransferredHC1 + 1;
                };
            };
            case 2: {
                private _transferred = _x setGroupOwner _idHC2;
                if (_loadBalance) then {
                    _currentHC = [1, 3] select (!local _HC3);
                };
                if (_transferred) then {
                    _numTransferredHC2 = _numTransferredHC2 + 1;
                };
            };
            case 3: {
                private _transferred = _x setGroupOwner _idHC3;
                if (_loadBalance) then {
                    _currentHC = [2, 1] select (!local _HC1);
                };
                if (_transferred) then {
                    _numTransferredHC3 = _numTransferredHC3 + 1;
                };
            };
            default {
                TRACE_1("No Valid HC to transfer to", _currentHC);
            };
        };
    };
} forEach allGroups;

if (XGVAR(log)) then {
    private _numTransferredTotal = _numTransferredHC1 + _numTransferredHC2 + _numTransferredHC3;
    INFO_4("Groups Transferred: Total: %1 - HC1: %2 - HC2: %3 - HC3: %4", _numTransferredTotal, _numTransferredHC1, _numTransferredHC2, _numTransferredHC3);
};

// Allow rebalance flag
GVAR(inRebalance) = false;
