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

params ["_player", "_classTarget", "_typeNumber"];

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

// Backup all vars stored on current containers
private _containerVars = [];
{
    private _item = _x;
    private _itemVars = [];
    _containerVars pushBack _itemVars;
    if (isNull _item) then { continue };
    {
        _itemVars pushBack [_x, _item getVariable _x];
    } forEach allVariables _item;
} forEach [uniformContainer _player, vestContainer _player, backpackContainer _player];

// Replace Wearable Container
switch (_typeNumber) do {
    case TYPE_UNIFORM:  { _loadout # 3 set [0, _classTarget]; };
    case TYPE_VEST:     { _loadout # 4 set [0, _classTarget]; };
    case TYPE_BACKPACK: { _loadout # 5 set [0, _classTarget]; };
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
{
    private _item = _x;
    private _itemVars = _containerVars select _forEachIndex;
    if (isNull _item) then { continue };
    {
        _x params ["_varName", "_varValue"];
        private _sync = GVAR(containerVarsToTransfer) get toLower _varName;
        TRACE_3("restore",_varName,_varValue,_sync);
        if (isNil "_sync") then { continue; };
        _item setVariable [_varName, _varValue, _sync];
    } forEach _itemVars;
} forEach [uniformContainer _player, vestContainer _player, backpackContainer _player];

GVAR(inProgress) = false; // re-enable action

nil
