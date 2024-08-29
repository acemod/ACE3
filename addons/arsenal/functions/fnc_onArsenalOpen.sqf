#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * onLoad EH for arsenal.
 *
 * Arguments:
 * 0: Not used
 * 1: Arguments <ARRAY>
 * - 0: Arsenal display <DISPLAY>
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

if (isNil {profileNamespace getVariable QGVAR(saved_loadouts)}) then {
    profileNamespace setVariable [QGVAR(saved_loadouts), []];
};

if (isNil QGVAR(virtualItems)) then {
    private _virtualItems = [
        [IDX_VIRT_WEAPONS, createHashMapFromArray [[IDX_VIRT_PRIMARY_WEAPONS, createHashMap], [IDX_VIRT_SECONDARY_WEAPONS, createHashMap], [IDX_VIRT_HANDGUN_WEAPONS, createHashMap]]],
        [IDX_VIRT_ATTACHMENTS, createHashMapFromArray [[IDX_VIRT_OPTICS_ATTACHMENTS, createHashMap], [IDX_VIRT_FLASHLIGHT_ATTACHMENTS, createHashMap], [IDX_VIRT_MUZZLE_ATTACHMENTS, createHashMap], [IDX_VIRT_BIPOD_ATTACHMENTS, createHashMap]]]
    ];

    _virtualItems = createHashMapFromArray _virtualItems;

    for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
        _virtualItems set [_index, createHashMap];
    };

    GVAR(virtualItems) = _virtualItems;

    // Flatten out hashmaps for easy checking later
    call FUNC(updateVirtualItemsFlat);
};

// Includes items not in the arsenal but equipped on player
GVAR(virtualItemsFlatAll) = +GVAR(virtualItemsFlat);

GVAR(currentFace) = face GVAR(center);
GVAR(currentVoice) = (speaker GVAR(center)) call EFUNC(common,getConfigName);
GVAR(currentInsignia) = GVAR(center) call BIS_fnc_getUnitInsignia;

GVAR(currentAction) = "Stand";
GVAR(shiftState) = false;

GVAR(currentStatPage) = 0;
GVAR(statsInfo) = [true, controlNull, nil, nil];

GVAR(currentActionPage) = 0;
GVAR(actionsInfo) = [controlNull, nil, nil];

// Update current item list
call FUNC(updateCurrentItemsList);

// Setup favorites button text and switch to default mode defined by setting
[_display, _display displayCtrl IDC_buttonFavorites] call FUNC(buttonFavorites);
GVAR(favorites) = profileNamespace getVariable [QGVAR(favorites), createHashMap];

// This takes care of unique inventory items and unique equipment (arsenal doesn't have items/equipment whitelisted)
call FUNC(updateUniqueItemsList);

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

// Handle actions
private _actionsBoxCtrl = _display displayCtrl IDC_actionsBox;
_actionsBoxCtrl ctrlSetPosition [
    (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
    safezoneY + 58.6 * GRID_H,
    47 * GRID_W,
    11 * GRID_H
];
_actionsBoxCtrl ctrlCommit 0;

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

    private _buttonCloseCtrl = _display displayCtrl IDC_menuBarClose;
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
GVAR(liveUpdateSearch) = false;
GVAR(leftTabFocus) = false;
GVAR(rightTabFocus) = false;
GVAR(rightTabLnBFocus) = false;
GVAR(ignoreFirstSortPanelCall) = false;
GVAR(refreshing) = false;

{
    private _panel = _display displayCtrl _x;
    _panel ctrlSetFontHeight (GVAR(fontHeight) * GRID_H);
    _panel ctrlCommit 0;
} forEach [IDC_leftTabContent, IDC_rightTabContent, IDC_rightTabContentListnBox];

// Open left panel for current weapon, do some math
GVAR(selectedWeaponType) = [primaryWeapon GVAR(center), secondaryWeapon GVAR(center), handgunWeapon GVAR(center), binocular GVAR(center)] find (currentWeapon GVAR(center));
if (GVAR(selectedWeaponType) == -1) then {
    GVAR(selectedWeaponType) = 0; // default to primary
};

private _leftPanelIDC = [IDC_buttonPrimaryWeapon, IDC_buttonSecondaryWeapon, IDC_buttonHandgun, IDC_buttonBinoculars] select GVAR(selectedWeaponType);

[_display, _display displayCtrl _leftPanelIDC] call FUNC(fillLeftPanel);

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
GVAR(camPosUpdateHandle) = addMissionEventHandler ["Draw3D", {call FUNC(updateCamPos)}];
