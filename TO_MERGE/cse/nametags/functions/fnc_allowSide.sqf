/**
 * fn_allowSide_TAGS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: side
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

if (GVAR(ALLOW_OWN_SIDE_ONLY)) exitwith {
	_this == playerSide; /* side ACE_player */
};
((_this getFriend playerSide /* side ACE_player */ ) >= 0.6);