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

GVAR(actions) = [];

{
    if (isClass _x) then {
        private _displayName = getText (_x >> "displayName");
        private _category = getText (_x >> "category");
        private _condition = format [QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), %2 select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical_treatment,canTreatCached)), configName _x, ALL_BODY_PARTS];
        private _statement = format [QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), %2 select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical_treatment,treatment)), configName _x, ALL_BODY_PARTS];
        GVAR(actions) pushBack [_displayName, _category, compile _condition, compile _statement];
    };
    nil
} count ("true" configClasses (configFile >> QEGVAR(medical_treatment,actions)));

//Manually add the drag actions, if dragging exists.
if ("ace_dragging" call EFUNC(common,isModLoaded)) then {
    private _condition = {
        (ACE_player != GVAR(INTERACTION_TARGET)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,canDrag)}
    };
    private _statement = {
        GVAR(pendingReopen) = false; //No medical_treatmentSuccess event after drag, so don't want this true
        [ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,startDrag);
    };
    GVAR(actions) pushBack [localize ELSTRING(dragging,Drag), "drag", _condition, _statement];

    _condition = {
        (ACE_player != GVAR(INTERACTION_TARGET)) && {[ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,canCarry)}
    };
    _statement = {
        GVAR(pendingReopen) = false; //No medical_treatmentSuccess event after drag, so don't want this true
        [ACE_player, GVAR(INTERACTION_TARGET)] call EFUNC(dragging,startCarry);
    };
    GVAR(actions) pushBack [localize ELSTRING(dragging,Carry), "drag", _condition, _statement];
};
