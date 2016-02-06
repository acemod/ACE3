/*
 * Author: esteldunedain
 * Unfied handling of weapon fire
 *
 * Argument:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(firedEH);

params ["_firedEHUnit", "_firedEHWeapon", "_firedEHMuzzle", "_firedEHMode", "_firedEHAmmo", "_firedEHMagazine", "_firedEHProjectile"];
TRACE_7("firedEH:",_firedEHUnit, _firedEHWeapon, _firedEHMuzzle, _firedEHMode, _firedEHAmmo, _firedEHMagazine, _firedEHProjectile);

if (_firedEHUnit isKindOf "CAManBase") then {
    // The unit it on foot
    if (_firedEHUnit == ACE_player) then {
        ["firedPlayer", this] call FUNC(localEvent);
    } else {
        if ([_firedEHUnit] call EFUNC(common,isPlayer)) then {
            ["firedPlayerNonLocal", this] call FUNC(localEvent);
        } else {
            ["firedNonPlayer", this] call FUNC(localEvent);
        };
    };
} else {
    // The unit is a vehicle
    private _firedEHGunner = [_firedEHUnit, _firedEHWeapon] call EFUNC(common,getGunner);
    if (_firedEHGunner == ACE_player) then {
        ["firedPlayerVehicle", this] call FUNC(localEvent);
    } else {
        if ([_firedEHGunner] call EFUNC(common,isPlayer)) then {
            ["firedPlayerVehicleNonLocal", this] call FUNC(localEvent);
        } else {
            ["firedNonPlayerVehicle", this] call FUNC(localEvent);
        };
    };
};

END_COUNTER(firedEH);
