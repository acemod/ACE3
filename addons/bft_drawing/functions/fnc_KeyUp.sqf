#include "script_component.hpp"

params ["_ctrl", "_key"];

// --- ToDo: make setting for DIK_CODE
if (_key == DIK_LCONTROL) then {
    GVAR(editkeydown) = false;

    _ctrl ctrlRemoveEventhandler ["Draw", GVAR(editingDraw)];
};
