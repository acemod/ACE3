/*
 * Author: BaerMitUmlaut
 * Creates actions for the given treatments and adds them to the interaction menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_menu_fnc_collectActions3D
 *
 * Public: No
 */
#include "script_component.hpp"

private _actionsConfig = [nil, configFile >> "ACE_Medical_Treatment_Actions" >> "Basic", configFile >> "ACE_Medical_Treatment_Actions" >> "Advanced"] select EGVAR(medical,level);
private _allAllowedSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
private _actionPaths = ["ACE_Head", "ACE_Torso", "ACE_ArmLeft", "ACE_ArmRight", "ACE_LegLeft", "ACE_LegRight"];
private _actionPathTexts = [
    localize ELSTRING(interaction,Head), localize ELSTRING(interaction,Torso),
    localize ELSTRING(interaction,ArmLeft), localize ELSTRING(interaction,ArmRight),
    localize ELSTRING(interaction,LegLeft), localize ELSTRING(interaction,LegRight)
];
private _actionPathPositions = ["spine3", "pilot", "LeftForeArm", "RightForeArm", "LKnee", "RKnee"];

// - Create base nodes --------------------------------------------------------
{
    private _action = [_x, _actionPathTexts select _forEachIndex, QPATHTOEF(medical,UI\icons\medical_cross.paa), {
        [_target, true, _this] call EFUNC(medical,displayPatientInformation);
    }, {true}, {}, _forEachIndex, _actionPathPositions select _forEachIndex, 2, [false, true, false, false, false], {
        [_target, _player, _this select 2, _this select 3] call EFUNC(medical_treatment,modifyMedicalAction);
    }] call EFUNC(interact_menu,createAction);
    ["CAManBase", 0, ["ACE_MainActions"], _action, true] call EFUNC(interact_menu,addActionToClass);
    ["CAManBase", 1, ["ACE_SelfActions"], _action, true] call EFUNC(interact_menu,addActionToClass);
} forEach _actionPaths;

// - Create treatment actions -------------------------------------------------
{
    private _config = _x;
    private _actionName = QUOTE(ADDON) + "_" + configName _config;
    private _displayName = getText (_config >> "displayName");
    private _icon = switch (getText (_config >> "category")) do {
        case "bandage": {QPATHTOEF(medical,UI\icons\bandage.paa)};
        case "medication": {QPATHTOEF(medical,UI\icons\autoInjector.paa)};
        // Currently category advanced which includes body bag :/
        // case "iv": {QPATHTOF(UI\icons\iv.paa)};
        default {""};
    };

    private _allowedSelections = getArray (_config >> "allowedSelections");
    _allowedSelections = _allowedSelections apply {toLower _x};

    if (_allowedSelections isEqualTo ["all"]) then {
        _allowedSelections = _allAllowedSelections;
    };

    {
        private _selection = _x;
        private _actionPath = _actionPaths select (_allAllowedSelections find _selection);

        private _statement = {[_player, _target, _selection, _this select 2] call EFUNC(medical_treatment,treatment)};
        private _condition = {[_player, _target, _selection, _this select 2] call EFUNC(medical_treatment,canTreatCached)};

        private _action = [
            _actionName, _displayName, _icon, _statement, _condition, {}, configName _config, [0, 0, 0], 2, [false, true, false, false, false]
        ] call EFUNC(interact_menu,createAction);
        diag_log formatText ["ACTIONS LOL: %1", [_actionName, _displayName, _icon, _statement, _condition]];
        ["CAManBase", 0, ["ACE_MainActions", _actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
        ["CAManBase", 1, ["ACE_SelfActions", _actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
    } forEach _allowedSelections;
} forEach configProperties [_actionsConfig, "isClass _x"];
