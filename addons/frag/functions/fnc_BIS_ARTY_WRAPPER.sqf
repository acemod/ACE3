#include "script_component.hpp"
_ret = [(_this select 6)] call FUNC(removeTrack);
if(!_ret) then {
    [(_this select 6)] call FUNC(addBlackList);
};
_this call ACE_WRAPPER_BIS_ARTY_F_ShellFlight;
_catEntry = BIS_ARTY_SHELLCAT select ((count BIS_ARTY_SHELLCAT) - 1);
_shell = _catEntry select 0;
_ARTY_DeployOnImpact = getText (configFile >> "CfgAmmo" >> "ARTY_DeployOnImpact");
if(_ARTY_DeployOnImpact == "") then {
    _this set[6, _shell];
    _this call FUNC(fired);
};