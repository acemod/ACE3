#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, SynixeBrett
 * Fill right panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control <CONTROL>
 * 2: Sort control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_sortCtrl"];

lbClear _sortCtrl;

private _sorts = if (ctrlIDC _sortCtrl == 17 && {GVAR(currentLeftPanel) in [IDC_buttonUniform ,IDC_buttonVest, IDC_buttonBackpack]}) then {
    GVAR(sortListRightPanel) select (
        switch (GVAR(currentRightPanel)) do {
            case IDC_buttonOptic: { 0 };
            case IDC_buttonItemAcc: { 1 };
            case IDC_buttonMuzzle: { 2 };
            case IDC_buttonBipod: { 3 };
            case IDC_buttonCurrentMag;
            case IDC_buttonCurrentMag2;
            case IDC_buttonMag;
            case IDC_buttonMagALL: { 4 };
            case IDC_buttonThrow: { 5 };
            case IDC_buttonPut: { 6 };
            case IDC_buttonMisc: { 7 };
        }
    )
} else {
    private _sidc = ctrlIDC _sortCtrl;
    private _idc = ctrlIDC _control;
    switch true do {
        case (_sidc == 17): { // Right panel weapon attachment
            GVAR(sortListRightPanel) select (
                switch (_idc) do {
                    case IDC_buttonOptic: { 0 };
                    case IDC_buttonItemAcc: { 1 };
                    case IDC_buttonMuzzle: { 2 };
                    case IDC_buttonBipod: { 3 };
                    case IDC_buttonCurrentMag;
                    case IDC_buttonCurrentMag2;
                    case IDC_buttonMag;
                    case IDC_buttonMagALL: { 4 };
                    case IDC_buttonThrow: { 5 };
                    case IDC_buttonPut: { 6 };
                    case IDC_buttonMisc: { 7 };
                }
            )
        };
        case ([IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsigna] find _idc > -1): {
            []
        };
        default {
            GVAR(sortListLeftPanel) select ([
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
            ] find _idc)
        };
    }
};
{
    if (_x isEqualTo []) exitWith {};
    _sortCtrl lbAdd (_x select 1);
} forEach _sorts;
// TODO select the last sort if available
_sortCtrl lbSetCurSel 0;
