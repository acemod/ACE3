#include "script_component.hpp"
/*
 * Author: AACO
 * Function used to get the vehicle icon for provided object (cached for repeat use)
 *
 * Arguments:
 * 0: Object to get icon of <OBJECT/STRING>
 *
 * Return Value:
 * Icon of vehicle <STRING>
 *
 * Examples:
 * ["B_Soldier_F"] call ace_common_fnc_getVehicleIcon;
 *
 * Public: Yes
 */
#define DEFAULT_TEXTURE "\A3\ui_f\data\Map\VehicleIcons\iconVehicle_ca.paa"

params [["_object", objNull, [objNull, ""]]];

if ((_object isEqualType objNull && {isNull _object}) || {_object isEqualType "" && {_object == ""}}) exitWith { DEFAULT_TEXTURE };

private _objectType = if (_object isEqualType objNull) then {
    typeOf _object
} else {
    _object
};
private _cachedValue = GVAR(vehicleIconCache) getVariable _objectType;

if (isNil "_cachedValue") then {
    private _vehicleValue = getText (configfile >> "CfgVehicles" >> _objectType >> "icon");
    private _vehicleIconValue = getText (configfile >> "CfgVehicleIcons" >> _vehicleValue);

    if (_vehicleIconValue == "") then {
        if (_vehicleValue != "" && {((toLower _vehicleValue) find ".paa") > -1}) then {
            _cachedValue = _vehicleValue;
        } else {
            _cachedValue = DEFAULT_TEXTURE;
        };
    } else {
        _cachedValue = _vehicleIconValue;
    };

    GVAR(vehicleIconCache) setVariable [_objectType, _cachedValue];
};

_cachedValue
