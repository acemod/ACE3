#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Pass throwable to another unit.
 *
 * Arguments:
 * 0: Unit that passes the throwable <OBJECT>
 * 1: Unit to pass the throwable to <OBJECT>
 * 2: Throwable classname <STRING>
 * 3: Play passing animation <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _target, "HandGrenade"] call ace_interaction_fnc_passThrowable
 *
 * Public: No
 */

params ["_player", "_target", "_throwable", ["_animate", true, [true]]];
TRACE_4("Pass throwable params",_player,_target,_throwable,_animate);

if (_throwable isEqualTo "") exitWith {ERROR("No throwable specified.")};
if !([_target, _throwable] call CBA_fnc_canAddItem) exitWith {ERROR("Cannot add throwable to target due to lack of inventory space.")};

private _allOccurrencesOfThrowable = (magazinesAmmoFull _player) select {(_x select 0) == _throwable};
if (_allOccurrencesOfThrowable isEqualTo []) exitWith {ERROR("Throwable not in the inventory of player.")};

private _cfgThrowable = configFile >> "CfgMagazines" >> _throwable;
if ((getNumber (_cfgThrowable >> "count")) == 1) then {
    // Optimized and straightforward case, as most throwables only have an ammo count of 1
    _player removeItem _throwable;
    _target addItem _throwable;
} else {
    // Some throwables have more than 1 ammo count ("vn_v40_grenade_mag")

    // Get highest ammo count available
    private _highestAmmoCount = (_allOccurrencesOfThrowable select 0) select 1;
    {
        _x params ["", "_ammoCount"];

        if (_ammoCount > _highestAmmoCount) then {
            _highestAmmoCount = _ammoCount;
        };
    } forEach _allOccurrencesOfThrowable;

    TRACE_2("Passing throwable with most ammo",_throwable,_highestAmmoCount);
    [_player, _throwable, _highestAmmoCount] call EFUNC(common,removeSpecificMagazine);
    _target addMagazine [_throwable, _highestAmmoCount];
};

if (_animate) then {[_player, "PutDown"] call EFUNC(common,doGesture)};

private _playerName = [_player] call EFUNC(common,getName);
private _displayName = getText (_cfgThrowable >> "displayName");
[QEGVAR(common,displayTextStructured), [[LSTRING(PassThrowableHint), _playerName, _displayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
