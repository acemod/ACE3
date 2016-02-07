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

private ["_configBasic", "_configAdvanced", "_fnc_compileActionsLevel"];
_configBasic = (configFile >> "ACE_Medical_Actions" >> "Basic");
_configAdvanced = (configFile >> "ACE_Medical_Actions" >> "Advanced");

_fnc_compileActionsLevel = {
    private ["_actions", "_displayName", "_condition", "_category", "_statement"];
    params ["_config"];
    _actions = [];

    {
        if (isClass _x) then {
            _displayName = getText (_x >> "displayName");
            _category = getText (_x >> "category");
            _condition = format[QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), EGVAR(medical,SELECTIONS) select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical,canTreatCached)), configName _x];
            _statement = format[QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), EGVAR(medical,SELECTIONS) select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical,treatment)), configName _x];
            _actions pushBack [_displayName, _category, compile _condition, compile _statement];
        };
        nil
    } count ("true" configClasses _config);

    _actions // return
};

GVAR(actionsBasic) = [_configBasic] call _fnc_compileActionsLevel;
GVAR(actionsAdvanced) = [_configAdvanced] call _fnc_compileActionsLevel;

//Manually add the drag actions, if dragging exists.
if (["ace_dragging"] call EFUNC(common,isModLoaded)) then {
    _condition = {
        (ACE_player != GVAR(INTERACTION_TARGET)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,canDrag)}
    };
    _statement = {
        GVAR(pendingReopen) = false; //No medical_treatmentSuccess event after drag, so don't want this true
        [ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,startDrag);
    };
    GVAR(actionsBasic) pushBack [localize ELSTRING(dragging,Drag), "drag", _condition, _statement];
    GVAR(actionsAdvanced) pushBack [localize ELSTRING(dragging,Drag), "drag", _condition, _statement];

    _condition = {
        (ACE_player != GVAR(INTERACTION_TARGET)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,canCarry)}
    };
    _statement = {
        GVAR(pendingReopen) = false; //No medical_treatmentSuccess event after drag, so don't want this true
        [ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,startCarry);
    };
    GVAR(actionsBasic) pushBack [localize ELSTRING(dragging,Carry), "drag", _condition, _statement];
    GVAR(actionsAdvanced) pushBack [localize ELSTRING(dragging,Carry), "drag", _condition, _statement];
};
