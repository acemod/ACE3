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

PARAMS_1(_newMode);
systemChat format ["Switching App To %1", _newMode];

disableSerialization;
_display = (uiNamespace getVariable ["testGPS", displayNull]);
if (isNull _display) then { _display = (uiNamespace getVariable ["testGPS_T", displayNull]);};
if (isNull _display) exitWith {};

if (GVAR(currentApplicationPage) == 2) then {
    _theMap = if (!GVAR(mapShowTexture)) then {_display displayCtrl IDC_MAPPLAIN} else {_display displayCtrl IDC_MAPDETAILS};
    _pos = ctrlPosition _theMap;
    _mapSize = _pos select 3;
    _centerPos = [((_pos select 0) + (_pos select 2) / 2), ((_pos select 1) + (_pos select 3) / 2)];
    GVAR(mapPosition) = _theMap ctrlMapScreenToWorld _centerPos;
    GVAR(mapZoom) = (ctrlMapScale _theMap) * _mapSize;
    //Hit button again, toggle map modes:
    if (_newMode == 2) then {
        GVAR(mapShowTexture) = !GVAR(mapShowTexture);
    };
};
if (_newMode != -1) then {
    GVAR(currentApplicationPage) = _newMode;
    [] call FUNC(showApplicationPage);
};
