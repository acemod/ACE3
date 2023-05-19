#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * onLoad EH for arsenal.
 *
 * Arguments:
 * 0: Not used
 * 1: Arguments <ARRAY>
 *  1.0: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["_display"];

//--------------- General vars
if (isNil QGVAR(center)) then {
    GVAR(center) = player;
};

GVAR(mouseButtonState) = [[], []];

if (isNil QGVAR(sharedLoadoutsNamespace)) then {
    GVAR(sharedLoadoutsNamespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(sharedLoadoutsNamespace);
};

if (isNil {GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars)}) then {
    GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsVars), [], true];
};

if (isNil QGVAR(defaultLoadoutsList)) then {
    if (is3DEN) then {
        GVAR(defaultLoadoutsList) = QGVAR(DummyCategory) get3DENMissionAttribute QGVAR(DefaultLoadoutsListAttribute);
    } else {
        GVAR(defaultLoadoutsList) = [];
    };
};

if (isNil QGVAR(virtualItems)) then {
    GVAR(virtualItems) = EMPTY_VIRTUAL_ARSENAL;
};

GVAR(currentFace) = face GVAR(center);
GVAR(currentVoice) = speaker GVAR(center);
GVAR(currentInsignia) = GVAR(center) call BIS_fnc_getUnitInsignia;

GVAR(currentAction) = "Stand";
GVAR(shiftState) = false;

GVAR(showStats) = true;
GVAR(statsPagesLeft) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
GVAR(statsPagesRight) = [0, 0, 0, 0, 0, 0, 0, 0];
GVAR(statsInfo) = [true, 0, controlNull, nil, nil];

// Add the items the player has to virtualItems
{
    switch (_forEachIndex) do {
        // Primary weapon, Secondary weapon, Handgun weapon, Binoculars
        case IDX_LOADOUT_PRIMARY_WEAPON;
        case IDX_LOADOUT_SECONDARY_WEAPON;
        case IDX_LOADOUT_HANDGUN_WEAPON;
        case IDX_LOADOUT_BINO: {
            _x params [["_weapon", ""], ["_muzzle", ""], ["_flashlight", ""], ["_optics", ""], ["_primaryMagazine", []], ["_secondaryMagazine", []], ["_bipod", ""]];

            // Add weapon
            if (_weapon != "") then {
                _weapon = _weapon call EFUNC(common,baseWeapon);

                if (_weapon != "") then {
                    // If bino, add it in a different place than regular weapons
                    if (_forEachIndex != IDX_LOADOUT_BINO) then {
                        (GVAR(virtualItems) select IDX_VIRT_WEAPONS select _forEachIndex) pushBackUnique _weapon;
                    } else {
                        (GVAR(virtualItems) select IDX_VIRT_BINO) pushBackUnique _weapon;
                    };
                };
            };

            // Add weapon attachments
            {
                if (_x != "") then {
                    ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select _forEachIndex) pushBackUnique _x;
                };
            } forEach [_optics, _flashlight, _muzzle, _bipod];

            // Add magazines
            {
                // Check if there is a magazine and if it has some ammo
                if ((_x param [0, ""]) != "" && {(_x select 1) > 0}) then {
                    (GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL) pushBackUnique (_x select 0);
                };
            } forEach [_primaryMagazine, _secondaryMagazine];
        };
        // Uniform
        case IDX_LOADOUT_UNIFORM: {
            _x params [["_containerClass", ""]];

            if (_containerClass != "") then {
                (GVAR(virtualItems) select IDX_VIRT_UNIFORM) pushBackUnique _containerClass;
            };
        };
        // Vest
        case IDX_LOADOUT_VEST: {
            _x params [["_containerClass", ""]];

            if (_containerClass != "") then {
                (GVAR(virtualItems) select IDX_CURR_VEST) pushBackUnique _containerClass;
            };
        };
        // Backpack
        case IDX_LOADOUT_BACKPACK: {
            _x params [["_containerClass", ""]];

            if (_containerClass != "") then {
                (GVAR(virtualItems) select IDX_CURR_BACKPACK) pushBackUnique _containerClass;
            };
        };
        // Helmet
        case IDX_LOADOUT_HEADGEAR: {
            if (_x != "") then {
                (GVAR(virtualItems) select IDX_VIRT_HEADGEAR) pushBackUnique _x;
            };
        };
        // Facewear
        case IDX_LOADOUT_GOGGLES: {
            if (_x != "") then {
                (GVAR(virtualItems) select IDX_VIRT_GOGGLES) pushBackUnique _x;
            };
        };
        // Assigned items: Map, Compass, Watch, GPS / UAV Terminal, Radio, NVGs
        case IDX_LOADOUT_ASSIGNEDITEMS: {
            {
                // Order of storing virtualItems is different than what getUnitLoadout returns, so do some math
                if (_x != "") then {
                    (GVAR(virtualItems) select (IDX_VIRT_NVG + ([2, 6, 4, 3, 5, 0] select _forEachIndex))) pushBackUnique _x;
                };
            } forEach _x;
        };
    };
} forEach (getUnitLoadout GVAR(center)); // Only need items, not extended loadout

