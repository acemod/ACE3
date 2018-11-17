#include "script_component.hpp"
/*
 * Author: Glowbal
 * Update all UI information in the medical menu
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [some_player, some_display] call ace_medical_menu_fnc_updateUIInfo
 *
 * Public: No
 */

params ["_target", "_display"];

if (isNil "_display" || {isNull _display}) exitWith {ERROR("No display");};

private _selectionN = GVAR(selectedBodyPart);
if (_selectionN < 0 || {_selectionN > 5}) exitWith {};

private _genericMessages = [];
private _partText = [ELSTRING(medical,Head), ELSTRING(medical,Torso), ELSTRING(medical,LeftArm) ,ELSTRING(medical,RightArm) ,ELSTRING(medical,LeftLeg), ELSTRING(medical,RightLeg)] select _selectionN;
_genericMessages pushBack [localize _partText, [1, 1, 1, 1]];

if (_target getVariable [QEGVAR(medical,isBleeding), false]) then {
    _genericMessages pushBack [localize ELSTRING(medical,Status_Bleeding), [1, 0.1, 0.1, 1]];
};

if (_target getVariable [QEGVAR(medical,hasLostBlood), 0] > 1) then {
    _genericMessages pushBack [localize ELSTRING(medical,Status_Lost_Blood), [1, 0.1, 0.1, 1]];
};

if (((_target getVariable [QEGVAR(medical,tourniquets), [0, 0, 0, 0, 0, 0]]) select _selectionN) > 0) then {
    _genericMessages pushBack [localize ELSTRING(medical,Status_Tourniquet_Applied), [0.77, 0.51, 0.08, 1]];
};

if (_target getVariable [QEGVAR(medical,hasPain), false]) then {
    _genericMessages pushBack [localize ELSTRING(medical,Status_Pain), [1, 1, 1, 1]];
};

private _totalIvVolume = 0;
private _bloodBags = _target getVariable [QEGVAR(medical,ivBags), []];
{
    _x params ["_bagVolumeRemaining"];
    _totalIvVolume = _totalIvVolume + _bagVolumeRemaining;
} foreach _bloodBags;

if (_totalIvVolume >= 1) then {
    _genericMessages pushBack [format [localize ELSTRING(medical,receivingIvVolume), floor _totalIvVolume], [1, 1, 1, 1]];
};

private _damaged = [false, false, false, false, false, false];
private _selectionBloodLoss = [0, 0, 0, 0, 0, 0];

private _allInjuryTexts = [];
if ((EGVAR(medical,level) >= 2) && {([_target] call EFUNC(medical,hasMedicalEnabled))}) then {
    private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
    {
        private _amountOf = _x select 3;
        // Find how much this bodypart is bleeding
        if (_amountOf > 0) then {
            _damaged set [_x select 2, true];
            _selectionBloodLoss set [_x select 2, (_selectionBloodLoss select (_x select 2)) + (20 * ((_x select 4) * _amountOf))];

            if (_selectionN == (_x select 2)) then {
            // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
                if (_amountOf >= 1) then {
                    // TODO localization
                    _allInjuryTexts pushBack [format["%2x %1", (EGVAR(medical,AllWoundInjuryTypes) select (_x select 1)) select 6, ceil _amountOf], [1,1,1,1]];
                } else {
                    // TODO localization
                    _allInjuryTexts pushBack [format["Partial %1", (EGVAR(medical,AllWoundInjuryTypes) select (_x select 1)) select 6], [1,1,1,1]];
                };
            };
        };
    } forEach _openWounds;

    private _bandagedwounds = _target getVariable [QEGVAR(medical,bandagedWounds), []];
    {
        private _amountOf = _x select 3;
        // Find how much this bodypart is bleeding
        if !(_damaged select (_x select 2)) then {
            _selectionBloodLoss set [_x select 2, (_selectionBloodLoss select (_x select 2)) + (20 * ((_x select 4) * _amountOf))];
        };
        if (_selectionN == (_x select 2)) then {
            // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
            if (_amountOf > 0) then {
                if (_amountOf >= 1) then {
                    // TODO localization
                    _allInjuryTexts pushBack [format ["[B] %2x %1", (EGVAR(medical,AllWoundInjuryTypes) select (_x select 1)) select 6, ceil _amountOf], [0.88,0.7,0.65,1]];
                } else {
                    // TODO localization
                    _allInjuryTexts pushBack [format ["[B] Partial %1", (EGVAR(medical,AllWoundInjuryTypes) select (_x select 1)) select 6], [0.88,0.7,0.65,1]];
                };
            };
        };
    } forEach _bandagedwounds;
} else {

    // Add all bleeding from wounds on selection
    private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
    {
        private _amountOf = _x select 3;
        // Find how much this bodypart is bleeding
        if (_amountOf > 0) then {
            _damaged set [_x select 2, true];
            _selectionBloodLoss set [_x select 2, (_selectionBloodLoss select (_x select 2)) + (20 * ((_x select 4) * _amountOf))];
        };
    } forEach _openWounds;

    private _bandagedwounds = _target getVariable [QEGVAR(medical,bandagedWounds), []];
    {
        private _amountOf = _x select 3;
        // Find how much this bodypart is bleeding
        if !(_damaged select (_x select 2)) then {
            _selectionBloodLoss set [_x select 2, (_selectionBloodLoss select (_x select 2)) + (20 * ((_x select 4) * _amountOf))];
        };
    } forEach _bandagedwounds;

    private _bloodLossOnSelection = _selectionBloodLoss select _selectionN;
    if (_bloodLossOnSelection > 0) then {
        private _severity = switch (true) do {
            case (_bloodLossOnSelection > 0.5): {localize ELSTRING(medical,HeavilyWounded)};
            case (_bloodLossOnSelection > 0.1): {localize ELSTRING(medical,LightlyWounded)};
            default {localize ELSTRING(medical,VeryLightlyWounded)};
        };
        private _part = localize ([
            ELSTRING(medical,Head),
            ELSTRING(medical,Torso),
            ELSTRING(medical,LeftArm),
            ELSTRING(medical,RightArm),
            ELSTRING(medical,LeftLeg),
            ELSTRING(medical,RightLeg)
        ] select _selectionN);
        _allInjuryTexts pushBack [format ["%1 %2", _severity, toLower _part], [1,1,1,1]];
    };
};

[_selectionBloodLoss, _damaged, _display] call FUNC(updateBodyImage);
[_display, _genericMessages, _allInjuryTexts] call FUNC(updateInformationLists);
[_display, _target getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]]] call EFUNC(medical,updateTourniquets);

[_display, _target getVariable [QEGVAR(medical,logFile_activity_view), []]] call FUNC(updateActivityLog);
[_display, _target getVariable [QEGVAR(medical,logFile_quick_view), []]] call FUNC(updateQuickViewLog);

private _triageStatus = [_target] call EFUNC(medical,getTriageStatus);
(_display displayCtrl 2000) ctrlSetText (_triageStatus select 0);
(_display displayCtrl 2000) ctrlSetBackgroundColor (_triageStatus select 2);
