#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create the sub-children for each modifiable item
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_target", "_player", "_actionParams"];

_actionParams params ["_modifiableItem"];

private _cfg_origin = [_modifiableItem] call CBA_fnc_getItemConfig;

private _newItems = [_cfg_origin >> QPVAR(wardrobe) >> "modifiableTo"] call BIS_fnc_getCfgDataArray;

private _actions = [];

{
    private _targetItem = _x;
    private _cfg_target = [_targetItem] call CBA_fnc_getItemConfig;

    private _params = [_cfg_origin, _cfg_target];

    private _aceAction = [
        _targetItem                             //  * 0: Action name <STRING>
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