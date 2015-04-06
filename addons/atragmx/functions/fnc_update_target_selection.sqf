#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

(_dsp displayCtrl 500) ctrlEnable true;
(_dsp displayCtrl 501) ctrlEnable true;
(_dsp displayCtrl 502) ctrlEnable true;
(_dsp displayCtrl 503) ctrlEnable true;

(_dsp displayCtrl 500 + GVAR(ATragMX_currentTarget)) ctrlEnable false;

ctrlSetFocus (_dsp displayCtrl 3000);

[] call FUNC(update_unit_selection);
