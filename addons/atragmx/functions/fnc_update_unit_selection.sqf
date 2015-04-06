#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

(_dsp displayCtrl 600) ctrlEnable true;
(_dsp displayCtrl 601) ctrlEnable true;
(_dsp displayCtrl 602) ctrlEnable true;

(_dsp displayCtrl 600 + GVAR(ATragMX_currentUnit)) ctrlEnable false;

call compile preprocessFile ("\atragmx\fnc_update_gun.sqf");
call compile preprocessFile ("\atragmx\fnc_update_atmosphere.sqf");
call compile preprocessFile ("\atragmx\fnc_update_target.sqf");
call compile preprocessFile ("\atragmx\fnc_update_result.sqf");
