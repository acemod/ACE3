#include "..\script_component.hpp"
/*
 * Author: bux578
 * Initializes the player
 *
 * Arguments:
 * 0: player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_switchunits_fnc_initPlayer
 *
 * Public: No
 */

params ["_playerUnit"];

if (isNull objectParent _playerUnit) then {
    [GVAR(switchableSides)] call FUNC(markAiOnMap);

    _playerUnit setVariable [QGVAR(IsPlayerUnit), true, true];
    _playerUnit allowDamage false;

    GVAR(OriginalUnit) = _playerUnit;
    GVAR(OriginalName) = name _playerUnit;
    GVAR(OriginalGroup) = group _playerUnit;

    // remove all starting gear of a player
    removeAllWeapons _playerUnit;
    removeGoggles _playerUnit;
    removeHeadgear _playerUnit;
    removeAllAssignedItems _playerUnit;
    removeAllContainers _playerUnit;
    _playerUnit linkItem  "ItemMap";

    [_playerUnit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

    [] call FUNC(addMapFunction);
};
