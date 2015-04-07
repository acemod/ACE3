#include "script_component.hpp"

PREP(rotateVectLineGetMap);
PREP(rotateVectLine);
PREP(shootRay);
PREP(shootCone);
PREP(checkLos);

PREP(findLaserDesignator);
PREP(findStrongestRay);

PREP(translateToModelSpace);
PREP(translateToWeaponSpace);

PREP(laser_init);

PREP(laserTargetPFH);

ACE_LASERS = [];

ACE_DEFAULT_LASER_CODE = 1001;
ACE_DEFAULT_FIRE_SELECTION = [FIREMODE_DIRECT_LOAL, ACE_DEFAULT_LASER_CODE];

FUNC(getPosASL) = {visiblePositionASL (_this select 0)};