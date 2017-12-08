/*
 * Author: PabstMirror
 * Saves the current mode and sets a new mode
 * Used to backup display when switching display modes
 *
 * Arguments:
 * 0: New Mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [2] call ace_microdagr_fnc_saveCurrentAndSetNewMode
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_newMode"];

disableSerialization;
private _display = uiNamespace getVariable [[QGVAR(RscTitleDisplay), QGVAR(DialogDisplay)] select (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG), displayNull];

if (isNull _display) exitWith {ERROR("No Display");};

if (GVAR(currentApplicationPage) == 2) then {
    private _theMap = [_display displayCtrl IDC_MAPDETAILS, _display displayCtrl IDC_MAPPLAIN] select (!GVAR(mapShowTexture));
    private _mapCtrlPos = ctrlPosition _theMap;

    _mapCtrlPos params ["_mapCtrlPosX", "_mapCtrlPosY", "_mapCtrlPosZ", "_mapSize"];
    private _centerPos = [(_mapCtrlPosX + _mapCtrlPosZ / 2), (_mapCtrlPosY + _mapSize / 2)];
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
