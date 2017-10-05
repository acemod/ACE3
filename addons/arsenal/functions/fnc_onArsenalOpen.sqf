#include "script_component.hpp"
#include "..\defines.hpp"

params ["_mode", "_args"];
_args params ["_display"];

// BI defines, might be of use later
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
            _ctrlList lbsetpictureright [_lbAdd,(modParams [_dlcName,["logo"]]) param [0,""]];\
            _modID = _modList find _dlcName;\
            if (_modID < 0) then {_modID = _modList pushback _dlcName;};\
            _ctrlList lbsetvalue [_lbAdd,_modID];\
        };\
    };

#define MODLIST ["","curator","kart","heli","mark","expansion","expansionpremium"]
#define CAM_DIS_MAX 5

// Start loading screen, will be needed after camera stuff is added
["ace_arsenal"] call bis_fnc_startloadingscreen;

missionNamespace setVariable [QGVAR(center), player];

cuttext ["","plain"];
showcommandingmenu "";

// Force consistent blurring, restored after display is closed

/*
GVAR(cameraView) = cameraview;
player switchcamera "internal";
*/
showhud false;

// ------------------------------------------------------------------- Events
// Fade out unused elements

private _mouseBlockCtrl = _display displayctrl IDC_mouseBlock;
_mouseBlockCtrl ctrlEnable false;

private _msgCtrl = _display displayctrl IDC_message;
_msgCtrl ctrlSetFade 1;
_msgCtrl ctrlCommit 0;

private _infoCtrl = _display displayctrl IDC_infoBox;
_infoCtrl ctrlSetFade 1;
_infoCtrl ctrlCommit 0;

private _statsCtrl = _display displayctrl IDC_stats;
_statsCtrl ctrlSetFade 1;
_statsCtrl ctrlCommit 0;
_statsCtrl ctrlEnable false;

["ace_arsenal"] call bis_fnc_endloadingscreen;