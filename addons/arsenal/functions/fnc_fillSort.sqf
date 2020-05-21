#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if (ctrlIDC _control == 17 && {GVAR(currentLeftPanel) in [IDC_buttonUniform ,IDC_buttonVest, IDC_buttonBackpack]}) then {
    systemChat "running right";
    private _sortRightCtrl = _display displayCtrl IDC_sortRightTab;
    lbClear _sortRightCtrl;
    private _handleStatsFnc = {
        {
            _sortLeftCtrl lbAdd (_x select 1);
        } forEach GVAR(sortRightLeftPanel) select _this;
    };
    switch (GVAR(currentRightPanel)) do {
        case IDC_buttonOptic: {
            0 call _handleStatsFnc;
        };
        case IDC_buttonItemAcc: {
            1 call _handleStatsFnc;
        };
        case IDC_buttonMuzzle: {
            2 call _handleStatsFnc;
        };
        case IDC_buttonBipod: {
            3 call _handleStatsFnc;
        };
        case IDC_buttonCurrentMag;
        case IDC_buttonCurrentMag2;
        case IDC_buttonMag;
        case IDC_buttonMagALL: {
            4 call _handleStatsFnc;
        };
        case IDC_buttonThrow: {
            5 call _handleStatsFnc;
        };
        case IDC_buttonPut: {
            6 call _handleStatsFnc;
        };
        case IDC_buttonMisc: {
            7 call _handleStatsFnc;
        };
    };
} else {
    private _idc = ctrlIDC _control;
    if ([IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsigna] find _idc > -1) then {
        // /shrug
        systemChat "shrug";
    } else {
        private _sortLeftCtrl = _display displayCtrl IDC_sortLeftTab;
        lbClear _sortLeftCtrl;
        private _sorts = GVAR(sortListLeftPanel) select ([
            IDC_buttonPrimaryWeapon,
            IDC_buttonHandgun,
            IDC_buttonSecondaryWeapon,
            IDC_buttonUniform,
            IDC_buttonVest,
            IDC_buttonBackpack,
            IDC_buttonHeadgear,
            IDC_buttonGoggles,
            IDC_buttonNVG,
            IDC_buttonBinoculars,
            IDC_buttonMap,
            IDC_buttonGPS,
            IDC_buttonRadio,
            IDC_buttonCompass,
            IDC_buttonWatch
        ] find _idc);
        {
            if (_x isEqualTo []) exitWith {};
            _sortLeftCtrl lbAdd (_x select 1);
        } forEach _sorts;
        _sortLeftCtrl lbSetCurSel 0;
    };
};