// Update current item list
call FUNC(updateCurrentItemsList);

// This takes care of items that aren't available in the arsenal (either wrong tab or arsenal doesn't have it whitelisted)
call FUNC(updateUniqueItemsList);

// Get the type of the current weapon
private _currentWeapon = currentWeapon GVAR(center);

GVAR(currentWeaponType) = switch (true) do {
    case (_currentWeapon == (GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON)): {0};
    case (_currentWeapon == (GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON)): {1};
    case (_currentWeapon == (GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON)): {2};
    default {-1};
};

[QGVAR(displayOpened), [_display]] call CBA_fnc_localEvent;

//--------------- Fade out unused elements
private _mouseBlockCtrl = _display displayCtrl IDC_mouseBlock;
_mouseBlockCtrl ctrlEnable false;

{
    _x = _display displayCtrl _x;

    _x ctrlSetFade 1;
    _x ctrlShow false;
    _x ctrlCommit 0;
} forEach [
    IDC_blockRightFrame,
    IDC_blockRighttBackground,
    IDC_loadIndicator,
    IDC_rightTabContent,
    IDC_rightTabContentListnBox,
    IDC_sortRightTab,
    RIGHT_PANEL_ACC_BACKGROUND_IDCS,
    RIGHT_PANEL_ACC_IDCS,
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,
    RIGHT_PANEL_ITEMS_IDCS,
    IDC_buttonRemoveAll,
    IDC_rightSearchbar
];

