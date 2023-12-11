// Pixel grid
#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)

#define WIDTH_TOTAL (safezoneW - 2 * (93 * GRID_W))
#define WIDTH_GAP (WIDTH_TOTAL / 100)
#define WIDTH_SINGLE ((WIDTH_TOTAL - 7 * WIDTH_GAP) / 6)

// IDDs
#define IDD_MISSION 46
#define IDD_RSCDISPLAYCURATOR 312
#define IDD_DISPLAY3DEN 313

#define IDC_OK 1 // emulate "OK" button
#define IDC_CANCEL 2 // emulate "Cancel" button

// Sorting
#define ASCENDING 0
#define DESCENDING 1

// Favorites
#define FAVORITES_COLOR (GVAR(favoritesColor) + [1])

// Attachments
#define ITEM_INDEX_MUZZLE 0
#define ITEM_INDEX_SIDE 1
#define ITEM_INDEX_OPTIC 2
#define ITEM_INDEX_BIPOD 3
#define ITEM_INDEX_MAGAZINE 4
#define ITEM_INDEX_MAGAZINE_SECONDARY 5

// IDCs
#define IDD_ace_arsenal 1127001
#define IDC_mouseArea 0
#define IDC_arrowMinus 101
#define IDC_arrowPlus 102
#define IDC_blockLeftFrame 3
#define IDC_blockLeftBackground 4
#define IDC_blockRightFrame 5
#define IDC_blockRighttBackground 6
#define IDC_loadIndicator 7
#define IDC_loadIndicatorBar 701
#define IDC_totalWeight 8
#define IDC_totalWeightText 801
#define IDC_message 9
#define IDC_menuBar 10
#define IDC_menuBarClose 1001
#define IDC_buttonHide 1002
#define IDC_buttonLoadouts 1003
#define IDC_buttonExport 1004
#define IDC_buttonImport 1005
#define IDC_buttonFavorites 1006
#define IDC_infoBox 11
#define IDC_infoBackground 1101
#define IDC_infoName 1102
#define IDC_infoAuthor 1103
#define IDC_DLCBackground 1104
#define IDC_DLCIcon 1105
#define IDC_mouseBlock 12
#define IDC_leftTabContent 13
#define IDC_rightTabContent 14
#define IDC_rightTabContentListnBox 15
#define IDC_sortLeftTab 16
#define IDC_sortLeftTabDirection 161
#define IDC_sortRightTab 17
#define IDC_sortRightTabDirection 171
#define IDC_leftSearchbar 18
#define IDC_leftSearchbarButton 41
#define IDC_rightSearchbar 19
#define IDC_rightSearchbarButton 42
#define IDC_tabLeft 20
#define IDC_iconBackgroundPrimaryWeapon 2001
#define IDC_buttonPrimaryWeapon 2002
#define IDC_iconBackgroundHandgun 2003
#define IDC_buttonHandgun 2004
#define IDC_iconBackgroundSecondaryWeapon 2005
#define IDC_buttonSecondaryWeapon 2006
#define IDC_iconBackgroundHeadgear 2007
#define IDC_buttonHeadgear 2008
#define IDC_iconBackgroundUniform 2009
#define IDC_buttonUniform 2010
#define IDC_iconBackgroundVest 2011
#define IDC_buttonVest 2012
#define IDC_iconBackgroundBackpack 2013
#define IDC_buttonBackpack 2014
#define IDC_iconBackgroundGoggles 2015
#define IDC_buttonGoggles 2016
#define IDC_iconBackgroundNVG 2017
#define IDC_buttonNVG 2018
#define IDC_iconBackgroundBinoculars 2019
#define IDC_buttonBinoculars 2020
#define IDC_iconBackgroundMap 2021
#define IDC_buttonMap 2022
#define IDC_iconBackgroundGPS 2023
#define IDC_buttonGPS 2024
#define IDC_iconBackgroundRadio 2025
#define IDC_buttonRadio 2026
#define IDC_iconBackgroundCompass 2028
#define IDC_buttonCompass 2029
#define IDC_iconBackgroundWatch 2030
#define IDC_buttonWatch 2031
#define IDC_iconBackgroundFace 2032
#define IDC_buttonFace 2033
#define IDC_iconBackgroundVoice 2034
#define IDC_buttonVoice 2035
#define IDC_iconBackgroundInsigna 2036
#define IDC_buttonInsignia 2037
#define IDC_iconBackgroundOptic 21
#define IDC_buttonOptic 22
#define IDC_iconBackgroundItemAcc 23
#define IDC_buttonItemAcc 24
#define IDC_iconBackgroundMuzzle 25
#define IDC_buttonMuzzle 26
#define IDC_iconBackgroundBipod 27
#define IDC_buttonBipod 28
#define IDC_iconBackgroundCurrentMag 3001
#define IDC_buttonCurrentMag 3002
#define IDC_iconBackgroundCurrentMag2 3003
#define IDC_buttonCurrentMag2 3004
#define IDC_iconBackgroundMag 29
#define IDC_buttonMag 30
#define IDC_iconBackgroundMagALL 31
#define IDC_buttonMagALL 32
#define IDC_iconBackgroundThrow 33
#define IDC_buttonThrow 34
#define IDC_iconBackgroundPut 35
#define IDC_buttonPut 36
#define IDC_iconBackgroundMisc 37
#define IDC_buttonMisc 38
#define IDC_buttonRemoveAllSelected 39
#define IDC_buttonRemoveAll 40
#define IDC_statsBox 51
#define IDC_statsTitle1 5101
#define IDC_statsBackground1 5102
#define IDC_statsBar1 5103
#define IDC_statsText1 5104
#define IDC_statsTitle2 5105
#define IDC_statsBackground2 5106
#define IDC_statsBar2 5107
#define IDC_statsText2 5108
#define IDC_statsTitle3 5109
#define IDC_statsBackground3 5110
#define IDC_statsBar3 5111
#define IDC_statsText3 5112
#define IDC_statsTitle4 5113
#define IDC_statsBackground4 5114
#define IDC_statsBar4 5115
#define IDC_statsText4 5116
#define IDC_statsTitle5 5117
#define IDC_statsBackground5 5118
#define IDC_statsBar5 5119
#define IDC_statsText5 5120
#define IDC_statsPreviousPage 52
#define IDC_statsNextPage 53
#define IDC_statsCurrentPage 54
#define IDC_actionsBox 90
#define IDC_actionsText1 9001
#define IDC_actionsButton1 9002
#define IDC_actionsText2 9003
#define IDC_actionsButton2 9004
#define IDC_actionsText3 9005
#define IDC_actionsButton3 9006
#define IDC_actionsText4 9007
#define IDC_actionsButton4 9008
#define IDC_actionsText5 9009
#define IDC_actionsButton5 9010
#define IDC_actionsPreviousPage 91
#define IDC_actionsNextPage 92
#define IDC_actionsCurrentPage 93

