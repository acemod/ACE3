#define COMPONENT nametags
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_NAMETAGS
#define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NAMETAGS
#define DEBUG_SETTINGS DEBUG_SETTINGS_NAMETAGS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ICON_NONE 0
#define ICON_NAME 1
#define ICON_NAME_RANK 2
#define ICON_NAME_SPEAK 3
#define ICON_SPEAK 4

//todo?: custom rank icons??
#define TEXTURES_RANKS [ \
    "", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa" \
    ]