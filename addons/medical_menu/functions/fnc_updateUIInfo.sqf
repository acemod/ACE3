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
#include "script_component.hpp"

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

private _selectionTourniquet = _target getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]];
private _selectionBloodLoss = [0, 0, 0, 0, 0, 0];
private _selectionDamage = [0, 0, 0, 0, 0, 0];
private _allInjuryTexts = [];

{
    _x params ["", "_woundClassID", "_bodyPartN", "_amountOf", "_bleeding", "_damage"];
    _selectionBloodLoss set [_bodyPartN, (_selectionBloodLoss select _bodyPartN) + (20 * (_bleeding * _amountOf))];
    _selectionDamage set [_bodyPartN, (_selectionDamage select _bodyPartN) + _damage];
    if (_selectionN == _bodyPartN) then {
        // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
        if (_amountOf > 0) then {
            private _className = (EGVAR(medical_damage,woundsData) select _woundClassID) select 6;
            private _postfix = ["Minor", "Medium", "Large"] select (floor ((0 max _bleeding min 0.1) / 0.05));
            private _woundDescription = localize format [ELSTRING(medical_damage,%1_%2), _className, _postfix];
            if (_amountOf >= 1) then {
                _allInjuryTexts pushBack [format["%2x %1", _woundDescription, ceil _amountOf], [1,1,1,1]];
            } else {
                _allInjuryTexts pushBack [format["Partial %1", _woundDescription], [1,1,1,1]];
            };
        };
    };
} forEach (_target getVariable [QEGVAR(medical,openWounds), []]);

{
    _x params ["", "_woundClassID", "_bodyPartN", "_amountOf", "_bleeding", "_damage"];
    _selectionDamage set [_bodyPartN, (_selectionDamage select _bodyPartN) + _damage];
    if (_selectionN == _bodyPartN) then {
        // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
        if (_amountOf > 0) then {
            private _className = (EGVAR(medical_damage,woundsData) select _woundClassID) select 6;
            private _postfix = ["Minor", "Medium", "Large"] select (floor ((0 max _bleeding min 0.1) / 0.05));
            private _woundDescription = localize format [ELSTRING(medical_damage,%1_%2), _className, _postfix];
            if (_amountOf >= 1) then {
                _allInjuryTexts pushBack [format ["[B] %2x %1", _woundDescription, ceil _amountOf], [0.88,0.7,0.65,1]];
            } else {
                _allInjuryTexts pushBack [format ["[B] Partial %1", _woundDescription], [0.88,0.7,0.65,1]];
            };
        };
    };
} forEach (_target getVariable [QEGVAR(medical,bandagedWounds), []]);

{
    _x params ["", "_woundClassID", "_bodyPartN", "_amountOf", "_bleeding", "_damage"];
    _selectionDamage set [_bodyPartN, (_selectionDamage select _bodyPartN) + _damage];
    if (_selectionN == _bodyPartN) then {
        // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
        if (_amountOf > 0) then {
            private _className = (EGVAR(medical_damage,woundsData) select _woundClassID) select 6;
            private _postfix = ["Minor", "Medium", "Large"] select (floor ((0 max _bleeding min 0.1) / 0.05));
            private _woundDescription = localize format [ELSTRING(medical_damage,%1_%2), _className, _postfix];
            if (_amountOf >= 1) then {
                _allInjuryTexts pushBack [format ["[S] %2x %1", _woundDescription, ceil _amountOf], [0.7,0.7,0.7,1]];
            } else {
                _allInjuryTexts pushBack [format ["[S] Partial %1", _woundDescription], [0.7,0.7,0.7,1]];
            };
        };
    };
} forEach (_target getVariable [QEGVAR(medical,stitchedWounds), []]);

[_selectionBloodLoss, _selectionDamage, _selectionTourniquet, _display] call FUNC(updateBodyImage);
[_display, _genericMessages, _allInjuryTexts] call FUNC(updateInformationLists);

[_display, _target getVariable [QEGVAR(medical,logFile_activity_view), []]] call FUNC(updateActivityLog);
[_display, _target getVariable [QEGVAR(medical,logFile_quick_view), []]] call FUNC(updateQuickViewLog);

private _triageStatus = [_target] call EFUNC(medical_treatment,getTriageStatus);
(_display displayCtrl 2000) ctrlSetText (_triageStatus select 0);
(_display displayCtrl 2000) ctrlSetBackgroundColor (_triageStatus select 2);