#define IDD_loadouts_display 1127002
#define IDC_centerBox 3
#define IDC_centerTitle 301
#define IDC_contentPanel 302
#define IDC_textEditBox 303
#define IDC_buttonSave 304
#define IDC_buttonLoad 305
#define IDC_buttonShare 306
#define IDC_buttonDelete 307
#define IDC_buttonRename 308
#define IDC_loadoutsSearchbar 309
#define IDC_buttonMyLoadoutsBackground 401
#define IDC_buttonMyLoadouts 402
#define IDC_buttonDefaultLoadoutsBackground 403
#define IDC_buttonDefaultLoadouts 404
#define IDC_buttonSharedLoadoutsBackground 405
#define IDC_buttonSharedLoadouts 406

// 3DEN Attribute
#define ATTRIBUTE_W (pixelW * pixelGrid * 0.5)
#define ATTRIBUTE_H (pixelH * pixelGrid * 0.5)

#define IDC_ATTRIBUTE_MODE 8100
#define IDC_ATTRIBUTE_CATEGORY 8101
#define IDC_ATTRIBUTE_LIST 8102
#define IDC_ATTRIBUTE_LIST_LEFT 8103
#define IDC_ATTRIBUTE_LIST_RIGHT 8104
#define IDC_ATTRIBUTE_SEARCH_BUTTON 8105
#define IDC_ATTRIBUTE_SEARCHBAR 8106
#define IDC_ATTRIBUTE_CLEAR_BUTTON 8107
#define IDC_ATTRIBUTE_EXPORT_BUTTON 8108
#define IDC_ATTRIBUTE_IMPORT_BUTTON 8109
#define IDC_ATTRIBUTE_ADD_COMPATIBLE 8110

