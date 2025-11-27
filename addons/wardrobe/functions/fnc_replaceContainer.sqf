#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a units wearable container while maintaining the content of the container.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Desired variant as classname <STRING>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "U_B_CTRG_3", "UNIFORM"] call ace_wardrobe_fnc_replaceContainer
 * [player, "U_B_CTRG_1", "UNIFORM"] call ace_wardrobe_fnc_replaceContainer
 *
 * Public: No
 */

params ["_player", "_classTarget", "_equipmentType"];

private _allMags = (magazinesAmmoFull _player) apply { _x#0 };

// Identify Exceptions
private _exceptions = []; // nested Array of [Classname, Array of old ID's, Array of new id's]
{
    private _className = _x;
    if (_className in _allMags) then {
        _exceptions pushBack [
            _className,
            [_player, _className] call CBA_fnc_getMagazineIndex,
            []
        ];
    };
} forEach keys GVAR(exceptions);

// Use command instead of cba fnc to maintain acre radios
private _loadout = getUnitLoadout _player;

private _variables = [];

// Replace Wearable Container
switch (_equipmentType) do {
    case "UNIFORM":  {
        private _uniform = uniformContainer _player;
        if !(isNull _uniform) then {
            {
                _variables pushBack [_x, _uniform getVariable _x];
            } forEach allVariables _uniform;
        };
        _loadout # 3 set [0, _classTarget];
    };
    case "VEST":     {
        private _vest = vestContainer _player;
        if !(isNull _vest) then {
            {
                _variables pushBack [_x, _vest getVariable _x];
            } forEach allVariables _vest;
        };
        _loadout # 4 set [0, _classTarget];
    };
    case "BACKPACK": {
        private _backpack = backpackContainer _player;
        if !(isNull _backpack) then {
            {
                _variables pushBack [_x, _backpack getVariable _x];
            } forEach allVariables _backpack;
        };
        _loadout # 5 set [0, _classTarget];
    };
};

// Apply new loadout
_player setUnitLoadout _loadout;

// Update Exceptions with new magID's
{ _x set [ 2, [_player, _x#0] call CBA_fnc_getMagazineIndex ]; } forEach _exceptions;


// Resolve Exceptions
{
    switch (GVAR(exceptions) get (_x#0) select 0) do {
        case "local": { [QGVAR(exceptions), _x] call CBA_fnc_localEvent; };
        case "server": { [QGVAR(exceptions), _x] call CBA_fnc_serverEvent; };
    };
} forEach _exceptions;

// Apply variables from the old container to the new one
switch (_equipmentType) do {
    case "UNIFORM":  {
        private _uniform = uniformContainer _player;
        if !(isNull _uniform) then {
            {
                _uniform setVariable _x;
            } forEach _variables;
        };
    };
    case "VEST":     {
        private _vest = vestContainer _player;
        if !(isNull _vest) then {
            {
                _vest setVariable _x;
            } forEach _variables;
        };
    };
    case "BACKPACK": {
        private _backpack = backpackContainer _player;
        if !(isNull _backpack) then {
            {
                _backpack setVariable _x;
            } forEach _variables;
        };
    };
};

GVAR(inProgress) = false; // re-enable action

nil
