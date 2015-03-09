/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Third Optional Argument <BOOL><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#include "script_component.hpp"

disableSerialization;

_display = displayNull;
if (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG) then {
    _display = (uiNamespace getVariable [QGVAR(DialogDisplay), displayNull]);
} else {
    _display = (uiNamespace getVariable [QGVAR(RscTitleDisplay), displayNull]);
};
if (isNull _display) exitWith {ERROR("No Display");};

systemChat format ["Showing %1 on %2", GVAR(currentApplicationPage), _display];

//Fade "shell" at night: TODO: find beter amibent light code
_daylight = (1 - cos (daytime * 360/24)) / 2;
(_display displayCtrl IDC_MICRODAGRSHELL) ctrlSetTextColor [_daylight, _daylight, _daylight, 1];

//TopBar
(_display displayCtrl IDC_RANGEFINDERCONNECTEDICON) ctrlShow (GVAR(currentWaypoint) == -2);

//Mode: Info:
(_display displayCtrl IDC_MODEDISPLAY) ctrlShow (GVAR(currentApplicationPage) == 0);

if (GVAR(currentApplicationPage) == 0) then {
    (_display displayCtrl IDC_MODEDISPLAY_UTMGRID) ctrlSetText GVAR(mgrsGridZoneDesignator);
    if (GVAR(currentWaypoint) == -1) then {
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTIMECG) ctrlShow true;
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTARGETCG) ctrlShow false;
    } else {
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTIMECG) ctrlShow false;
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTARGETCG) ctrlShow true;
        if (GVAR(currentWaypoint) == -2) then {
            (_display displayCtrl IDC_MODEDISPLAY_TARGETICON) ctrlSetText "\A3\ui_f\data\igui\rscingameui\rscoptics\laser_designator_iconLaserOn.paa"
        } else {
            (_display displayCtrl IDC_MODEDISPLAY_TARGETICON) ctrlSetText QUOTE(PATHTOF(images\icon_menuMark.paa));
        };
    };
};

//Mode: Compass:
(_display displayCtrl IDC_MODECOMPASS) ctrlShow (GVAR(currentApplicationPage) == 1);
(_display displayCtrl IDC_MAPCOMPASS) ctrlShow (GVAR(currentApplicationPage) == 1);


//Mode: Map
(_display displayCtrl IDC_MODEMAP_MAPTRACKBUTTON) ctrlShow (GVAR(currentApplicationPage) == 2);
(_display displayCtrl IDC_MODEMAP_MAPZOOMIN) ctrlShow (GVAR(currentApplicationPage) == 2);
(_display displayCtrl IDC_MODEMAP_MAPZOOMOUT) ctrlShow (GVAR(currentApplicationPage) == 2);

(_display displayCtrl IDC_MAPPLAIN) ctrlShow ((GVAR(currentApplicationPage) == 2) && {!GVAR(mapShowTexture)});
(_display displayCtrl IDC_MAPDETAILS) ctrlShow ((GVAR(currentApplicationPage) == 2) && {GVAR(mapShowTexture)});

if (GVAR(currentApplicationPage) == 2) then {
    _theMap = if (!GVAR(mapShowTexture)) then {_display displayCtrl IDC_MAPPLAIN} else {_display displayCtrl IDC_MAPDETAILS};
    _mapSize = (ctrlPosition _theMap) select 3;
    _theMap ctrlMapAnimAdd [0, (GVAR(mapZoom) / _mapSize), GVAR(mapPosition)];
    ctrlMapAnimCommit _theMap;
    if (GVAR(mapAutoTrackPosition)) then {
        (_display displayCtrl IDC_MODEMAP_MAPTRACKBUTTON) ctrlSetTextColor [1,1,1,0.8];
    } else {
        (_display displayCtrl IDC_MODEMAP_MAPTRACKBUTTON) ctrlSetTextColor [1,1,1,0.4];
    };
};

//Mode: Menu
(_display displayCtrl IDC_MODEMENU) ctrlShow (GVAR(currentApplicationPage) == 3);

//Mode: Mark
if (GVAR(currentApplicationPage) == APP_MODE_MARK) then {
    (_display displayCtrl IDC_MODEMARK) ctrlShow true;
    //not backed up for displayMode swap, not a big deal


    if ((count GVAR(newWaypointPosition)) == 0) then {
        (_display displayCtrl IDC_MODEMARK_HEADER) ctrlSetText format ["Enter Grid Cords:"];
        (_display displayCtrl IDC_MODEMARK_CORDSEDIT) ctrlSetText "";
    } else {
        (_display displayCtrl IDC_MODEMARK_HEADER) ctrlSetText format ["Name of [%1]", mapGridPosition GVAR(newWaypointPosition)];
        (_display displayCtrl IDC_MODEMARK_CORDSEDIT) ctrlSetText format ["[%1]", mapGridPosition GVAR(newWaypointPosition)];
    };
    ctrlSetFocus (_display displayCtrl IDC_MODEMARK_CORDSEDIT);
} else {
    (_display displayCtrl IDC_MODEMARK) ctrlShow false;
    GVAR(newWaypointPosition) = [];
};

//Mode: Waypoints
(_display displayCtrl IDC_MODEWAYPOINTS) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_WAYPOINTS);
systemChat format ["WP %1 on %2", (GVAR(currentApplicationPage) == APP_MODE_WAYPOINTS), _display];


//Button's pushed:
if (GVAR(currentApplicationPage) == 0) then {
    (_display displayCtrl IDC_BUTTONBG0) ctrlSetText QUOTE(PATHTOF(images\button_pushedDown.paa));
} else {
    (_display displayCtrl IDC_BUTTONBG0) ctrlSetText QUOTE(PATHTOF(images\button_pushedUp.paa));
};
if (GVAR(currentApplicationPage) == 1) then {
    (_display displayCtrl IDC_BUTTONBG1) ctrlSetText QUOTE(PATHTOF(images\button_pushedDown.paa));
} else {
    (_display displayCtrl IDC_BUTTONBG1) ctrlSetText QUOTE(PATHTOF(images\button_pushedUp.paa));
};
if (GVAR(currentApplicationPage) == 2) then {
    (_display displayCtrl IDC_BUTTONBG2) ctrlSetText QUOTE(PATHTOF(images\button_pushedDown.paa));
} else {
    (_display displayCtrl IDC_BUTTONBG2) ctrlSetText QUOTE(PATHTOF(images\button_pushedUp.paa));
};

//Update the page now:
[] call FUNC(updateDisplay);