// Indexes of categories
#define IDX_CAT_ALL 0
#define IDX_CAT_PRIMARY_WEAPON 1
#define IDX_CAT_SECONDARY_WEAPON 2
#define IDX_CAT_HANDGUN_WEAPON 3
#define IDX_CAT_OPTICS_ATTACHMENTS 4
#define IDX_CAT_FLASHLIGHT_ATTACHMENTS 5
#define IDX_CAT_MUZZLE_ATTACHMENTS 6
#define IDX_CAT_BIPOD_ATTACHMENTS 7
#define IDX_CAT_ITEMS_ALL 8
#define IDX_CAT_HEADGEAR 9
#define IDX_CAT_UNIFORM 10
#define IDX_CAT_VEST 11
#define IDX_CAT_BACKPACK 12
#define IDX_CAT_GOGGLES 13
#define IDX_CAT_NVG 14
#define IDX_CAT_BINO 15
#define IDX_CAT_MAP 16
#define IDX_CAT_COMPASS 17
#define IDX_CAT_RADIO 18
#define IDX_CAT_WATCH 19
#define IDX_CAT_COMMS 20
#define IDX_CAT_GRENADES 21
#define IDX_CAT_EXPLOSIVES 22
#define IDX_CAT_MISC_ITEMS 23

// Indexes of virtual items array
#define IDX_VIRT_WEAPONS 0
#define IDX_VIRT_PRIMARY_WEAPONS 0
#define IDX_VIRT_SECONDARY_WEAPONS 1
#define IDX_VIRT_HANDGUN_WEAPONS 2

#define IDX_VIRT_ATTACHMENTS 1
#define IDX_VIRT_OPTICS_ATTACHMENTS 0
#define IDX_VIRT_FLASHLIGHT_ATTACHMENTS 1
#define IDX_VIRT_MUZZLE_ATTACHMENTS 2
#define IDX_VIRT_BIPOD_ATTACHMENTS 3

#define IDX_VIRT_ITEMS_ALL 2
#define IDX_VIRT_HEADGEAR 3
#define IDX_VIRT_UNIFORM 4
#define IDX_VIRT_VEST 5
#define IDX_VIRT_BACKPACK 6
#define IDX_VIRT_GOGGLES 7
#define IDX_VIRT_NVG 8
#define IDX_VIRT_BINO 9
#define IDX_VIRT_MAP 10
#define IDX_VIRT_COMPASS 11
#define IDX_VIRT_RADIO 12
#define IDX_VIRT_WATCH 13
#define IDX_VIRT_COMMS 14
#define IDX_VIRT_GRENADES 15
#define IDX_VIRT_EXPLOSIVES 16
#define IDX_VIRT_MISC_ITEMS 17

#define IDX_VIRT_UNIQUE_MISC_ITEMS 18
#define IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL 19
#define IDX_VIRT_UNIQUE_GRENADES 20
#define IDX_VIRT_UNIQUE_EXPLOSIVES 21
#define IDX_VIRT_UNIQUE_ATTACHMENTS 22
#define IDX_VIRT_UNIQUE_BACKPACKS 23
#define IDX_VIRT_UNIQUE_GOGGLES 24
#define IDX_VIRT_UNIQUE_UNKNOWN_ITEMS 25

// Indexes of current items array
#define IDX_CURR_PRIMARY_WEAPON 0
#define IDX_CURR_SECONDARY_WEAPON 1
#define IDX_CURR_HANDGUN_WEAPON 2
#define IDX_CURR_HEADGEAR 3
#define IDX_CURR_UNIFORM 4
#define IDX_CURR_VEST 5
#define IDX_CURR_BACKPACK 6
#define IDX_CURR_GOGGLES 7
#define IDX_CURR_NVG 8
#define IDX_CURR_BINO 9
#define IDX_CURR_MAP 10
#define IDX_CURR_COMPASS 11
#define IDX_CURR_RADIO 12
#define IDX_CURR_WATCH 13
#define IDX_CURR_COMMS 14
#define IDX_CURR_UNIFORM_ITEMS 15
#define IDX_CURR_VEST_ITEMS 16
#define IDX_CURR_BACKPACK_ITEMS 17
#define IDX_CURR_PRIMARY_WEAPON_ITEMS 18
#define IDX_CURR_SECONDARY_WEAPON_ITEMS 19
#define IDX_CURR_HANDGUN_WEAPON_ITEMS 20
#define IDX_CURR_BINO_ITEMS 21

