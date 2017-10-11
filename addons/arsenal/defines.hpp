// Pixel grid
#define pixelScale  0.50
#define GRID_W (pixelW * pixelGrid * pixelScale)
#define GRID_H (pixelH * pixelGrid * pixelScale)

// IDCs
#define IDD_ace_arsenal 1127001
#define IDC_mouseArea 0
#define IDC_blockLeftFrame 1
#define IDC_blockLeftBackground 2
#define IDC_blockRightFrame 3
#define IDC_blockRighttBackground 4
#define IDC_loadIndicator 5
#define IDC_message 6
#define IDC_menuBar 7
#define IDC_menuBarBackground 8
#define IDC_buttonClose 9
#define IDC_buttonSave 10
#define IDC_buttonLoad 11
#define IDC_buttonImport 12
#define IDC_buttonExport 13
#define IDC_buttonHide 14
#define IDC_infoBox 15
#define IDC_infoBackground 16
#define IDC_infoName 17
#define IDC_infoAuthor 18
#define IDC_DLCBackground 19
#define IDC_DLCIcon 20
#define IDC_mouseBlock 43
#define IDC_leftTabContent 44
#define IDC_rightTabContent 45
#define IDC_sortLeftTab 46
#define IDC_sortRightTab 47
#define IDC_leftSearchbar 48
#define IDC_rightSearchbar 49
#define IDC_tabLeft 50
#define IDC_iconBackgroundPrimaryWeapon 51
#define IDC_buttonPrimaryWeapon 52
#define IDC_iconBackgroundHandgun 53
#define IDC_buttonHandgun 54
#define IDC_iconBackgroundSecondaryWeapon 55
#define IDC_buttonSecondaryWeapon 56
#define IDC_iconBackgroundHeadgear 57
#define IDC_buttonHeadgear 58
#define IDC_iconBackgroundUniform 59
#define IDC_buttonUniform 60
#define IDC_iconBackgroundVest 61
#define IDC_buttonVest 62
#define IDC_iconBackgroundBackpack 63
#define IDC_buttonBackpack 64
#define IDC_iconBackgroundGoggles 65
#define IDC_buttonGoggles 66
#define IDC_iconBackgroundNVG 67
#define IDC_buttonNVG 68
#define IDC_iconBackgroundBinoculars 69
#define IDC_buttonBinoculars 70
#define IDC_iconBackgroundMap 71
#define IDC_buttonMap 72
#define IDC_iconBackgroundGPS 73
#define IDC_buttonGPS 74
#define IDC_iconBackgroundRadio 75
#define IDC_buttonRadio 76
#define IDC_iconBackgroundCompass 77
#define IDC_buttonCompass 78
#define IDC_iconBackgroundWatch 79
#define IDC_buttonWatch 80
#define IDC_iconBackgroundFace 81
#define IDC_buttonFace 82
#define IDC_iconBackgroundVoice 83
#define IDC_buttonVoice 84
#define IDC_iconBackgroundInsigna 85
#define IDC_buttonInsigna 86
#define IDC_iconBackgroundOptic 87
#define IDC_buttonOptic 88
#define IDC_iconBackgroundItemAcc 89
#define IDC_buttonItemAcc 90
#define IDC_iconBackgroundMuzzle 91
#define IDC_buttonMuzzle 92
#define IDC_iconBackgroundBipod 93
#define IDC_buttonBipod 94
#define IDC_iconBackgroundMag 95
#define IDC_buttonMag 96
#define IDC_iconBackgroundMagALL 97
#define IDC_buttonMagALL 98
#define IDC_iconBackgroundThrow 99
#define IDC_buttonThrow 100
#define IDC_iconBackgroundPut 101
#define IDC_buttonPut 102
#define IDC_iconBackgroundMisc 103
#define IDC_buttonMisc 104
#define IDC_buttonRemoveAllSelected 105
#define IDC_buttonRemoveAll 106


#define FADE_DELAY 0.15
#define CAM_DIS_MAX 5

