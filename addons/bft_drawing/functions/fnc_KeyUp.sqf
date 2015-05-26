#include "script_component.hpp"

// --- ToDo: make setting for DIK_CODE
if (_this select 1 == DIK_LCONTROL) then {
    GVAR(editkeydown) = false;

    (_this select 0) ctrlRemoveEventhandler ["Draw",GVAR(editingDraw)];
};
