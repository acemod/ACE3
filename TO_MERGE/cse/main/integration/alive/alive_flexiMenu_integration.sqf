
#include "\x\alive\addons\ui\script_component.hpp"
#define ALiVE_ICON  "cse\cse_gui\radialmenu\data\icons\icon_alive_mod.paa"

/*
    [
            "player",
            [SELF_INTERACTION_KEY],
            -9500,
            [
                    "call ALIVE_fnc_adminActionsMenuDef",
                    "main"
            ]
    ]
*/


    [
        ["player",[[221,[false,false,false]]],-9500,["call ALIVE_fnc_newsFeedMenuDef","main"],true],
        ["player",[[221,[false,false,false]]],-9500,["call ALIVE_fnc_adminActionsMenuDef","main"],true]
    ];

/*
 4         [
 5             "caption",
 6             "action",
 7             "icon",
 8             "tooltip",
 9             {"submenu"|["menuName", "", {0|1} (optional - use embedded list menu)]},
10             -1 (shortcut DIK code),
11             {0|1/"0"|"1"/false|true} (enabled),
12             {-1|0|1/"-1"|"0"|"1"/false|true} (visible)
13         ]
*/

[format["ALIVE FlexiMenu integration started"]] call cse_fnc_debug;
_menusources = GVAR(typeMenuSources);
{

    // This is a string. defines classnames ?
    _type = _x select 0;

    // not relevant for us
    _keybindings = _x select 1;

    // not relevant for us
    _priority = _x select 2;

    // array format: [code STRING, name STRING]
    _details = _x select 3;
    _code = _details select 0;
    _menuName = _details select 1;

    // condition. BOOL or CODE ?
    _condition = _x select 4;

	// TODO figure out parsing
	[format["ALiVE FlexiMenu entry: %1", _x]] call cse_fnc_debug;

    if (_type == "player") then {

        if (typeName _condition == typeName true) then {

        } else {
            // calling condition
        };

        _target = player;
        _params = [_menuName, "popup"];

        if (typeName _code == typeName "") then {

            // this has to be called upon menu open.
            _res = [_target, _params] call compile _code;
            [format["ALIVE FlexiMenu call res: %1", _res]] call cse_fnc_debug;
             // [["main","ALiVE","popup"],[["Player Combat Support",{["radio"] call ALIVE_fnc_radioAction},"","ALiVE Combat Support System (CAS/Artillery/Transport)","",-1,1,false]]
            if (_res isEqualTo []) exitwith {};
            _entryDetails = _res select 1 select 0;


            // [["main","ALiVE","popup"],[["Admin Actions >","","","Server admin functions",["call ALiVE_fnc_adminActionsMenuDef","adminActions",1],-1,1,true]]]
            //_menuName = _entryDetails select 4 select 1;
            _compiledCode = compile format['[_this, "%1"] call cse_fnc_aliveFlexiMenuDisplayOptions', _menuName];
            [format["compiled code: %1", _compiledCode]] call cse_fnc_debug;
            _entries = [
                [_entryDetails select 0, {true /* Condition should check for activation of ALiVE menu entries */}, ALiVE_ICON, _compiledCode, _entryDetails select 3]
            ];
            ["ActionMenu","alive_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

            /*{
                if (_foreachIndex > 0) then {
                    [format["BUTTON FORMAT: %1",_x]] call cse_fnc_debug;
                    _info = _x select 0;
                    _title = _info select 0;
                    _code = _info select 1;
                    _toolTip = _info select 2;
                    _allow = _info select 7;
                    [format["Showing button: %1", _info]] call cse_fnc_debug
                };
            }foreach _res;*/
        };

    };
}foreach _menusources;



cse_fnc_aliveFlexiMenuDisplayOptions = {
    _args = _this select 0;
    _checkMenuName = _this select 1;
    [format["cse_fnc_aliveFlexiMenuDisplayOptions %1",_this]] call cse_fnc_debug;
    _menusources = GVAR(typeMenuSources);
    {
        // This is a string. defines classnames ?
        _type = _x select 0;

        // not relevant for us
        _keybindings = _x select 1;

        // not relevant for us
        _priority = _x select 2;

        // array format: [code STRING, name STRING]
        _details = _x select 3;
        _code = _details select 0;
        _menuName = _details select 1;

         // condition. BOOL or CODE ?
        _condition = _x select 4;

        if (_menuName == _checkMenuName) exitwith {
            [format["ALiVE FlexiMenu entry: %1", _x]] call cse_fnc_debug;
            if (_type == "player") then {
                _continue = false;
                if (typeName _condition == typeName true) then {
                    _continue = _condition;
                };
                if (!_continue) exitwith {};

                _target = player;
                _params = [_menuName, "popup"];

                if (typeName _code == typeName "") then {
                    // this has to be called upon menu open.
                    _res = [_target, _params] call compile _code;
                    // [["main","ALiVE","popup"],[["Player Combat Support",{["radio"] call ALIVE_fnc_radioAction},"","ALiVE Combat Support System (CAS/Artillery/Transport)","",-1,1,false]]

                    if (_res isEqualTo []) exitwith {};
                    _entryDetails = _res select 1;

                    _cse_menu_entries = [];
                    {
                        _info = _x select 0;
                        if (_foreachIndex > 0) then {
                            _title = _info select 0;
                            _code = _info select 1;
                            _toolTip = _info select 2;
                            _allow = _info select 7;

                            if (_allow) then {
                                _cse_menu_entries pushback [_title, ALiVE_ICON, _code,  true, _toolTip];
                            };
                        };
                    }foreach _res;
                    [format["Showing entries: %1 - %2", _cse_menu_entries, _res]] call cse_fnc_debug;

                    if !(_cse_menu_entries isEqualTo []) then {
                        hintSilent "displaying alive entries";
                        [ _args select 3,
                            _cse_menu_entries,
                            _args select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true
                        ] call cse_fnc_openRadialSecondRing_GUI;
                    };

                };

            };

        };
    }foreach _menusources;

};