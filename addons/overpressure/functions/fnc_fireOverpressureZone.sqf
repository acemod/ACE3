/*
 * Author: commy2 and esteldunedain
 * Handle fire of local vehicle weapons creating overpressure zones
 * Called from firedEHOP, only for local vehicles
 *
 * Arguments:
 * 0: Vehicle that fired <OBJECT>
 * 1: Weapon fired <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [tank, "cannon_125mm", "cannon_125mm", "player", "Sh_125mm_APFSDS_T_Green", "24Rnd_125mm_APFSDS_T_Green", projectile] call ace_overpressure_fnc_fireOverpressureZone
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_firer", "_weapon", "_muzzle", "", "_ammo", "_magazine", "_projectile"];
TRACE_6("params",_firer,_weapon,_muzzle,_ammo,_magazine,_projectile);

// Prevent AI from causing overpressure damage (NOTE: Vehicle is local, but turret gunner may not be)
if !([gunner _firer] call EFUNC(common,isPlayer)) exitWith {};

private _position = getPosASL _projectile;
private _direction = vectorDir _projectile;

// Bake variable name and check if the variable exists, call the caching function otherwise
private _varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
private _var = if (isNil _varName) then {
    [_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues);
} else {
    missionNameSpace getVariable _varName;
};
_var params["_dangerZoneAngle","_dangerZoneRange","_dangerZoneDamage"];
TRACE_3("cache",_dangerZoneAngle,_dangerZoneRange,_dangerZoneDamage);

// Damage to others
private _affected = (ASLtoAGL _position) nearEntities ["CAManBase", _dangerZoneRange];

// Let each client handle their own affected units
["overpressure", _affected, [_firer, _position, _direction, _weapon, _magazine, _ammo]] call EFUNC(common,targetEvent);

// Draw debug lines
#ifdef DEBUG_MODE_FULL
    [   _position,
        _position vectorAdd (_direction vectorMultiply _dangerZoneRange),
        [1,0,0,1]
    ] call EFUNC(common,addLineToDebugDraw);

    private _ref = _direction call EFUNC(common,createOrthonormalReference);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _dangerZoneRange) vectorAdd ((_ref select 1) vectorMultiply _dangerZoneRange * tan _dangerZoneAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _dangerZoneRange) vectorDiff ((_ref select 1) vectorMultiply _dangerZoneRange * tan _dangerZoneAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _dangerZoneRange) vectorAdd ((_ref select 2) vectorMultiply _dangerZoneRange * tan _dangerZoneAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);
    [   _position,
        _position vectorAdd (_direction vectorMultiply _dangerZoneRange) vectorDiff ((_ref select 2) vectorMultiply _dangerZoneRange * tan _dangerZoneAngle),
        [1,1,0,1]
    ] call EFUNC(common,addLineToDebugDraw);

#endif
