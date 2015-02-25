/*
 * Author: bux578
 * Initializes the player
 *
 * Arguments:
 * 0: player <OBJECT>
 * 1: sides <ARRAY<OBJECT>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _sides] call FUNC(initPlayer)
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_playerUnit", "_sides"];

_playerUnit = _this select 0;
_sides = _this select 1;

if (vehicle _playerUnit == _playerUnit) then {

    [_sides] call FUNC(markAiOnMap);

    _playerUnit setVariable [QGVAR(IsPlayerUnit), true];
    _playerUnit allowDamage false;

    GVAR(OriginalUnit) = _playerUnit;
    //GVAR(OriginalName) = [_playerUnit] call EFUNC(common,getName);
    GVAR(OriginalName) = name _playerUnit;
    GVAR(OriginalGroup) = group _playerUnit;

    // remove all starting gear of a player
    removeAllWeapons _playerUnit;
    removeGoggles _playerUnit;
    removeHeadgear _playerUnit;
    removeVest _playerUnit;
    removeAllAssignedItems _playerUnit;
    clearAllItemsFromBackpack _playerUnit;
    removeBackpack _playerUnit;
    _playerUnit linkItem  "ItemMap";
    removeUniform _playerUnit;

    [_playerUnit, "ACE_SwitchUnits", true] call EFUNC(common,setForceWalkStatus);

    [_playerUnit, _sides] call FUNC(addMapFunction);
};
