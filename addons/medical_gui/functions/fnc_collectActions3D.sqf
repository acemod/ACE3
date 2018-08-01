#include "script_component.hpp"
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

private _actionsConfig = configFile >> QEGVAR(medical_treatment,actions);
private _actionPaths = ["ACE_Head", "ACE_Torso", "ACE_ArmLeft", "ACE_ArmRight", "ACE_LegLeft", "ACE_LegRight"];
private _actionPathTexts = [
    localize ELSTRING(interaction,Head), localize ELSTRING(interaction,Torso),
    localize ELSTRING(interaction,ArmLeft), localize ELSTRING(interaction,ArmRight),
    localize ELSTRING(interaction,LegLeft), localize ELSTRING(interaction,LegRight)
];
private _actionPathPositions = ["spine3", "pilot", "LeftForeArm", "RightForeArm", "LKnee", "RKnee"];

// - Create treatment actions -------------------------------------------------
{
    private _config = _x;
    private _actionName = QUOTE(ADDON) + "_" + configName _config;
    private _displayName = getText (_config >> "displayName");
    private _icon = switch (getText (_config >> "category")) do {
        case "bandage": {QPATHTOF(ui\ui\icons\bandage.paa)};
        case "medication": {QPATHTOF(ui\ui\icons\autoInjector.paa)};
        // Currently category advanced which includes body bag :/
        // case "iv": {QPATHTOF(ui\ui\icons\iv.paa)};
        default {""};
    };

    private _allowedBodyParts = getArray (_config >> "allowedSelections") apply {toLower _x};

    if (_allowedBodyParts isEqualTo ["all"]) then {
        _allowedBodyParts = ALL_BODY_PARTS apply {toLower _x};
    };

    {
        private _bodyPart = _x;
        private _actionPath = _actionPaths select (ALL_BODY_PARTS find toLower _bodyPart);

        private _statement = {
            //IGNORE_PRIVATE_WARNING ["_target", "_player"];
            [_player, _target, _this select 2 select 0, _this select 2 select 1] call EFUNC(medical_treatment,treatment)
        };
        private _condition = {
            //IGNORE_PRIVATE_WARNING ["_target", "_player"];
            [_player, _target, _this select 2 select 0, _this select 2 select 1] call EFUNC(medical_treatment,canTreatCached)
        };
        private _action = [
            _actionName, _displayName, _icon, _statement, _condition, {}, [_bodyPart, configName _config], [0, 0, 0], 2, [false, true, false, false, false]
        ] call EFUNC(interact_menu,createAction);

        ["CAManBase", 0, [_actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
        ["CAManBase", 0, ["ACE_MainActions", "ACE_Medical_Radial", _actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
        ["CAManBase", 1, ["ACE_SelfActions", "Medical", _actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
    } forEach _allowedBodyParts;
} forEach configProperties [_actionsConfig, "isClass _x"];
