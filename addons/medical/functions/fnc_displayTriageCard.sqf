#include "script_component.hpp"
/*
 * Author: Glowbal
 * Display triage card for a unit
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Show <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ace_medical_fnc_displayTriageCard
 *
 * Public: Yes
 */

params ["_target", ["_show", true]];

GVAR(TriageCardTarget) = if (_show) then {_target} else {ObjNull};

if (_show) then {
    //("ACE_MedicalTriageCard" call BIS_fnc_rscLayer) cutRsc [QGVAR(triageCard),"PLAIN"];
    createDialog QGVAR(triageCard);

    [{
        params ["_args", "_idPFH"];
        _args params ["_target"];
        if (GVAR(TriageCardTarget) != _target) exitWith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        disableSerialization;
        private _display = uiNamespace getVariable QGVAR(triageCard);
        if (isNil "_display") exitWith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        private _triageCardTexts = [];

        // TODO fill the lb with the appropiate information for the patient
        private _lbCtrl = (_display displayCtrl 200);
        lbClear _lbCtrl;

        private _log = _target getVariable [QGVAR(triageCard), []];
        {
            _x params ["_item", "_amount"];
            private _message = _item;
            if (isClass(configFile >> "CfgWeapons" >> _item)) then {
                _message = getText(configFile >> "CfgWeapons" >> _item >> "DisplayName");
            } else {
                if (isLocalized _message) then {
                    _message = localize _message;
                };
            };
            _triageCardTexts pushBack format["%1x - %2", _amount, _message];
        } forEach _log;

        if (count _triageCardTexts == 0) then {
            _lbCtrl lbAdd (localize LSTRING(TriageCard_NoEntry));
        };
        {
            _lbCtrl lbAdd _x;
        } forEach _triageCardTexts;

        private _triageStatus = [_target] call FUNC(getTriageStatus);
        _triageStatus params ["_text", "", "_color"];

        (_display displayCtrl 2000) ctrlSetText _text;
        (_display displayCtrl 2000) ctrlSetBackgroundColor _color;

    }, 0, [_target]] call CBA_fnc_addPerFrameHandler;

} else {
    //("ACE_MedicalTriageCard" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
    closeDialog 7010;
};
