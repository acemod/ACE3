#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * This debug function will compare the maxLoad of all modifiable Items with its modifiableTo Variants and will provide an RPT output.
 * WIP!
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_wardrobe_fnc_compare_container_maxLoad
 *
 * Public: no
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
private _index = 0;
private _missmatches = [];

LOG_SYS("CompareMaxLoad","========================================================================================================");
LOG_SYS("CompareMaxLoad",QUOTE(Comparing PREFIX COMPONENT containers maximumLoad));
LOG_SYS("CompareMaxLoad","========================================================================================================");

{
    private _origin_cfg = _x;
    private _origin_className = configName _origin_cfg;
    private _origin_maxLoad = getNumber (configFile >> "CfgVehicles" >> getText (_origin_cfg >> "ItemInfo" >> "containerClass") >> "maximumLoad");
    
    if (_origin_className in _established) then { continue };
    _established pushBack _origin_className;

    private _targets = [_origin_cfg] call FUNC(getItems_modifiableTo);

    {
        private _target_cfg = _x;
        private _target_className = configName _target_cfg;
        private _target_maxLoad = getNumber (configFile >> "CfgVehicles" >> getText (_target_cfg >> "ItemInfo" >> "containerClass") >> "maximumLoad");

        if (_target_className in _established) then { continue };
        _established pushBack _target_className;

        private _missmatch = _target_maxLoad isNotEqualTo _origin_maxLoad;
        private _string = format ["%6 - [%5] [%2|%4] %1 vs %3", _origin_className,_origin_maxLoad,_target_className,_target_maxLoad,["Nominal", "Missmatch Detected!"] select _missmatch, _index];

        if (_missmatch) then { _missmatches pushBack [_origin_className,_origin_maxLoad,_target_className,_target_maxLoad]; };

        LOG_SYS("CompareMaxLoad",_string);
        ADD(_index,1);
    } forEach _targets;
} forEach _allWardrobeItems;

LOG_SYS("CompareMaxLoad","DONE");
LOG_SYS("CompareMaxLoad","========================================================================================================");
_str = format ["%1 missmatches detected!", count _missmatches];
LOG_SYS("CompareMaxLoad",_str);

if (count _missmatches > 0) then {
    LOG_SYS("CompareMaxLoad","========================================================================================================");
    { LOG_SYS("CompareMaxLoad",str _x); } forEach _missmatches;
};
LOG_SYS("CompareMaxLoad","========================================================================================================");
LOG_SYS("CompareMaxLoad","END");
LOG_SYS("CompareMaxLoad","========================================================================================================");