#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Formally a ace_setting, users can still disable by `setting ace_missileguidance_enabled = x;`
// [0 - Off , 1 - PlayerOnly, 2 - PlayerAndAi]
// As weapons take config changes, there is little point in being able to disable guidance
if (isNil QGVAR(enabled)) then { GVAR(enabled) = 2; };

GVAR(debug_enableMissileCamera) = false;
GVAR(debug_drawGuidanceInfo) = false;

#ifdef DRAW_GUIDANCE_INFO
GVAR(debug_drawGuidanceInfo) = true;
#endif

#ifdef ENABLE_PROJECTILE_CAMERA
GVAR(debug_enableMissileCamera) = true;
#endif

ADDON = true;
