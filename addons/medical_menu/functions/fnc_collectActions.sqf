/*
 * Author: Glowbal
 * Collect treatment actions from medical config
 *
 * Arguments:
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_configBasic", "_configAdvanced", "_compileActionsLevel"];
_configBasic = (configFile >> "ACE_Medical_Actions" >> "Basic");
_configAdvanced = (configFile >> "ACE_Medical_Actions" >> "Advanced");


_compileActionsLevel = {
    private [ "_config", "_entryCount", "_actions", "_action", "_displayName","_condition", "_category", "_statement"];
    _config = _this select 0;
    _entryCount = (count _config) - 1;
    _actions = [];

    for "_i" from 0 to _entryCount /* step +1 */ do {
        _action = _config select _i;
        if (isClass _action) then {
            _displayName = getText (_action >> "displayName");
            _category = getText (_action >> "category");
            _condition = format[QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), EGVAR(medical,SELECTIONS) select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical,canTreatCached)), configName _action];
            _statement = format[QUOTE([ARR_4(ACE_player, GVAR(INTERACTION_TARGET), EGVAR(medical,SELECTIONS) select GVAR(selectedBodyPart), '%1')] call DEFUNC(medical,treatment)), configName _action];
            _actions pushback [_displayName, _category, compile _condition, compile _statement];
        };
    };
    _actions;
};

GVAR(actionsBasic) = [_configBasic] call _compileActionsLevel;
GVAR(actionsAdvanced) = [_configAdvanced] call _compileActionsLevel;
