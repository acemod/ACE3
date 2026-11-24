#include "script_component.hpp"

params ["_ctrl"];

private _speed = (ctrlParent _ctrl) ctrlCreate [QGVAR(speed), -1];

private _units = cameraOn call FUNC(speedUnits);
_units call FUNC(speedInfo) params ["_unitText", "_ratio"];

((ctrlParent _speed) displayCtrl 1004) ctrlSetText _unitText;
GVAR(speedRatio) = _ratio;

private _settingEH = ["CBA_SettingChanged", {
    params ["_setting", "_value"];
    _thisArgs params ["_settingName", "_speed"];
    if (_setting isEqualTo _settingName) then {
        [_value] call FUNC(speedInfo) params ["_unitText", "_ratio"];
        ((ctrlParent _speed) displayCtrl 1004) ctrlSetText _unitText;
        GVAR(speedRatio) = _ratio;
    };
}, [_units select 1, _speed]] call CBA_fnc_addEventHandlerArgs;

[{
    (_this select 0) params ["_ctrl", "_speed", "_settingEH"];
    if (isNull _ctrl) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        ["CBA_SettingChanged", _settingEH] call CBA_fnc_removeEventHandler;
    };
    _ctrl ctrlSetFade 1;
    _ctrl ctrlCommit 0;
    _speed ctrlSetText ((abs (speed cameraOn / GVAR(speedRatio))) toFixed 0);
}, 0, [_ctrl, _speed, _settingEH]] call CBA_fnc_addPerFrameHandler;
