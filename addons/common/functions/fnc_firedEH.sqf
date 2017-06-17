/*
 * Author: esteldunedain
 * Unfied handling of weapon fire
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "gun", "muzzle", "single", "ammo", "magazine", "bullet"] call ace_common_fnc_firedEH
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(firedEH);

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
TRACE_7("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile);

if (_unit isKindOf "CAManBase") then {
    // The unit it on foot
    if (_unit == ACE_player) then {
        ["ace_firedPlayer", _this] call CBA_fnc_localEvent;
    } else {
        if ([_unit] call EFUNC(common,isPlayer)) then {
            ["ace_firedPlayerNonLocal", _this] call CBA_fnc_localEvent;
        } else {
            ["ace_firedNonPlayer", _this] call CBA_fnc_localEvent;
        };
    };
} else {
    // The unit is a vehicle
    private _vehicle = _unit;

    // Get the gunner and turret path.
    // Code based on FUNC(getGunner), extracted for efficency.
    private _gunner = objNull;
    private _turret = [];
    {
        if (_weapon in (_unit weaponsTurret _x)) exitWith {
            _gunner = _unit turretUnit _x;
            _turret = _x;
        };
        false
    } count allTurrets [_unit, true];
    // Ensure that at least the pilot is returned if there is no gunner
    if (isManualFire _unit && {isNull _gunner}) then {
        _gunner = effectiveCommander _unit;
    };

    if (_gunner == ACE_player) then {
        ["ace_firedPlayerVehicle", _this] call CBA_fnc_localEvent;
    } else {
        if ([_gunner] call EFUNC(common,isPlayer)) then {
            ["ace_firedPlayerVehicleNonLocal", _this] call CBA_fnc_localEvent;
        } else {
            ["ace_firedNonPlayerVehicle", _this] call CBA_fnc_localEvent;
        };
    };
};

END_COUNTER(firedEH);
