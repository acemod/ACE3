#include "..\script_component.hpp"
#include "..\defines.hpp"
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

if (GVAR(centerNotPlayer)) exitWith {};

if (EGVAR(common,isReloading)) exitWith { // if player is reloading then wait until it's done so we don't send magazines to the shadow realm
    [{!EGVAR(common,isReloading)}, FUNC(showItem)] call CBA_fnc_waitUntilAndExecute;
};

// Determine action to play based on current category selection
private _nextAction = switch (GVAR(currentLeftPanel)) do {
    // Primary weapon
    case IDC_buttonPrimaryWeapon: {
        ["Civil", "PrimaryWeapon"] select ((GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON) != "")
    };
    // Secondary weapon
    case IDC_buttonSecondaryWeapon: {
        ["Civil", "SecondaryWeapon"] select ((GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON) != "")
    };
    // Handgun weapon
    case IDC_buttonHandgun: {
        ["Civil", "HandGunOn"] select ((GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON) != "")
    };
    // Binoculars
    case IDC_buttonBinoculars: {
        ["Civil", "Binoculars"] select ((GVAR(currentItems) select IDX_CURR_BINO) != "")
    };
    // Insignia
    case IDC_buttonInsignia: {
        "Salute"
    };
    // Voice
    case IDC_buttonVoice: {
        GVAR(center) directSay "CuratorObjectPlaced";
        "Civil"
    };
    // Other
    default {
        "Civil"
    };
};

// Play the action if a new category of item was selected
if (_nextAction != GVAR(currentAction)) then {
    GVAR(selectedWeaponType) = switch (_nextAction) do {
        case "PrimaryWeapon": {0};
        case "SecondaryWeapon": {1};
        case "HandGunOn": {2};
        case "Binoculars": {3};
        default {GVAR(selectedWeaponType)};
    };

    if (simulationEnabled GVAR(center)) then {
        GVAR(center) call EFUNC(common,stopGesture); // reset gesture state (if arsenal is opened on animation transition, animations played whilst in the arsenal break)
        GVAR(center) playActionNow _nextAction;
    } else {
        GVAR(center) switchAction _nextAction;
    };

    GVAR(currentAction) = _nextAction;
};

if !(GVAR(currentAction) in ["Civil", "Salute"]) then {
    GVAR(center) selectWeapon ([primaryWeapon GVAR(center), secondaryWeapon GVAR(center), handgunWeapon GVAR(center), binocular GVAR(center)] select GVAR(selectedWeaponType)); // select correct weapon, prevents floating weapons
};
