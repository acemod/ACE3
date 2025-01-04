#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * This function creates children for the main wardrobe action - one for every modifiable Item.
 * Each Modifiable Item will have its own children in regard of the items it can be changed towards.
 *
 * Arguments:
 * 0: The Unit who's wearable shall be changed - usually the player themselves <OBJECT>
 *
 * Return Value:
 * Array of ACE Child Actions <ARRAY>
 *
 * Example:
 * [_player] call ace_wardrobe_fnc_addActions
 *
 * Public: No
 */

params ["_unit"];


private _modifiableItems = [_unit] call FUNC(getItems_modifiable_current);
private _actions = [];
{
    private _cfg = _x#0;
    private _className = configName _cfg;
    private _params = [_cfg, _x#1];

    private _aceAction = [
        _className                              // * 0: Action name <STRING>
        ,getText (_cfg >> "displayName")        //  * 1: Name of the action shown in the menu <STRING>
        ,getText (_cfg >> "picture")            //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
        ,{}                                     //  * 3: Statement <CODE>
        ,{true}                                 //  * 4: Condition <CODE>
        ,FUNC(addActions_children)              //  * 5: Insert children code <CODE> (Optional)
        ,_params                                //  * 6: Action parameters <ANY> (Optional)
    //    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
    //    ,20                                   //  * 8: Distance <NUMBER> (Optional)
    //    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
    //    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_aceAction, [], _target];

} forEach _modifiableItems;

_actions
