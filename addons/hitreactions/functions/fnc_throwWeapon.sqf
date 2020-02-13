#include "script_component.hpp"
/*
 * Author: commy2
 * Makes the unit throw their currently selected weapon.
 * Unit must be local and not inside a vehicle or attached to another object.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Weapon Holder
 *
 * Example:
 * player call ace_hitreactions_fnc_throwWeapon
 *
 * Public: No
 */

#define OFFSET_LATERAL 0.59
#define THROW_ANGLE 63.43
#define THROW_VELOCITY 1.5
#define THROW_TORQUE 0.2

params ["_unit"];

private _weapon = currentWeapon _unit;
if (!isNull objectParent _unit || _weapon isEqualTo "") exitWith {objNull};

private _data = weaponsItems _unit select {_x select 0 == _weapon} select 0;

private _holder = createVehicle ["WeaponHolderSimulated", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_holder addWeaponWithAttachmentsCargoGlobal [_data, 1];

private _vDir = _unit weaponDirection _weapon;
private _vLat = vectorNormalized (_vDir vectorCrossProduct [0, 0, 1]);
private _vUp = _vLat vectorCrossProduct _vDir;

private _position = _unit modelToWorldWorld (_unit selectionPosition "RightHand") vectorAdd (_vLat vectorMultiply OFFSET_LATERAL);
private _velocity = vectorNormalized (_vDir vectorAdd (_vUp vectorMultiply tan THROW_ANGLE)) vectorMultiply THROW_VELOCITY vectorAdd velocity _unit;

_unit removeWeapon _weapon;
_holder setPosWorld _position;
_holder setVectorDirAndUp [_vUp, _vLat];
_holder setVelocity _velocity;
_holder addTorque (call CBA_fnc_randomVector3D vectorMultiply THROW_TORQUE);

["ACE_weaponThrown", [_unit, _holder, _data]] call CBA_fnc_localEvent;

_holder // return
