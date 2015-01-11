#include "script_component.hpp"

PREP(laserHudDesignateOn);
PREP(laserHudDesignateOff);


GVAR(laser) = nil;

FUNC(getPosASL) = {visiblePositionASL (_this select 0)};