#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define ACE_BASE_BULLET_LENGTH 32.893
#define __VEHICLE_CLASS configFile >> "CfgVehicles" >> (typeOf _vehicle)
#define __PROJECTILE_CLASS configFile >> "CfgAmmo" >> (_ammo select 4)

private["_impactSurfaceType", "_isDirectHit", "_command", "_model", "_projectileType"];
private["_penetrationOrthogonalDepth", "_penetrationAngleDepth", "_penetrationCosAngle", "_projectileCaliber", "_projectileDensity", "_projectileLength", "_armorDensity"];
EXPLODE_9_PVT((_this select 0),_vehicle,_shooter,_projectile,_impactPosition,_projectileVelocity,_selection,_ammo,_surfaceDirection,_radius);
_impactSurfaceType = (_this select 0) select 9;
_isDirectHit = (_this select 0) select 10;
TRACE_2("",_impactSurfaceType,_isDirectHit);

_projectileType = (getNumber (__PROJECTILE_CLASS >> "ACE_projectileType") );

_projectileDensity = getNumber (__PROJECTILE_CLASS >> "ACE_bulletDensity");
_projectileLength = (getNumber (__PROJECTILE_CLASS >> "ACE_bulletLength") ) * 1000; // fucking inches dafuq!?!?!?
_projectileDiameter = (getNumber (__PROJECTILE_CLASS >> "ACE_caliber") ) * 1000;  // fucking inches dafuq!?!?!?
_projectileCaliber = getNumber (__PROJECTILE_CLASS >> "caliber");

_frastumLength = (getNumber (__PROJECTILE_CLASS >> "ACE_frastumLength") ) * 1000;
_frastumDiameter = (getNumber (__PROJECTILE_CLASS >> "ACE_frastumDiameter") ) * 1000;

_model = getText (__VEHICLE_CLASS >> "model");

TRACE_4("Measurements", _projectileDensity,_projectileLength,_projectileDiameter,_projectileCaliber);

// If there was no ACE length defined, default to caliber
if(_projectileLength == 0) then {
    _projectileLength = ACE_BASE_BULLET_LENGTH * _projectileCaliber; // Length in mm, 1 caliber = 55.6 = ~13mm length round
};

_vehicleId = _vehicle getVariable[QGVAR(id), -1];

_command = format["hit:%1,%2,%3,%4,%5,%6,%7,%8,%9,%10,%11,%12,%13,%14,%15,%16", 
                        _vehicleId,  // vehicle id registered
                        _model, _selection, 
                        VECTOR_TEXT(vectorDir _vehicle),
                        VECTOR_TEXT(vectorUp _vehicle),
                        _projectileType, //projectile type id
                        (_ammo select 4), _projectileLength, _projectileDiameter, _projectileDensity,
                            _frastumLength, _frastumDiameter,
                            VECTOR_TEXT(_projectileVelocity), 
                            RELATIVE_VECTOR_TEXT(_vehicle,getPosASL _projectile), 
                            VECTOR_TEXT(vectorDir _projectile), 
                            VECTOR_TEXT(_surfaceDirection), 
                            RELATIVE_VECTOR_TEXT(_vehicle,_impactPosition),  
                            VECTOR_TEXT(_projectileVelocity)
                ];   
TRACE_1("", _command);   
_result = _command call FUNC(callExtension);
TRACE_1("", _result);             