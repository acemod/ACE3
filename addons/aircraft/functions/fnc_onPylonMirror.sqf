// TODO: Header
#include "script_component.hpp"

params ["_ctrl", "_checked"];

if (_checked == 1) then {
    {
        if ((_x select 1) != -1) then {
            private _selection = lbCurSel ((GVAR(comboBoxes) select (_x select 1)) select 0);
            (_x select 0) lbSetCurSel _selection;
            (_x select 0) ctrlEnable false;
        };
    } forEach GVAR(comboBoxes);
} else {
    {
        (_x select 0) ctrlEnable true;
    } forEach GVAR(comboBoxes);
};
