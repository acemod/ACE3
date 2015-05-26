#include "script_component.hpp"

// --- ToDo: make setting for DIK_CODE
if (_this select 1 == DIK_LCONTROL) then {
    GVAR(editkeydown) = true;

    GVAR(editingDraw) = (_this select 0) ctrlAddEventhandler ["Draw",FUNC(editingDraw)];
};