// Indexes of loadout items array
#define IDX_LOADOUT_PRIMARY_WEAPON 0
#define IDX_LOADOUT_SECONDARY_WEAPON 1
#define IDX_LOADOUT_HANDGUN_WEAPON 2
#define IDX_LOADOUT_UNIFORM 3
#define IDX_LOADOUT_VEST 4
#define IDX_LOADOUT_BACKPACK 5
#define IDX_LOADOUT_HEADGEAR 6
#define IDX_LOADOUT_GOGGLES 7
#define IDX_LOADOUT_BINO 8
#define IDX_LOADOUT_ASSIGNEDITEMS 9

#define SYMBOL_ITEM_NONE "−"
#define SYMBOL_ITEM_REMOVE "×"
#define SYMBOL_ITEM_VIRTUAL "∞"

#define FADE_DELAY 0.15
#define CAM_DIS_MAX 5

#define RIGHT_PANEL_CUSTOM_BUTTONS 61, 63, 65, 67, 69, 71, 73, 75, 77, 79
#define RIGHT_PANEL_CUSTOM_BACKGROUND 60, 62, 64, 66, 68, 70, 72, 74, 76, 78
#define RIGHT_PANEL_ACC_IDCS IDC_buttonOptic, IDC_buttonItemAcc, IDC_buttonMuzzle, IDC_buttonBipod
#define RIGHT_PANEL_ACC_BACKGROUND_IDCS IDC_iconBackgroundOptic, IDC_iconBackgroundItemAcc, IDC_iconBackgroundMuzzle, IDC_iconBackgroundBipod
#define RIGHT_PANEL_ITEMS_IDCS IDC_buttonMag, IDC_buttonMagALL, IDC_buttonThrow, IDC_buttonPut, IDC_buttonMisc, RIGHT_PANEL_CUSTOM_BUTTONS
#define RIGHT_PANEL_ITEMS_BACKGROUND_IDCS IDC_iconBackgroundMag, IDC_iconBackgroundMagALL, IDC_iconBackgroundThrow, IDC_iconBackgroundPut, IDC_iconBackgroundMisc, RIGHT_PANEL_CUSTOM_BACKGROUND
#define ARROWS_IDCS IDC_arrowMinus, IDC_arrowPlus

#define TOGGLE_RIGHT_PANEL_WEAPON\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 0;\
    _x ctrlShow true;\
    _x ctrlEnable true;\
    _x ctrlCommit FADE_DELAY;\
} forEach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_rightTabContent,\
    IDC_sortRightTab,\
    IDC_sortRightTabDirection,\
    RIGHT_PANEL_ACC_IDCS,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton,\
    IDC_buttonCurrentMag\
];\
private _buttonCurrentMag2Ctrl = _display displayCtrl IDC_buttonCurrentMag2;\
_buttonCurrentMag2Ctrl ctrlSetFade 0;\
_buttonCurrentMag2Ctrl ctrlShow true;\
_buttonCurrentMag2Ctrl ctrlEnable true;\
_buttonCurrentMag2Ctrl ctrlCommit FADE_DELAY;\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 1;\
    _x ctrlShow false;\
    _x ctrlEnable false;\
    _x ctrlCommit FADE_DELAY;\
} forEach [\
    IDC_loadIndicator,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_rightTabContentListnBox,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    IDC_buttonRemoveAll\
];\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetPosition [\
        safezoneX + safezoneW - 93 * GRID_W,\
        safezoneY + 14 * GRID_H,\
        80 * GRID_W,\
        safezoneH - 28 * GRID_H\
    ];\
    _x ctrlCommit 0;\
} forEach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground\
];

