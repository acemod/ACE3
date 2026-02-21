#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to check ace_wardrobe configs for legacy properties
 *
 * Arguments:
 * - 
 *
 * Return Value:
 * 
 *
 * Example:
 * "" call ace_wardrobe_fnc_checkForLegacy
 *
 * Public: No
 */

private _allConfigs = "true" configClasses (configFile >> "ace_wardrobe");

private _checkOne = {
    if ( isNumber (_this >> "sound_timing") ) then { WARNING_1("depricated property 'sound_timing'. use 'soundTiming' instead: '%1'",configName _this); };
};

private _checkTwo = {
    if ( isText (_this >> "alternativeActionName") ) then { WARNING_1("depricated property 'alternativeActionName'. use 'displayName' instead: '%1'",configName _this); };
};

private _checkThree = {
    if ( isText (_this >> "alternativePicture") ) then { WARNING_1("depricated property 'alternativePicture'. use 'displayName' instead: '%1'",configName _this); };
};

private _checkFour = {

    private _depricatedSubClasses = "isText (_x >> 'directionalActionName')" configClasses (_this >> "modifiableTo");

    if (_depricatedSubClasses isNotEqualTo []) then {

        { WARNING_2("depricated property 'directionalActionName'. use 'displayName' instead: '%1' >> 'modifiableTo' >> '%2'",configName _this,configName _x); } forEach _depricatedSubClasses;
        
    };

};

{
    private _check = _x;
    { _x call _check } forEach _allConfigs;
} forEach [_checkOne, _checkTwo, _checkThree, _checkFour];
