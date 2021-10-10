#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Changes the "application page" shown on the microDAGR
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_microdagr_fnc_showApplicationPage
 *
 * Public: No
 */

disableSerialization;

private _display = uiNamespace getVariable [[QGVAR(RscTitleDisplay), QGVAR(DialogDisplay)] select (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG), displayNull];

if (isNull _display) exitWith {ERROR("No Display");};

//TopBar
(_display displayCtrl IDC_RANGEFINDERCONNECTEDICON) ctrlShow (GVAR(currentWaypoint) == -2);

//Mode: Info:
(_display displayCtrl IDC_MODEDISPLAY) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_INFODISPLAY);

if (GVAR(currentApplicationPage) == APP_MODE_INFODISPLAY) then {
    (_display displayCtrl IDC_MODEDISPLAY_UTMGRID) ctrlSetText GVAR(mgrsGridZoneDesignator);
    if (GVAR(currentWaypoint) == -1) then {
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTIMECG) ctrlShow true;
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTARGETCG) ctrlShow false;
    } else {
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTIMECG) ctrlShow false;
        (_display displayCtrl IDC_MODEDISPLAY_MODEPOSTARGETCG) ctrlShow true;
        if (GVAR(currentWaypoint) == -2) then {
            (_display displayCtrl IDC_MODEDISPLAY_TARGETICON) ctrlSetText QUOTE(PATHTOF(images\icon_menuLaser.paa));
        } else {
            (_display displayCtrl IDC_MODEDISPLAY_TARGETICON) ctrlSetText QPATHTOF(images\icon_menuMark.paa);
        };
    };
};

//Mode: Compass:
(_display displayCtrl IDC_MODECOMPASS) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_COMPASS);
(_display displayCtrl IDC_MAPCOMPASS) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_COMPASS);


//Mode: Map
(_display displayCtrl IDC_MODEMAP_MAPTRACKBUTTON) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_MAP);
(_display displayCtrl IDC_MODEMAP_MAPZOOMIN) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_MAP);
(_display displayCtrl IDC_MODEMAP_MAPZOOMOUT) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_MAP);

(_display displayCtrl IDC_MAPPLAIN) ctrlShow ((GVAR(currentApplicationPage) == APP_MODE_MAP) && {!GVAR(mapShowTexture)});
(_display displayCtrl IDC_MAPDETAILS) ctrlShow ((GVAR(currentApplicationPage) == APP_MODE_MAP) && {GVAR(mapShowTexture)});

if (GVAR(currentApplicationPage) == APP_MODE_MAP) then {
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
(_display displayCtrl IDC_MODEMENU) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_MENU);

//Mode: Mark
if (GVAR(currentApplicationPage) == APP_MODE_MARK) then {
    (_display displayCtrl IDC_MODEMARK) ctrlShow true;
    //not backed up for displayMode swap, not a big deal


    if ((count GVAR(newWaypointPosition)) == 0) then {
        (_display displayCtrl IDC_MODEMARK_HEADER) ctrlSetText (localize LSTRING(wpEnterCords));
        (_display displayCtrl IDC_MODEMARK_CORDSEDIT) ctrlSetText "";
    } else {
        (_display displayCtrl IDC_MODEMARK_HEADER) ctrlSetText format [(localize LSTRING(wpEnterName)), mapGridPosition GVAR(newWaypointPosition)];
        (_display displayCtrl IDC_MODEMARK_CORDSEDIT) ctrlSetText format ["[%1]", mapGridPosition GVAR(newWaypointPosition)];
    };
    ctrlSetFocus (_display displayCtrl IDC_MODEMARK_CORDSEDIT);
} else {
    (_display displayCtrl IDC_MODEMARK) ctrlShow false;
    GVAR(newWaypointPosition) = [];
};

//Mode: Waypoints
(_display displayCtrl IDC_MODEWAYPOINTS) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_WAYPOINTS);

//Mode: Setting
(_display displayCtrl IDC_MODESETTINGS) ctrlShow (GVAR(currentApplicationPage) == APP_MODE_SETUP);

//Buttons pushed:
if (GVAR(currentApplicationPage) == APP_MODE_INFODISPLAY) then {
    (_display displayCtrl IDC_BUTTONBG0) ctrlSetText QPATHTOF(images\button_pushedDown.paa);
} else {
    (_display displayCtrl IDC_BUTTONBG0) ctrlSetText QPATHTOF(images\button_pushedUp.paa);
};
if (GVAR(currentApplicationPage) == APP_MODE_COMPASS) then {
    (_display displayCtrl IDC_BUTTONBG1) ctrlSetText QPATHTOF(images\button_pushedDown.paa);
} else {
    (_display displayCtrl IDC_BUTTONBG1) ctrlSetText QPATHTOF(images\button_pushedUp.paa);
};
if (GVAR(currentApplicationPage) == APP_MODE_MAP) then {
    (_display displayCtrl IDC_BUTTONBG2) ctrlSetText QPATHTOF(images\button_pushedDown.paa);
} else {
    (_display displayCtrl IDC_BUTTONBG2) ctrlSetText QPATHTOF(images\button_pushedUp.paa);
};

//Update the page now:
[] call FUNC(updateDisplay);
