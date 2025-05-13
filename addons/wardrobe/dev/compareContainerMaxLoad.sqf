#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * This debug script will compare the maxLoad of all modifiable Items with its modifiableTo Variants and will provide an RPT output.
 * WIP!
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example: execVM "\z\ace\addons\wardrobe\dev\compareContainerMaxLoad.sqf";
 * 
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
private _mismatches = [];

LOG_SYS("CompareMaxLoad","========================================================================================================");
LOG_SYS("CompareMaxLoad",QUOTE(Comparing PREFIX COMPONENT containers maximumLoad));
LOG_SYS("CompareMaxLoad","========================================================================================================");

{
    private _cfgOrigin = _x;
    private _originClassName = configName _cfgOrigin;
    private _originMaxLoad = getNumber (configFile >> "CfgVehicles" >> getText (_cfgOrigin >> "ItemInfo" >> "containerClass") >> "maximumLoad");
    
    if (_originClassName in _established) then { continue };
    _established pushBack _originClassName;

    private _targets = [_cfgOrigin] call FUNC(getItemsModifiableTo);

    {
        private _targetCfg = _x;
        private _targetClassName = configName _targetCfg;
        private _targetMaxLoad = getNumber (configFile >> "CfgVehicles" >> getText (_targetCfg >> "ItemInfo" >> "containerClass") >> "maximumLoad");

        if (_targetClassName in _established) then { continue };
        _established pushBack _targetClassName;

        private _mismatch = _targetMaxLoad isNotEqualTo _originMaxLoad;
        private _string = format ["%6 - [%5] [%2|%4] %1 vs %3", _originClassName,_originMaxLoad,_targetClassName,_targetMaxLoad,["Nominal", "Mismatch Detected!"] select _mismatch, _index];

        if (_mismatch) then { _mismatches pushBack [_originClassName,_originMaxLoad,_targetClassName,_targetMaxLoad]; };

        LOG_SYS("CompareMaxLoad",_string);
        ADD(_index,1);
    } forEach _targets;
} forEach _allWardrobeItems;

LOG_SYS("CompareMaxLoad","DONE");
LOG_SYS("CompareMaxLoad","========================================================================================================");
private _str = format ["%1 mismatches detected!", count _mismatches];
LOG_SYS("CompareMaxLoad",_str);

if (_mismatches isNotEqualTo []) then {
    LOG_SYS("CompareMaxLoad","========================================================================================================");
    { LOG_SYS("CompareMaxLoad",str _x); } forEach _mismatches;
};
LOG_SYS("CompareMaxLoad","========================================================================================================");
LOG_SYS("CompareMaxLoad","END");
LOG_SYS("CompareMaxLoad","========================================================================================================");
