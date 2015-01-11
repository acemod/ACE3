#define COMPONENT sys_arty_ammunition
#include "\x\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SYS_ARTY_AMMUNITION
	#define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SYS_ARTY_AMMUNITION
	#define DEBUG_SETTINGS DEBUG_SETTINGS_SYS_ARTY_AMMUNITION
#endif

#include "\x\ace\addons\main\script_macros.hpp"
#include "\x\ace\addons\main\script_dialog_defines.hpp"


#define ROUNDS_LISTBOX_ID 	20100
#define CHARGE_LISTBOX_ID 	20101
#define FUZE_SLIDER_ID 		20201