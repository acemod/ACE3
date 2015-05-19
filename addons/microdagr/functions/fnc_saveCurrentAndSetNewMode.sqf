/*
 * Author: PabstMirror
 * Saves the current mode and sets a new mode
 * Used to backup display when switching display modes
 *
 * Arguments:
 * 0: New Mode <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [2] call ace_microdagr_fnc_saveCurrentAndSetNewMode
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_display", "_theMap", "_mapSize", "_centerPos", "_mapCtrlPos"];

PARAMS_1(_newMode);

disableSerialization;
_display = displayNull;
if (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG) then {
    _display = (uiNamespace getVariable [QGVAR(DialogDisplay), displayNull]);
} else {
    _display = (uiNamespace getVariable [QGVAR(RscTitleDisplay), displayNull]);
};
if (isNull _display) exitWith {ERROR("No Display");};

if (GVAR(currentApplicationPage) == 2) then {
    _theMap = if (!GVAR(mapShowTexture)) then {_display displayCtrl IDC_MAPPLAIN} else {_display displayCtrl IDC_MAPDETAILS};
    _mapCtrlPos = ctrlPosition _theMap;
    _mapSize = _mapCtrlPos select 3;
    _centerPos = [((_mapCtrlPos select 0) + (_mapCtrlPos select 2) / 2), ((_mapCtrlPos select 1) + (_mapCtrlPos select 3) / 2)];
    GVAR(mapPosition) = _theMap ctrlMapScreenToWorld _centerPos;
    GVAR(mapZoom) = (ctrlMapScale _theMap) * _mapSize;

    //Hit button again, toggle map modes:
    if (_newMode == 2) then {
        if (GVAR(mapShowTexture)) then {
            GVAR(mapShowTexture) = false;
        } else {
            if (GVAR(MapDataAvailable) == MAP_DETAIL_SAT) then {
                GVAR(mapShowTexture) = true;
            };
        };
    };
};

//Can't switch to map if no map loaded
if (_newMode == APP_MODE_MAP) then {
    if (GVAR(MapDataAvailable) == MAP_DETAIL_NONE) then {
        _newMode = -1;
    };
};

if (_newMode != -1) then {
    GVAR(currentApplicationPage) = _newMode;
    [] call FUNC(showApplicationPage);
};
