#include "script_component.hpp"

params ["_ctrl"];

private _alt = (ctrlParent _ctrl) ctrlCreate [QGVAR(alt), -1];

private _units = cameraOn call FUNC(altUnits);
_units call FUNC(altInfo) params ["_unitText", "_ratio"];

((ctrlParent _alt) displayCtrl 1005) ctrlSetText _unitText;
GVAR(altRatio) = _ratio;

private _settingEH = ["CBA_SettingChanged", {
    params ["_setting", "_value"];
    _thisArgs params ["_settingName", "_alt"];
    if (_setting isEqualTo _settingName) then {
        [_value] call FUNC(altInfo) params ["_unitText", "_ratio"];
        ((ctrlParent _alt) displayCtrl 1005) ctrlSetText _unitText;
        GVAR(altRatio) = _ratio;
    };
}, [_units select 1, _alt]] call CBA_fnc_addEventHandlerArgs;

[{
    (_this select 0) params ["_ctrl", "_alt", "_settingEH"];
    if (isNull _ctrl) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        ["CBA_SettingChanged", _settingEH] call CBA_fnc_removeEventHandler;
    };
    _ctrl ctrlSetFade 1;
    _ctrl ctrlCommit 0;
    private _vehicle = cameraOn;
    private _rawAlt = ((getPosATL _vehicle) select 2) + (0 min (getTerrainHeightASL getPos _vehicle));
    private _altValue = _rawAlt / GVAR(altRatio);
    if (_altValue < 10) then {
        _altValue = _altValue toFixed 1;
    } else {
        _altValue = _altValue toFixed 0;
    };
    _alt ctrlSetText _altValue;
}, 0, [_ctrl, _alt, _settingEH]] call CBA_fnc_addPerFrameHandler;
