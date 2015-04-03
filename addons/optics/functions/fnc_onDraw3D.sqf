// by commy2
#include "script_component.hpp"

private "_control";
_control = uiNamespace getVariable ["ACE_ctrlShortdotReticle", controlNull];

if !(GVAR(isUsingOptic) || {currentWeapon ACE_player != primaryWeapon ACE_player}) exitWith {
    _control ctrlShow false;
};

_control ctrlSetText (GVAR(usedOptics) select 0 select 1);
_control ctrlShow true;

[_control, call EFUNC(common,getZoom)] call (GVAR(usedOptics) select 0 select 2);