// Handle stats
private _statsBoxCtrl = _display displayCtrl IDC_statsBox;
_statsBoxCtrl ctrlSetPosition [
    (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
    safezoneY + 1.8 * GRID_H,
    47 * GRID_W,
    11 * GRID_H
];
_statsBoxCtrl ctrlEnable false;
_statsBoxCtrl ctrlCommit 0;

(_display displayCtrl IDC_statsButton) ctrlShow false;

// Disable import in MP
if (isMultiplayer) then {
    private _importButtonCtrl = _display displayCtrl IDC_buttonImport;
    _importButtonCtrl ctrlEnable false;
    _importButtonCtrl ctrlSetFade 0.6;
    _importButtonCtrl ctrlCommit 0;
};

//--------------- Camera prep
cutText ["", "PLAIN"];
showCommandingMenu "";

GVAR(cameraView) = cameraView;
GVAR(center) switchCamera "internal";
[QUOTE(ADDON), [false, true, true, true, true, true, true, false, true, true]] call EFUNC(common,showHud);

private _mouseAreaCtrl = _display displayCtrl IDC_mouseArea;
ctrlSetFocus _mouseAreaCtrl;

private _centerPos = position GVAR(center);

// 3DEN support, lifted from BIS_fnc_arsenal
if (is3DEN) then {
    GVAR(centerOrigin) = GVAR(center);
    GVAR(centerOrigin) hideObject true;

    private _centerOriginParent = objectParent GVAR(centerOrigin);

    if !(isNull _centerOriginParent) then {
        _centerOriginParent hideObject true;
    };

    GVAR(center) = createAgent [typeOf GVAR(centerOrigin), _centerPos, [], 0, "none"];
    GVAR(center) setPosATL getPosATL GVAR(centerOrigin);
    GVAR(center) setDir (getDir GVAR(centerOrigin));
    GVAR(center) switchMove animationState GVAR(centerOrigin);
    GVAR(center) switchAction "playerStand";
    GVAR(center) enableSimulation false;

    [GVAR(center), GVAR(centerOrigin) call CBA_fnc_getLoadout] call CBA_fnc_setLoadout;

    //--- Create light for night editing (code based on BIS_fnc_3DENFlashlight)
    GVAR(light) = "#lightpoint" createVehicle _centerPos;
    GVAR(light) setLightBrightness 1;
    GVAR(light) setLightAmbient [1, 1, 1];
    GVAR(light) setLightColor [0, 0, 0];
    GVAR(light) lightAttachObject [GVAR(centerOrigin), [0, 0, -7]];

    //--- Use the same vision mode as in Eden
    GVAR(visionMode) = -2 call BIS_fnc_3DENVisionMode;
    ["ShowInterface", false] spawn BIS_fnc_3DENInterface;

    if (get3DENActionState "toggleMap" > 0) then {
        do3DENAction "toggleMap";
    };

    private _ctrl = controlNull;

    {
        _ctrl = _display displayCtrl _x;

        _ctrl ctrlEnable false;
        _ctrl ctrlSetFade 0.6;
        _ctrl ctrlCommit 0;
    } forEach [IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsignia];

    _buttonCloseCtrl = _display displayCtrl IDC_menuBarClose;
    _buttonCloseCtrl ctrlSetText (localize "str_ui_debug_but_apply");
} else {
    GVAR(centerNotPlayer) = GVAR(center) != player;

    if (currentVisionMode ACE_Player == 1) then {
        GVAR(center) action ["NVGogglesOff", GVAR(center)];
    };

    private _ctrl = controlNull;

    {
        _ctrl = _display displayCtrl _x;

        _ctrl ctrlEnable GVAR(enableIdentityTabs);
        _ctrl ctrlSetFade ([0.6, 0] select GVAR(enableIdentityTabs));
        _ctrl ctrlCommit 0;
    } forEach [IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsignia];
};

//--------------- Prepare the left panel
GVAR(currentLeftPanel) = nil;
GVAR(currentRightPanel) = nil;
GVAR(leftSearchbarFocus) = false;
GVAR(rightSearchbarFocus) = false;
GVAR(leftTabFocus) = false;
GVAR(rightTabFocus) = false;
GVAR(rightTabLnBFocus) = false;

{
    private _panel = _display displayCtrl _x;
    _panel ctrlSetFontHeight (GVAR(fontHeight) * GRID_H);
    _panel ctrlCommit 0;
} forEach [IDC_leftTabContent, IDC_rightTabContent, IDC_rightTabContentListnBox];

[_display, _display displayCtrl IDC_buttonPrimaryWeapon] call FUNC(fillLeftPanel);

//--------------- Init camera
if (isNil QGVAR(cameraPosition)) then {
    GVAR(cameraPosition) = [5, 0, 0, [0, 0, 0.85]];
};

// Save curator camera state so camera position and direction are not modified while using arsenal
private _curatorCamera = curatorCamera;

if (!isNull _curatorCamera) then {
    GVAR(curatorCameraData) = [getPosASL _curatorCamera, [vectorDir _curatorCamera, vectorUp _curatorCamera]];
};

GVAR(cameraHelper) = createAgent ["Logic", _centerPos, [], 0, "none"];
GVAR(cameraHelper) attachTo [GVAR(center), GVAR(cameraPosition) select 3, ""];

GVAR(camera) = "camera" camCreate _centerPos;
GVAR(camera) cameraEffect ["internal", "back"];
GVAR(camera) camPrepareFocus [-1, -1];
GVAR(camera) camPrepareFov 0.35;
GVAR(camera) camCommitPrepared 0;

showCinemaBorder false;
["#(argb,8,8,3)color(0,0,0,1)", false, nil, 0, [0, 0.5]] call BIS_fnc_textTiles;

//--------------- Reset camera pos
[nil, [controlNull, 0, 0]] call FUNC(handleMouse);
GVAR(camPosUpdateHandle) = addMissionEventHandler ["draw3D", {call FUNC(updateCamPos)}];
