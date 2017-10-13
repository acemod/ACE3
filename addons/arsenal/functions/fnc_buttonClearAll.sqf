#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

// Clear container
switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonUniform: {
        {GVAR(center) removeItemFromUniform _x} foreach (uniformItems GVAR(center));
        GVAR(currentItems) set [15, []];
    };
    case IDC_buttonVest: {
        {GVAR(center) removeItemFromVest _x} foreach (vestItems GVAR(center));
        GVAR(currentItems) set [16, []];
    };
    case IDC_buttonBackpack: {
        {GVAR(center) removeItemFromBackpack _x} foreach (backpackItems GVAR(center));
        GVAR(currentItems) set [17, []];
    };
};

// Clear number of owned items / set color back to normal
private _ctrlList = _display displayCtrl IDC_rightTabContentListnBox;

for "_l" from 0 to (lbSize _ctrlList - 1) do {
    _ctrlList lnbSetText [[_l, 2], str 0];
    _ctrlList lnbsetcolor [[_l, 1], [1, 1, 1, 1]];
    _ctrlList lnbsetcolor [[_l, 2], [1, 1, 1, 1]];
};

// Fade out button
private _removeAllCtrl = _display displayCtrl IDC_buttonRemoveAll;

if (ctrlFade _removeAllCtrl != 1) then {
    _removeAllCtrl ctrlSetFade 1;
};

if (ctrlShown _removeAllCtrl) then {
    _removeAllCtrl ctrlShow false;
};
_removeAllCtrl ctrlCommit FADE_DELAY;

(_display displayCtrl IDC_loadIndicatorBar) progressSetPosition 0;
(_display displayCtrl IDC_totalWeightText) ctrlSetText (GVAR(center) call EFUNC(movement,getWeight)); // TBL