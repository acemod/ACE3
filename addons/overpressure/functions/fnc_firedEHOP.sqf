#include "..\script_component.hpp"
/*
 * Author: joko // Jonas
 * Handle fire of Vehicle Weapons. Called from the unified fired EH only for the local player vehicle.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, "cannon_125mm", "cannon_125mm", "player", "Sh_125mm_APFSDS_T_Green", "24Rnd_125mm_APFSDS_T_Green", projectile] call ace_overpressure_fnc_firedEHOP
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
TRACE_8("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner);

// Retrieve overpressure values
private _opValues = [_weapon, _ammo, _magazine] call FUNC(getOverPressureValues);

_opValues params ["_dangerZoneAngle", "_dangerZoneRange", "_dangerZoneDamage"];
_dangerZoneRange = _dangerZoneRange * GVAR(overpressureDistanceCoefficient);

TRACE_3("cache",_dangerZoneAngle,_dangerZoneRange,_dangerZoneDamage);

if (_dangerZoneDamage <= 0) exitWith {};

// The weapon produces overpressure, calculate
private _position = getPosASL _projectile;
private _direction = vectorDir _projectile;

// Damage to others
private _affected = (ASLToAGL _position) nearEntities ["CAManBase", _dangerZoneRange];

// Let each client handle their own affected units
["ace_overpressure", [_unit, _position, _direction, _weapon, _magazine, _ammo], _affected] call CBA_fnc_targetEvent;

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