#define TOGGLE_RIGHT_PANEL_CONTAINER\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 0;\
    _x ctrlShow true;\
    _x ctrlEnable true;\
    _x ctrlCommit FADE_DELAY;\
} forEach [\
    IDC_blockRightFrame, \
    IDC_blockRighttBackground,\
    IDC_loadIndicator,\
    IDC_rightTabContentListnBox,\
    IDC_sortRightTab,\
    IDC_sortRightTabDirection,\
    IDC_tabRight,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton\
];\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 1;\
    _x ctrlShow false;\
    _x ctrlEnable false;\
    _x ctrlCommit FADE_DELAY;\
} forEach [\
    IDC_buttonCurrentMag,\
    IDC_buttonCurrentMag2,\
    IDC_iconBackgroundCurrentMag,\
    IDC_iconBackgroundCurrentMag2\
];\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetPosition [\
        safezoneX + safezoneW - 93 * GRID_W,\
        safezoneY + 14 * GRID_H,\
        80 * GRID_W,\
        safezoneH - 34 * GRID_H\
    ];\
    _x ctrlCommit 0;\
} forEach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground\
];\
if (!isNil QGVAR(customRightPanelButtons)) then {\
    private _miscOffset = 0;\
    {\
        if (!isNil "_x") then {\
            _x params ["", "_picture", "_tooltip"];\
            _miscOffset = _forEachIndex + 1;\
            private _plusId = _forEachIndex * 2;\
            if (isNull (_display displayCtrl (60 + _plusId))) then {\
                private _ctrl = _display ctrlCreate [QGVAR(customArsenalButton_Background), 60 + _plusId];\
                _ctrl ctrlSetPosition [\
                    safezoneW + safezoneX - 13 * GRID_W,\
                    safezoneY + (88 + (10 * _forEachIndex)) * GRID_H\
                ];\
                _ctrl ctrlCommit 0;\
            };\
            if (isNull (_display displayCtrl (61 + _plusId))) then {\
                _ctrl = _display ctrlCreate [QGVAR(customArsenalButton_Button), 61 + _plusId];\
                _ctrl ctrlSetPosition [\
                    safezoneW + safezoneX - 10 * GRID_W,\
                    safezoneY + (88 + (10 * _forEachIndex)) * GRID_H\
                ];\
                _ctrl ctrlSetText _picture;\
                _ctrl ctrlSetTooltip _tooltip;\
                _ctrl ctrlCommit 0;\
            };\
        };\
    } forEach GVAR(customRightPanelButtons);\
    {\
        _x = _display displayCtrl _x;\
        _x ctrlSetPosition [\
            safezoneW + safezoneX - (10 + (3 * _forEachIndex)) * GRID_W,\
            safezoneY + (88 + (10 * _miscOffset)) * GRID_H\
        ];\
        _x ctrlCommit 0;\
    } forEach [IDC_buttonMisc, IDC_iconBackgroundMisc];\
};

#define TOGGLE_RIGHT_PANEL_HIDE\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 1;\
    _x ctrlShow false;\
    _x ctrlEnable false;\
    _x ctrlCommit FADE_DELAY;\
} forEach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_loadIndicator,\
    IDC_rightTabContent,\
    IDC_rightTabContentListnBox,\
    IDC_sortRightTab,\
    IDC_sortRightTabDirection,\
    RIGHT_PANEL_ACC_BACKGROUND_IDCS,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_buttonRemoveAll,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton,\
    IDC_buttonCurrentMag,\
    IDC_buttonCurrentMag2,\
    IDC_iconBackgroundCurrentMag,\
    IDC_iconBackgroundCurrentMag2\
];

#define ADD_LOADOUTS_LIST_PICTURES\
    _contentPanelCtrl lnbSetPicture [[_newRow, 2], getText (_cfgWeapons >> (_loadout select IDX_LOADOUT_PRIMARY_WEAPON) select 0 >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 3], getText (_cfgWeapons >> (_loadout select IDX_LOADOUT_SECONDARY_WEAPON) select 0 >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 4], getText (_cfgWeapons >> (_loadout select IDX_LOADOUT_HANDGUN_WEAPON) select 0 >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 5], getText (_cfgWeapons >> (_loadout select IDX_LOADOUT_UNIFORM) select 0 >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 6], getText (_cfgWeapons >> (_loadout select IDX_LOADOUT_VEST) select 0 >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "CfgVehicles" >> (_loadout select IDX_LOADOUT_BACKPACK) select 0 >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 8], getText (_cfgWeapons >> _loadout select IDX_LOADOUT_HEADGEAR >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "CfgGlasses" >> _loadout select IDX_LOADOUT_GOGGLES >> "picture")];
