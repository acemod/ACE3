#include "script_component.hpp"

PREP(initDesignatorActions);
PREP(laserHudDesignateOn);
PREP(laserHudDesignateOff);
PREP(unitTurretHasDesignator);

GVAR(laser) = nil;
GVAR(laserActive) = false;

FUNC(getPosASL) = {visiblePositionASL (_this select 0)};
