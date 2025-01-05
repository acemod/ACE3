#include "script_component.hpp"

[ QGVAR(EH_say3d), FUNC(say3d) ] call CBA_fnc_addEventHandler;  // TO BE DELETED ONCE https://github.com/acemod/ACE3/pull/10619 has merged
[ QGVAR(EH_updateMagIDs), FUNC(spareBarrel_updateMagIDs) ] call CBA_fnc_addEventHandler;
