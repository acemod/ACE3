#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to replace a persons goggles/facewear.
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

removeGoggles _player;
_player addGoggles configName _cfg_tgt;