// by commy2
#include "\z\ace\addons\common\script_component.hpp"

private "_object";

GVAR(Debug_Object) = _this select 0;

onEachFrame {
  hintSilent str (GVAR(Debug_Object) getVariable ["ACE_isUsedBy", objNull]);
};
