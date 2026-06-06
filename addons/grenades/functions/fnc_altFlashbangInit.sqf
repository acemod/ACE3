#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Create flashbang effect on ammo explode, should be called from ammo init EH
 *
 * Arguments:
 * 0: Flashbang grenade <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_grenades_fnc_altFlashbangInit
 *
 * Public: No
 */

params ["_ammo"];
if (isNull _ammo || {!(_ammo getShotInfo 5)}) exitWith {};

_ammo addEventHandler ["Explode", { 
    params ["_projectile"];
    TRACE_1("altFlashbangInit explode",_projectile);
    [_projectile] call FUNC(flashbangThrownFuze); // calls global event
}];
