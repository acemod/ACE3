/*
 * Author: Gundy
 *
 * Description:
 *   Process onKeyDown events from BFT dialogs
 *
 * Arguments:
 *   0: Display that called the onKeyDown event <OBJECT>
 *   1: DIK code of onKeyDown event <INTEGER>
 *   2: Shift key pressed <BOOLEAN>
 *   3: Ctrl key pressed <BOOLEAN>
 *   4: Alt key pressed <BOOLEAN>
 *
 * Return Value:
 *   If onKeyDown event was acted upon <BOOL>
 *
 * Example:
 *   [_display,_dikCode,_shiftKey,_ctrlKey,_altKey] call ace_bft_devices_fnc_ifOnKeyDown;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private["_displayName","_interfaceID","_mapTypes","_currentMapType","_currentMapTypeIndex","_ctrlScreen","_markerIndex","_mode"];

PARAMS_5(_display,_dikCode,_shiftKey,_ctrlKey,_altKey);

_displayName = I_GET_NAME;
_interfaceID = I_GET_ID;

if (_dikCode == DIK_F1 && {_displayName in [QGVAR(DK10_dlg),QGVAR(GD300_dlg)]}) exitWith {
    [_interfaceID,[["mode","BFT"]]] call FUNC(setSettings);
    true
};
if (_dikCode == DIK_F2 && {_displayName in [QGVAR(DK10_dlg)]}) exitWith {
    [_interfaceID,[["mode","UAV"]]] call FUNC(setSettings);
    true
};
if (_dikCode == DIK_F3 && {_displayName in [QGVAR(DK10_dlg)]}) exitWith {
    _mode = [_interfaceID,"mode"] call FUNC(getSettings);
    _mode = if (_mode == "HCAM") then {"HCAM_FULL"} else {"HCAM"};
    [_interfaceID,[["mode",_mode]]] call FUNC(setSettings);
    true
};
if (_dikCode == DIK_F4 && {_displayName in [QGVAR(DK10_dlg),QGVAR(GD300_dlg)]}) exitWith {
    [_interfaceID,[["mode","MESSAGE"]]] call FUNC(setSettings);
    true
};
if (_dikCode == DIK_F5 && {_displayName in [QGVAR(DK10_dlg),QGVAR(GD300_dlg),QGVAR(TAD_dlg),QGVAR(MicroDAGR_dlg),QGVAR(JV5_dlg)]}) exitWith {
    [_interfaceID] call FUNC(toggleMapTools);
    true
};
if (_dikCode == DIK_F6 && {_displayName in [QGVAR(DK10_dlg),QGVAR(GD300_dlg),QGVAR(TAD_dlg),QGVAR(MicroDAGR_dlg),QGVAR(JV5_dlg)]}) exitWith {
    [_interfaceID] call FUNC(toggleMapType);
    true
};
if (_dikCode == DIK_F7 && {_displayName in [QGVAR(DK10_dlg),QGVAR(GD300_dlg),QGVAR(TAD_dlg),QGVAR(MicroDAGR_dlg),QGVAR(JV5_dlg)]}) exitWith {
    [_interfaceID] call FUNC(centerMapOnPlayerPosition);
    true
};
if (_dikCode == DIK_DELETE && {GVAR(cursorOnMap)}) exitWith {
    _mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
    _currentMapType = [_interfaceID,"mapType"] call FUNC(getSettings);
    _currentMapTypeIndex = (_mapTypes select 0) find _currentMapType;
    _ctrlScreen = _display displayCtrl ((_mapTypes select 1) select _currentMapTypeIndex);
    /*_markerIndex = [_ctrlScreen,GVAR(mapCursorPos)] call FUNC(findUserMarker);
    if (_markerIndex != -1) then {
        [call FUNC(getPlayerEncryptionKey),_markerIndex] call FUNC(deleteUserMarker);
    };*/
    true
};

false