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

// objNull is never local
if (!local _HC1 && !isNull _HC1) then {
    _idHC1 = owner _HC1;
    _currentHC = 1;
};

if (!local _HC2 && !isNull _HC2) then {
    _idHC2 = owner _HC2;

    if (_currentHC == 0) then {
        _currentHC = 2;
    };
};

if (!local _HC3 && !isNull _HC3) then {
    _idHC3 = owner _HC3;

    if (_currentHC == 0) then {
        _currentHC = 3;
    };
};

if (_currentHC == 0) exitWith {
    TRACE_1("No Valid HC to transfer to",_currentHC);

    if (XGVAR(log)) then {
        INFO("No Valid HC to transfer to");
    };
};

// Prepare statistics
private _numTransferredHC1 = 0;
private _numTransferredHC2 = 0;
private _numTransferredHC3 = 0;

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
        if (!_force && {(owner _x) in [_idHC1, _idHC2, _idHC3]}) exitWith {
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

    switch (_currentHC) do {
        case 1: {
            if (_loadBalance) then {
                // Find the next valid HC
                // If none are valid, _currentHC will remain the same
                if (_idHC2 != -1) then {
                    _currentHC = 2;
                } else {
                    if (_idHC3 != -1) then {
                        _currentHC = 3;
                    };
                };
            };

            // Don't transfer if it's already local to HC1
            if (_previousOwner == _idHC1) exitWith {};

            [QGVAR(groupTransferPre), [_x, _HC1, _previousOwner, _idHC1], _previousOwner] call CBA_fnc_ownerEvent; // API
            [QGVAR(groupTransferPre), [_x, _HC1, _previousOwner, _idHC1], _idHC1] call CBA_fnc_ownerEvent; // API

            private _transferred = _x setGroupOwner _idHC1;

            [QGVAR(groupTransferPost), [_x, _HC1, _previousOwner, _idHC1, _transferred], _previousOwner] call CBA_fnc_ownerEvent; // API
            [QGVAR(groupTransferPost), [_x, _HC1, _previousOwner, _idHC1, _transferred], _idHC1] call CBA_fnc_ownerEvent; // API

            if (_transferred) then {
                _numTransferredHC1 = _numTransferredHC1 + 1;
            };
        };
        case 2: {
            if (_loadBalance) then {
                // Find the next valid HC
                // If none are valid, _currentHC will remain the same
                if (_idHC3 != -1) then {
                    _currentHC = 3;
                } else {
                    if (_idHC1 != -1) then {
                        _currentHC = 1;
                    };
                };
            };

            // Don't transfer if it's already local to HC2
            if (_previousOwner == _idHC2) exitWith {};

            [QGVAR(groupTransferPre), [_x, _HC2, _previousOwner, _idHC2], _previousOwner] call CBA_fnc_ownerEvent; // API
            [QGVAR(groupTransferPre), [_x, _HC2, _previousOwner, _idHC2], _idHC2] call CBA_fnc_ownerEvent; // API

            private _transferred = _x setGroupOwner _idHC2;

            [QGVAR(groupTransferPost), [_x, _HC2, _previousOwner, _idHC2, _transferred], _previousOwner] call CBA_fnc_ownerEvent; // API
            [QGVAR(groupTransferPost), [_x, _HC2, _previousOwner, _idHC2, _transferred], _idHC2] call CBA_fnc_ownerEvent; // API

            if (_transferred) then {
                _numTransferredHC2 = _numTransferredHC2 + 1;
            };
        };
        case 3: {
            if (_loadBalance) then {
                // Find the next valid HC
                // If none are valid, _currentHC will remain the same
                if (_idHC1 != -1) then {
                    _currentHC = 1;
                } else {
                    if (_idHC2 != -1) then {
                        _currentHC = 2;
                    };
                };
            };

            // Don't transfer if it's already local to HC3
            if (_previousOwner == _idHC3) exitWith {};

            [QGVAR(groupTransferPre), [_x, _HC3, _previousOwner, _idHC3], _previousOwner] call CBA_fnc_ownerEvent; // API
            [QGVAR(groupTransferPre), [_x, _HC3, _previousOwner, _idHC3], _idHC3] call CBA_fnc_ownerEvent; // API

            private _transferred = _x setGroupOwner _idHC3;

            [QGVAR(groupTransferPost), [_x, _HC3, _previousOwner, _idHC3, _transferred], _previousOwner] call CBA_fnc_ownerEvent; // API
            [QGVAR(groupTransferPost), [_x, _HC3, _previousOwner, _idHC3, _transferred], _idHC3] call CBA_fnc_ownerEvent; // API

            if (_transferred) then {
                _numTransferredHC3 = _numTransferredHC3 + 1;
            };
        };
    };
} forEach allGroups;

if (XGVAR(log)) then {
    private _numTransferredTotal = _numTransferredHC1 + _numTransferredHC2 + _numTransferredHC3;
    INFO_4("Groups Transferred: Total: %1 - HC1: %2 - HC2: %3 - HC3: %4",_numTransferredTotal,_numTransferredHC1,_numTransferredHC2,_numTransferredHC3);
};

// Allow rebalance flag
GVAR(inRebalance) = false;
