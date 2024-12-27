#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to replace a persons Headgear/Helmet slot.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

ZRN_LOG_MSG_1(init,_this);

params ["_player", "_cfg_origin", "_cfg_tgt"];

removeHeadgear _player;
_player addHeadgear configName _cfg_tgt;
