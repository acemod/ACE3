/*
 * Author: Glowbal
 * Collect treatment actions from medical config
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_menu_fnc_collectActions
 *
 * Public: No
 */
#include "script_component.hpp"

private _configBasic = (configFile >> QEGVAR(medical_treatment,actions) >> "Basic");
private _configAdvanced = (configFile >> QEGVAR(medical_treatment,actions) >> "Advanced");

private _fnc_compileActionsLevel = {
    params ["_config"];
    private _actions = [];

    {
        if (isClass _x) then {
            private _displayName = getText (_x >> "displayName");
            private _category = getText (_x >> "category");
            private _condition = format [QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), %2 select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical_treatment,canTreatCached)), configName _x, ALL_BODY_PARTS];
            private _statement = format [QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), %2 select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical_treatment,treatment)), configName _x, ALL_BODY_PARTS];
            _actions pushBack [_displayName, _category, compile _condition, compile _statement];
            diag_log format["ACTION: %1", [_displayName, _category, compile _condition, compile _statement]];
        };
        nil
    } count ("true" configClasses _config);

    _actions;
};

GVAR(actionsBasic) = [_configBasic] call _fnc_compileActionsLevel;
GVAR(actionsAdvanced) = [_configAdvanced] call _fnc_compileActionsLevel;

//Manually add the drag actions, if dragging exists.
if (["ace_dragging"] call EFUNC(common,isModLoaded)) then {
    private _condition = {
        (ACE_player != GVAR(INTERACTION_TARGET)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,canDrag)}
    };
    private _statement = {
        GVAR(pendingReopen) = false; //No medical_treatmentSuccess event after drag, so don't want this true
        [ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,startDrag);
    };
    GVAR(actionsBasic) pushBack [localize ELSTRING(dragging,Drag), "drag", _condition, _statement];
    GVAR(actionsAdvanced) pushBack [localize ELSTRING(dragging,Drag), "drag", _condition, _statement];

    private _condition = {
        (ACE_player != GVAR(INTERACTION_TARGET)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,canCarry)}
    };
    private _statement = {
        GVAR(pendingReopen) = false; //No medical_treatmentSuccess event after drag, so don't want this true
        [ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,startCarry);
    };
    GVAR(actionsBasic) pushBack [localize ELSTRING(dragging,Carry), "drag", _condition, _statement];
    GVAR(actionsAdvanced) pushBack [localize ELSTRING(dragging,Carry), "drag", _condition, _statement];
};
