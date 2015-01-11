#include "script_component.hpp"

PREP(rotateVectLineGetMap);
PREP(rotateVectLine);

PREP(translateToModelSpace);
PREP(translateToWeaponSpace);

PREP(fired);

PREP(guidance_DAGR);
PREP(guidance_LGB);
PREP(guidance_HellfireII);
FUNC(getPosASL) = {visiblePositionASL (_this select 0)};