#include "script_component.hpp"

params ["_ctrl"];

private _alt = (ctrlParent _ctrl) ctrlCreate [QGVAR(alt), -1];

private _units = (vehicle ace_player) call FUNC(altUnits);
private _altInfo = [_units select 0] call FUNC(altInfo);

((ctrlParent _alt) displayCtrl 1005) ctrlSetText (_altInfo select 0);
GVAR(altRatio) = _altInfo select 1;

private _settingEH = ["CBA_SettingChanged", {
    params ["_setting", "_value"];
    _thisArgs params ["_settingName", "_alt"];
    if (_setting isEqualTo _settingName) then {
        private _altInfo = [_value] call FUNC(altInfo);
        ((ctrlParent _alt) displayCtrl 1005) ctrlSetText (_altInfo select 0);
        GVAR(altRatio) = _altInfo select 1;
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
    private _altValue = (((getPosATL vehicle ace_player) select 2) / GVAR(altRatio));
    if (_altValue < 10) then {
        _altValue = _altValue toFixed 1;
    } else {
        _altValue = _altValue toFixed 0;
    };
    _alt ctrlSetText _altValue;
}, 0, [_ctrl, _alt, _settingEH]] call CBA_fnc_addPerFrameHandler;
