#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Adds reload mutex to a player unit, sets variable to prevent gestures from being played during a reload animation
 *
 * Arguments:
 * 0: Player unit <OBJECT>
 *
 * Return Value:
 * None.
 *
 * Example:
 * ACE_player call ace_common_fnc_addReloadMutex
 *
 * Public: No
 */

params ["_unit"];

_unit setVariable [
    QGVAR(reloadMutex_gestureEH),
    _unit addEventHandler ["GestureChanged", {
        params ["_unit", "_gesture"];
        if (GVAR(isReloading) || _gesture == "") exitWith {}; // skip empty gesture (include empty reload actions for binoculars)

        (weaponState ACE_player) params ["_weapon", "_muzzle"];
        if (_weapon isEqualTo "") exitWith {};

        private _reloadAction = [_weapon, _muzzle] call FUNC(getReloadAction);

        // gesture is always lowercase
        if (_gesture isNotEqualTo _reloadAction) exitWith {};

        TRACE_2("Reloading, blocking gestures",weaponState ACE_Player,_gesture);
        GVAR(isReloading) = true;

        private _unitMovesInfo = getUnitMovesInfo _unit; // 6 - gesture elapsed time, 7 - gesture duration
        [{
            if (_this isEqualTo ACE_player) exitWith { // player might switch units again before reload finished
                GVAR(isReloading) = false
            };
        }, _unit, (_unitMovesInfo select 7) - (_unitMovesInfo select 6)] call CBA_fnc_waitAndExecute;
    }]
];

// Some secondary weapons (mainly heavy launchers) have reloads as anims instead of gestures
_unit setVariable [
    QGVAR(reloadMutex_animEH),
    _unit addEventHandler ["AnimChanged", {
        params ["_unit", "_anim"];
        if ((currentWeapon _unit isNotEqualTo secondaryWeapon _unit) || {GVAR(isReloading) || _anim == ""}) exitWith {};

        (weaponState ACE_Player) params ["_weapon", "_muzzle"];
        if (_weapon isEqualTo "") exitWith {};

        private _reloadAction = [_weapon, _muzzle] call FUNC(getReloadAction);

        // anim is always lowercase
        if (_anim isNotEqualTo _reloadAction) exitWith {};

        TRACE_2("Reloading with animation, blocking gestures",weaponState ACE_Player,_anim);
        GVAR(isReloading) = true;

        private _unitMovesInfo = getUnitMovesInfo _unit; // 1 - anim elapsed time, 2 - anim duration
        [{
            if (_this isEqualTo ACE_player) exitWith { // player might switch units again before reload finished
                GVAR(isReloading) = false
            };
        }, _unit, (_unitMovesInfo select 2) - (_unitMovesInfo select 1)] call CBA_fnc_waitAndExecute;
    }]
];
