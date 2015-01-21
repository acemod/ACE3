#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

(_dsp displayCtrl 500) ctrlEnable true;
(_dsp displayCtrl 501) ctrlEnable true;
(_dsp displayCtrl 502) ctrlEnable true;
(_dsp displayCtrl 503) ctrlEnable true;

(_dsp displayCtrl 500 + cse_ab_ATragMX_currentTarget) ctrlEnable false;

ctrlSetFocus (_dsp displayCtrl 3000);

call cse_ab_ATragMX_fnc_update_unit_selection;
