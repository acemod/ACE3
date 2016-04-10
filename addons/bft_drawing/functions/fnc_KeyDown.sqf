#include "script_component.hpp"

params ["_ctrl", "_key"];

// --- ToDo: make setting for DIK_CODE
if (_key == DIK_LCONTROL) then {
    GVAR(editkeydown) = true;

    GVAR(editingDraw) = _ctrl ctrlAddEventhandler ["Draw", FUNC(editingDraw)];
};
