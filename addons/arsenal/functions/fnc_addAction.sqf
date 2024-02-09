#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: johnb43
 * Adds custom action buttons.
 *
 * Arguments:
 * 0: Tabs to add action to <ARRAY>
 * 1: Action class (unique string for each action) <STRING>
 * 2: Title <STRING>
 * 3: Actions <ARRAY of ARRAYS>
 * 4: Condition <CODE> (default: {true})
 * 5: Scope editor <NUMBER> (default: 2)
 * 6: Update when cargo content changes <BOOL> (default: false)
 *
 * Return Value:
 * 0: Array of IDs <ARRAY of STRINGS>
 *
 * Example:
 *  [[0, 5], "TAG_myActions", "My Actions", [
 *      ["text", "Text", {true}, "Text"],
 *      ["statement", "Statement", {true}, "", {[_this select 0] call tag_fnc_myTextStatement}],
 *      ["button", "Button", {true}, "", {}, {_this call tag_fnc_myAction}]
 *  ]] call ace_arsenal_fnc_addAction
 *
 * Public: Yes
 */

params [
    ["_tabs", [], [[]]],
    ["_rootClass", "", [""]],
    ["_title", "", [""]],
    ["_actions", [], [[]]],
    ["_rootCondition", {true}, [{}]],
    ["_scopeEditor", 2, [0]],
    ["_updateOnCargoChange", false, [false]]
];

// Compile actions from config (in case this is called before preInit)
call FUNC(compileActions);

// Skip if not allowed in editor and in editor
if (is3DEN && {_scopeEditor != 2}) exitWith {
    TRACE_1("Skipping action because in editor",_rootClass);
    []
};

// Class can't contain ~, because it's used for formatting result
if ("~" in _rootClass) exitWith {
    TRACE_1("Classname can't contain '~'",_rootClass);
    []
};

private _return = [];

private _fnc_addToGroup = {
    params ["_group", "_tab"];

    private _type = -1;

    {
        _x params [["_class", "", [""]], ["_label", "", [""]], ["_condition", {true}, [{}]], ["_text", "", [""]], ["_textStatement", {}, [{}]], ["_statement", {}, [{}]]];

        // Class can't contain ~, because it's used for formatting result
        if (_class == "" || {"~" in _class}) then {
            continue;
        };

        // Don't allow two of the same class
        if (_group findIf {(_x select 0) == _class} != -1) then {
            TRACE_1("An action with this ID already exists",_class);
            continue;
        };

        _type = switch (false) do {
            case (_text == ""): {
                _statement = format ["{""%1""}", _text];
                ACTION_TYPE_TEXT
            };
            case (_textStatement isEqualTo {}): {
                _statement = _textStatement;
                ACTION_TYPE_TEXT
            };
            case (_statement isEqualTo {}): {
                _statement = _statement;
                ACTION_TYPE_BUTTON
            };
            default {
                -1
            };
        };

        if (_type == -1) then {
            continue;
        };

        _statement = compile format [QUOTE([GVAR(center)] call %1), _statement];

        _group pushBack [_class, _type, _label, _statement, _condition];
        _return pushBack ([_rootClass, _class, _tab] joinString "~");
    } forEach _actions;
};

private _tab = [];
private _index = -1;
private _group = [];

{
    _tab = GVAR(actionList) select _x;
    _index = _tab findIf {(_x select 0) == _rootClass};

    // Add to existing group
    if (_index != -1) then {
        [_tab select _index select 3, _x] call _fnc_addToGroup;
    } else {
        // Add to new group
        _group = [];

        [_group, _x] call _fnc_addToGroup;

        _tab pushBack [_rootClass, _title, _rootCondition, _group];
    };
} forEach _tabs;

if (_updateOnCargoChange) then {
    GVAR(updateActionsOnCargoChange) = true;
};

_return
