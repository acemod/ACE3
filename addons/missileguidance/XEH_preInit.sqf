#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Formally a ace_setting, users can still disable by `setting ace_missileguidance_enabled = x;`
// [0 - Off , 1 - PlayerOnly, 2 - PlayerAndAi]
// As weapons take config changes, there is little point in being able to disable guidance
if (isNil QGVAR(enabled)) then { GVAR(enabled) = 2; };

GVAR(keybinds) = createHashMapFromArray [
    ["lock", [[], [], [DIK_TAB, [false, false, false]], LSTRING(keybind_lock)]],
    ["left", [[], [], [DIK_NUMPAD4, [false, false, false]], LSTRING(keybind_left)]],
    ["right", [[], [], [DIK_NUMPAD6, [false, false, false]], LSTRING(keybind_right)]],
    ["up", [[], [], [DIK_NUMPAD8, [false, false, false]], LSTRING(keybind_up)]],
    ["down", [[], [], [DIK_NUMPAD2, [false, false, false]], LSTRING(keybind_down)]]
];

GVAR(gps_currentSettings) = [
    [0, 0, 0],         // attack position
    -1,                // impact angle
    -1                // attack heading
];

GVAR(gps_pbMode) = 0;
GVAR(gps_settings) = createHashMap;
for "_i" from 0 to MAX_PB_MODES do {
    GVAR(gps_settings) set [_i, GVAR(currentSettings)];
};

GVAR(gps_mode) = "pb";
GVAR(gps_weapons) = createHashMap;

GVAR(mclos_weapons) = createHashMap;

GVAR(debug_enableMissileCamera) = false;
GVAR(debug_drawGuidanceInfo) = false;

#ifdef DRAW_GUIDANCE_INFO
GVAR(debug_drawGuidanceInfo) = true;
#endif

#ifdef ENABLE_PROJECTILE_CAMERA
GVAR(debug_enableMissileCamera) = true;
#endif

ADDON = true;
