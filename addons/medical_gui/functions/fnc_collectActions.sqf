#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Collect treatment actions for medical menu from config.
 * Adds dragging actions if it exists.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_collectActions
 *
 * Public: No
 */

GVAR(actions) = [];

{
    private _configName = configName _x;
    private _displayName = getText (_x >> "displayName");
    private _category = getText (_x >> "category");
    private _condition = compile format [QUOTE([ARR_4(ACE_player, GVAR(target), %1 select GVAR(selectedBodyPart), '%2')] call DEFUNC(medical_treatment,canTreatCached)), ALL_BODY_PARTS, _configName];
    private _statement = compile format [QUOTE([ARR_4(ACE_player, GVAR(target), %1 select GVAR(selectedBodyPart), '%2')] call DEFUNC(medical_treatment,treatment)), ALL_BODY_PARTS, _configName];

    GVAR(actions) pushBack [_displayName, _category, _condition, _statement];
} forEach configProperties [configFile >> QEGVAR(medical_treatment,actions), "isClass _x"];


if ("ace_dragging" call EFUNC(common,isModLoaded)) then {
    GVAR(actions) pushBack [
        localize ELSTRING(dragging,Drag), "drag",
        {ACE_player != GVAR(target) && {[ACE_player, GVAR(target)] call EFUNC(dragging,canDrag)}},
        {
            GVAR(pendingReopen) = false;
            [ACE_player, GVAR(target)] call EFUNC(dragging,startDrag);
        }
    ];

    GVAR(actions) pushBack [
        localize ELSTRING(dragging,Carry), "drag",
        {ACE_player != GVAR(target) && {[ACE_player, GVAR(target)] call EFUNC(dragging,canCarry)}},
        {
            GVAR(pendingReopen) = false;
            [ACE_player, GVAR(target)] call EFUNC(dragging,startCarry);
        }
    ];
};
