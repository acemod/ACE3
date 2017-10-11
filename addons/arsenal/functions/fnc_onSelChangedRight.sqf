#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = [_control lnbData [_curSel, 0], _control lbData _curSel] select !(ctrlType _control == 102);

switch (GVAR(currentRightPanel)) do {
    case IDC_buttonOptic : {
    };
    case IDC_buttonItemAcc : {
    };
    case IDC_buttonMuzzle : {
    };
    case IDC_buttonBipod : {
    };
};