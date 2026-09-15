#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Kills a unit without changing visual appearance.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason for death (only used if ace_medical is loaded) <STRING> (default: "")
 * 2: Killer (vehicle that killed unit) <OBJECT> (default: objNull)
 * 3: Instigator (unit who pulled trigger) <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "", player, player] call ace_common_fnc_setDead;
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_reason", "", [""]], ["_source", objNull, [objNull]], ["_instigator", objNull, [objNull]]];

if (!local _unit) exitWith {
    WARNING_1("setDead executed on non-local unit - %1",_this);
};

if (GETEGVAR(medical,enabled,false)) then {
    [_unit, _reason, _source, _instigator] call EFUNC(medical_status,setDead);
} else {
    // From 'ace_medical_status_fnc_setDead': Kill the unit without changing visual appearance

    // (#8803) Reenable damage if disabled to prevent having live units in dead state
    // Keep this after death event for compatibility with third party hooks
    if (!isDamageAllowed _unit) then {
        WARNING_1("setDead executed on unit with damage blocked - %1",_this);
        _unit allowDamage true;
    };

    private _currentDamage = _unit getHitPointDamage "HitHead";

    _unit setHitPointDamage ["HitHead", 1, true, _source, _instigator];

    _unit setHitPointDamage ["HitHead", _currentDamage, true, _source, _instigator];
};
