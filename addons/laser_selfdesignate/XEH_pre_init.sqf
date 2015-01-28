#include "script_component.hpp"

PREP(onGetIn);
PREP(onGetOut);

PREP(laserHudDesignateOn);
PREP(laserHudDesignateOff);

GVAR(laser) = nil;
GVAR(laserActive) = false; 

FUNC(getPosASL) = {visiblePositionASL (_this select 0)};