#include "script_component.hpp"

PREP(initDesignatorActions);
PREP(laserHudDesignateOn);
PREP(laserHudDesignateOff);
PREP(unitTurretHasDesignator);

PREP(findLaserSource);

GVAR(active) = false;

FUNC(getPosASL) = {visiblePositionASL (_this select 0)};
