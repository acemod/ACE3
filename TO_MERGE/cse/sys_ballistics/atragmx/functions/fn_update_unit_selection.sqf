#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

(_dsp displayCtrl 600) ctrlEnable true;
(_dsp displayCtrl 601) ctrlEnable true;
(_dsp displayCtrl 602) ctrlEnable true;

(_dsp displayCtrl 600 + cse_ab_ATragMX_currentUnit) ctrlEnable false;

call cse_ab_ATragMX_fnc_update_gun;
call cse_ab_ATragMX_fnc_update_atmosphere;
call cse_ab_ATragMX_fnc_update_target;
call cse_ab_ATragMX_fnc_update_result;
