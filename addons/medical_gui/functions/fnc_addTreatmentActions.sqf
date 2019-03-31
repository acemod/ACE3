#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, mharis001
 * Creates actions for treatments from config and adds them to the interaction menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_addTreatmentActions
 *
 * Public: No
 */

private _actionsConfig = configFile >> QEGVAR(medical_treatment,actions);
private _actionPaths = ["ACE_Head", "ACE_Torso", "ACE_ArmLeft", "ACE_ArmRight", "ACE_LegLeft", "ACE_LegRight"];

private _fnc_statement = {
    params ["_target", "_player", "_args"];
    _args params ["_bodyPart", "_treatmentName"];
    [_player, _target, _bodyPart, _treatmentName] call EFUNC(medical_treatment,treatment);
};

private _fnc_condition = {
    params ["_target", "_player", "_args"];
    _args params ["_bodyPart", "_treatmentName"];
    [_player, _target, _bodyPart, _treatmentName] call EFUNC(medical_treatment,canTreatCached);
};

{
    private _configName = configName _x;
    private _actionName = format [QGVAR(_%1), _configName];
    private _displayName = getText (_x >> "displayName");
    private _icon = getText (_x >> "icon");

    private _allowedBodyParts = getArray (_x >> "allowedSelections") apply {toLower _x};
    if (_allowedBodyParts isEqualTo ["all"]) then {
        _allowedBodyParts = ALL_BODY_PARTS apply {toLower _x};
    };

    {
        private _bodyPart = _x;
        private _actionPath = _actionPaths select (ALL_BODY_PARTS find toLower _bodyPart);

        private _action = [
            _actionName,
            _displayName,
            _icon,
            _fnc_statement,
            _fnc_condition,
            {},
            [_bodyPart, _configName],
            {[0, 0, 0]},
            2,
            [false, true, false, false, false]
        ] call EFUNC(interact_menu,createAction);

        ["CAManBase", 0, [_actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
        ["CAManBase", 0, ["ACE_MainActions", "ACE_Medical_Radial", _actionPath], _action, true] call EFUNC(interact_menu,addActionToClass);
        GVAR(selfInteractionActions) pushBack ["", 1, ["ACE_SelfActions", "ACE_Medical", _actionPath], _action];
    } forEach _allowedBodyParts;
} forEach configProperties [_actionsConfig, "isClass _x"];