#define RIGHT_PANEL_ACC_IDCS IDC_buttonOptic, IDC_buttonItemAcc, IDC_buttonMuzzle, IDC_buttonBipod
#define RIGHT_PANEL_ACC_BACKGROUND_IDCS IDC_iconBackgroundOptic, IDC_iconBackgroundItemAcc, IDC_iconBackgroundMuzzle, IDC_iconBackgroundBipod
#define RIGHT_PANEL_ITEMS_IDCS IDC_buttonMag, IDC_buttonMagALL, IDC_buttonThrow, IDC_buttonPut, IDC_buttonMisc
#define RIGHT_PANEL_ITEMS_BACKGROUND_IDCS IDC_iconBackgroundMag, IDC_iconBackgroundMagALL, IDC_iconBackgroundThrow, IDC_iconBackgroundPut, IDC_iconBackgroundMisc
#define RIGHT_PANEL_REMOVE_IDCS IDC_buttonRemoveAllSelected, IDC_buttonRemoveAll

#define GETDLC\
    {\
        private _dlc = "";\
        private _addons = configsourceaddonlist _this;\
        if (count _addons > 0) then {\
            private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);\
            if (count _mods > 0) then {\
                _dlc = _mods select 0;\
            };\
        };\
        _dlc\
    }

#define ADDMODICON\
    {\
        private _dlcName = _this call GETDLC;\
        if (_dlcName != "") then {\
            _ctrlPanel lbsetpictureright [_lbAdd,(modParams [_dlcName,["logo"]]) param [0,""]];\
            _modID = _modList find _dlcName;\
            if (_modID < 0) then {_modID = _modList pushback _dlcName;};\
            _ctrlPanel lbsetvalue [_lbAdd,_modID];\
        };\
    };

#define ADDBINOCULARSMAG\
    private _magazines = getarray (configfile >> "cfgweapons" >> _item >> "magazines");\
    if (count _magazines > 0) then {GVAR(center) addmagazine (_magazines select 0)};

#define TOGGLE_RIGHT_PANEL_WEAPON\
{\
    _x = _display displayCtrl _x;\
\
    if (ctrlFade _x != 0) then {\
        _x ctrlSetFade 0;\
    };\
    if !(ctrlShown _x) then {\
        _x ctrlShow true;\
    };\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_rightTabContent,\
    IDC_sortRightTab,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_REMOVE_IDCS,\
    IDC_rightSearchbar\
];\
{\
    _x = _display displayCtrl _x;\
\
    if (ctrlFade _x != 1) then {\
        _x ctrlSetFade 1;\
    };\
    if (ctrlShown _x) then {\
        _x ctrlShow false;\
    };\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_loadIndicator,\
    RIGHT_PANEL_ITEMS_IDCS,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    RIGHT_PANEL_REMOVE_IDCS\
];

#define TOGGLE_RIGHT_PANEL_CONTAINER\
{\
    _x = _display displayCtrl _x;\
\
    if (ctrlFade _x != 0) then {\
        _x ctrlSetFade 0;\
    };\
    if !(ctrlShown _x) then {\
        _x ctrlShow true;\
    };\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame, \
    IDC_blockRighttBackground,\
    IDC_rightTabContent,\
    IDC_sortRightTab,\
    IDC_tabRight,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_ITEMS_IDCS,\
    RIGHT_PANEL_REMOVE_IDCS,\
    IDC_rightSearchbar\
];

#define TOGGLE_RIGHT_PANEL_HIDE\
{\
    _x = _display displayCtrl _x;\
    if (ctrlFade _x != 1) then {\
        _x ctrlSetFade 1;\
    };\
    if (ctrlShown _x) then {\
        _x ctrlShow false;\
    };\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_loadIndicator,\
    IDC_rightTabContent,\
    IDC_sortRightTab,\
    RIGHT_PANEL_ACC_BACKGROUND_IDCS,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    RIGHT_PANEL_ITEMS_IDCS,\
    RIGHT_PANEL_REMOVE_IDCS,\
    IDC_rightSearchbar\
];

#define LIST_DEFAULTS\
    [\
    [\
        (primaryweapon GVAR(center) call bis_fnc_baseWeapon),\
        (secondaryweapon GVAR(center) call bis_fnc_baseWeapon),\
        (handgunweapon GVAR(center) call bis_fnc_baseWeapon)\
    ],\
    ((GVAR(center) weaponAccessories (primaryWeapon GVAR(center))) + (GVAR(center) weaponAccessories (secondaryWeapon GVAR(center))) + (GVAR(center) weaponAccessories (handgunWeapon GVAR(center)))) select {!(_x isEqualTo "")}\
    ,\
    magazines GVAR(center),\
    [headgear GVAR(center)],\
    [uniform GVAR(center)],\
    [vest GVAR(center)],\
    [backpack GVAR(center)],\
    [goggles GVAR(center)],\
    [hmd GVAR(center)],\
    [binocular GVAR(center)]\
]
