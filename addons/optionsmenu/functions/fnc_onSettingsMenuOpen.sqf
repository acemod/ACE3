/**
* fnc_onSettingsMenuOpen.sqf
* @Descr: called when the settings or configuration menu has opened. Do not use anywhere else.
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

//Delay a frame
[{ [MENU_TAB_OPTIONS] call FUNC(onListBoxShowSelectionChanged) }, []] call EFUNC(common,execNextFrame);
