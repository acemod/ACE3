#include "../../script_component.hpp"

/*
* Author: Zorn
* This function will compare the maxLoad of all modifiable Items with its modifiableTo Variants and will provide an RPT output.
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

// TODO

private _allWardrobeItems = [true] call FUNC(getAllWardrobeItems) select {
    switch ( getNumber (_x >> "ItemInfo" >> "type") ) do {
        case TYPE_GOGGLE: { false; };
        case TYPE_HEADGEAR: { false; };
        case default { true };
    };
};

private _established = [];

{
    private _origin_cfg = _x;
    private _origin_className = configName _origin_cfg;
    

    if (_origin_className in _established) then { continue };
    _established pushBack _origin_className;

    private _targets = [_origin] call FUNC(getItems_modifiableTo);

    // formulate 
    


} forEach _allWardrobeItems;

