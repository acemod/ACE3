// by commy2
#include "script_component.hpp"

GVAR(Debug_Object) = _this select 0;

onEachFrame {
    hintSilent str (GVAR(Debug_Object) getVariable ["ACE_isUsedBy", objNull]);
};
