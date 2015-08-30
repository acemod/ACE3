/*
 * Author: commy2 and esteldunedain
 *
 * Handle fire of local vehicle weapons creating overpressure zones
 *
 * Arguments:
 * 0: Unit that fired <OBJECT>
 * 1: Weapon fired <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_firer", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
// Prevent AI from causing overpressure damage
if !([gunner _firer] call EFUNC(common,isPlayer)) exitWith {};  //@todo non-maingun turrets?

private ["_position", "_direction"];

_position = getPosASL _projectile;
_direction = vectorDir _projectile;

private ["_var", "_varName", "_dangerZoneAngle", "_dangerZoneRange", "_dangerZoneDamage"];

// Bake Variablen Name and Check if the Variable Exist else call the Cache Function
_varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
_var = if (isNil _varName) then {
    [_weapon, _ammo, _magazine] call FUNC(cacheOverPressureVales);
} else {
    missionNameSpace getVariable _varName;
};
_var params["_dangerZoneAngle","_dangerZoneRange","_dangerZoneDamage"];

// Damage to others
private "_affected";
_affected = getPos _projectile nearEntities ["CAManBase", _dangerZoneRange];

// Let each client handle their own affected units
["overpressure", _affected, [_firer, _position, _direction, _weapon, _magazine, _ammo]] call EFUNC(common,targetEvent);

// Draw debug lines
#ifdef DEBUG_MODE_FULL
    [   _position,
        _position vectorAdd (_direction vectorMultiply _dangerZoneRange),
        [1,0,0,1]
    ] call EFUNC(common,addLineToDebugDraw);

    private "_ref";
    _ref = _direction call EFUNC(common,createOrthonormalReference);
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
