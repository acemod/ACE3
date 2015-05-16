#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define ACE_BASE_BULLET_LENGTH 32.893
#define __VEHICLE_CLASS configFile >> "CfgVehicles" >> (typeOf _vehicle)
#define __PROJECTILE_CLASS configFile >> "CfgAmmo" >> (_ammo select 4)

private["_impactSurfaceType", "_isDirectHit", "_command", "_model", "_projectileType"];
private["_relProjectilePos", "_relProjectileVelocity", "_projectilePosition", "_relImpactVelPos", "_relImpactVelocity", "_relSurfDirectionPos", "_relSurfaceDirection"];
private["_penetrationOrthogonalDepth", "_penetrationAngleDepth", "_penetrationCosAngle", "_projectileCaliber", "_projectileDensity", "_projectileLength", "_armorDensity"];
EXPLODE_9_PVT((_this select 0),_vehicle,_shooter,_projectile,_impactPosition,_impactVelocity,_selection,_ammo,_surfaceDirection,_radius);
_impactSurfaceType = (_this select 0) select 9;
_isDirectHit = (_this select 0) select 10;
TRACE_2("",_impactSurfaceType,_isDirectHit);

_projectileType = getNumber (__PROJECTILE_CLASS >> "ACE_projectileType");

_projectileDensity = getNumber (__PROJECTILE_CLASS >> "ace_penetration_materialDensity");
_projectileMaterialType = getNumber (__PROJECTILE_CLASS >> "ace_penetration_materialType");

_projectileLength = (getNumber (__PROJECTILE_CLASS >> "ace_penetration_length")) * 1000; // fucking inches dafuq!?!?!?
_projectileDiameter = (getNumber (__PROJECTILE_CLASS >> "ace_penetration_diameter") ) * 1000;  // fucking inches dafuq!?!?!?
_projectileCaliber = getNumber (__PROJECTILE_CLASS >> "caliber");

_frastumLength = (getNumber (__PROJECTILE_CLASS >> "ace_penetration_frustumLength") ) * 1000;
_frastumDiameter = (getNumber (__PROJECTILE_CLASS >> "ace_penetration_frustumDiameter") ) * 1000;

_model = getText (__VEHICLE_CLASS >> "model");

TRACE_5("Measurements", _projectileDensity,_projectileLength,_projectileDiameter,_projectileCaliber, _projectileMaterialType);

// If there was no ACE length defined, default to caliber
if(_projectileLength == 0) then {
    _projectileLength = ACE_BASE_BULLET_LENGTH * _projectileCaliber; // Length in mm, 1 caliber = 55.6 = ~13mm length round
};

// @TODO: WHERE DO WE LOAD THESE FROM!?!?!?!
_impactSurfaceDensity = 7840;
_impactSurfaceMaterialType = 2;

_vehicleId = _vehicle getVariable[QGVAR(id), -1];


// The below didn't work
//#define RELATIVE_VECTOR_TEXT(o,x) ([(o worldToModelVisual ((x) call EFUNC(common,ASLToPosition)))] call FUNC(_textVector))

// Get a relative velocity!?!?
_relImpactPosition = _vehicle worldToModelVisual _impactPosition;
_projectilePosition = _vehicle worldToModelVisual (position _projectile);

_relProjectilePos = (position _projectile) vectorAdd (velocity _projectile);
_relProjectileVelocity = _projectilePosition vectorFromTo (_vehicle modelToWorldVisual _relProjectilePos);
_relProjectileVelocity = _relProjectileVelocity vectorMultiply (vectorMagnitude (velocity _projectile));

_relImpactVelPos = _impactPosition vectorAdd _impactVelocity;
_relImpactVelocity = _relImpactPosition vectorFromTo (_vehicle modelToWorldVisual _relImpactVelPos);
_relImpactVelocity = _relImpactVelocity vectorMultiply (vectorMagnitude _impactVelocity);

_relSurfDirectionPos = _impactPosition vectorAdd _surfaceDirection;
_relSurfaceDirection = _relImpactPosition vectorFromTo (_vehicle modelToWorldVisual _relSurfDirectionPos);

TRACE_2("", (vectorMagnitude _relImpactVelocity), (vectorMagnitude _relProjectileVelocity));
TRACE_2("", (vectorMagnitude _impactVelocity), (vectorMagnitude (velocity _projectile)));

_command = format["hit:%1,%2,%3,%4,%5,%6,%7,%8,%9,%10,%11,%12,%13,%14,%15,%16,%17,%18,%19,%20,%21,%22", 
                        _vehicleId,  // vehicle id registered
//                        _model, _selection, 
                        _model, "BALLS",
                        VECTOR_TEXT(vectorDir _vehicle),
                        VECTOR_TEXT(vectorUp _vehicle),
                        _projectileType, //projectile type id
                        (_ammo select 4), _projectileLength, _projectileDiameter, _projectileDensity, _projectileMaterialType,
                            _frastumLength, _frastumDiameter,
                            VECTOR_TEXT(_relProjectileVelocity), 
                            VECTOR_TEXT(_projectilePosition), 
                            VECTOR_TEXT(vectorDir _projectile), 
                            VECTOR_TEXT(_relSurfaceDirection), 
                            VECTOR_TEXT(_relImpactPosition),  
                            VECTOR_TEXT(_relImpactVelocity),
                            _impactSurfaceType,
                            _impactSurfaceDensity,
                            _impactSurfaceMaterialType
                ];   
TRACE_1("", _command);   
_result = _command call FUNC(callExtension);
TRACE_1("", _result);             