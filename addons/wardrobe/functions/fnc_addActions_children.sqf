#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to create the ace action children, one for each possible variant of the current item.
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: player <OBJECT>
 * 2: Multiple input types <STRING|ARRAY|CODE>
 * - 0: Current Variant <Config>
 * - 1: Array of Configs Possible Variants <ARRAY>
 *
 * Return Value:
 * Array of ACE Child Actions <ARRAY>
 *
 * Example:
 * _this call ace_wardrobe_fnc_addActions_children
 *
 * Public: No
 */

params ["_target", "_player", "_actionParams"];
_actionParams params ["_cfg_origin", "_newItems"];


private _actions = [];

{
    private _cfg_target = _x;
    private _className_target = configName _cfg_target;

    private _params = [_cfg_origin, _cfg_target];

    private _aceAction = [
        _className_target                           //  * 0: Action name <STRING>
        ,[_cfg_target] call FUNC(getAction_Name)    //  * 1: Name of the action shown in the menu <STRING>
        ,[_cfg_target] call FUNC(getAction_Icon)    //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
        ,FUNC(replace)                          //  * 3: Statement <CODE>
        ,{true}                                 //  * 4: Condition <CODE>
        ,{}                                     //  * 5: Insert children code <CODE> (Optional)
        ,_params                                //  * 6: Action parameters <ANY> (Optional)
    //    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
    //    ,20                                   //  * 8: Distance <NUMBER> (Optional)
    //    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
    //    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_aceAction, [], _target];

} forEach _newItems;

_actions
