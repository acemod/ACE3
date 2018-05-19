/*
 * Author: Alganthe
 * Change unit animation / play sound preview.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

if (GVAR(centerNotPlayer)) exitWith {};

private _nextAction = switch (GVAR(currentLeftPanel)) do {

    case IDC_buttonPrimaryWeapon : {
        ["Civil", "PrimaryWeapon"] select ((GVAR(currentItems) select 0) != "")
    };
    case IDC_buttonSecondaryWeapon : {
        ["Civil", "SecondaryWeapon"] select (GVAR(currentItems) select 1 != "")
    };
    case IDC_buttonHandgun : {
        ["Civil", "HandGunOn"] select (GVAR(currentItems) select 2 != "")
    };
    case IDC_buttonHeadgear;
    case IDC_buttonUniform;
    case IDC_buttonVest;
    case IDC_buttonBackpack;
    case IDC_buttonGoggles;
    case IDC_buttonMap;
    case IDC_buttonGPS;
    case IDC_buttonRadio;
    case IDC_buttonCompass;
    case IDC_buttonWatch;
    case IDC_buttonFace;
    case IDC_buttonNVG : {
        "Civil"
    };
    case IDC_buttonBinoculars : {
        ["Civil", "Binoculars"] select (GVAR(currentItems) select 9 != "")
    };
    case IDC_buttonInsigna : {
        "Salute"
    };
    case IDC_buttonVoice : {
        GVAR(center) directSay "CuratorObjectPlaced";
        "Civil"
    };
};

if (_nextAction != GVAR(currentAction)) then {
    switch (_nextAction) do {
        case "PrimaryWeapon": {
            GVAR(selectedWeaponType) = 0;
        };
        case "SecondaryWeapon": {
            GVAR(selectedWeaponType) = 1;
        };
        case "HandGunOn": {
            GVAR(selectedWeaponType) = 2;
        };
    };

    if (simulationEnabled GVAR(center)) then {
        GVAR(center) playActionNow _nextAction;
    } else {
        GVAR(center) switchAction _nextAction;
    };

    GVAR(currentAction) = _nextAction;
};
