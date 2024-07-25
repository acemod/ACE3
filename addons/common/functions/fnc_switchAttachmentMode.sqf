#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Switch attachment from one mode to another - based on CBA_accessory_fnc_switchAttachment
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: From <STRING>
 * 2: To <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_DBAL_A3_Green_VP", "ACE_DBAL_A3_Green"] call ace_common_fnc_switchAttachmentMode
 *
 * Public: No
 */
 
params ["_unit", "_currItem", "_switchItem"];
TRACE_3("switchAttachmentMode",_unit,_currItem,_switchItem);

switch (currentWeapon _unit) do {
    case (""): {};
    case (primaryWeapon _unit): {
        private _currWeaponType = 0;
        _unit removePrimaryWeaponItem _currItem;
        [{
            params ["_unit", "", "_switchItem"];
            _unit addPrimaryWeaponItem _switchItem;
            ["CBA_attachmentSwitched", _this] call CBA_fnc_localEvent;
        }, [_unit, _currItem, _switchItem, _currWeaponType]] call CBA_fnc_execNextFrame;
    };
    case (handgunWeapon _unit): {
        private _currWeaponType = 1;
        _unit removeHandgunItem _currItem;
        [{
            params ["_unit", "", "_switchItem"];
            _unit addHandgunItem _switchItem;
            ["CBA_attachmentSwitched", _this] call CBA_fnc_localEvent;
        }, [_unit, _currItem, _switchItem, _currWeaponType]] call CBA_fnc_execNextFrame;
    };
    case (secondaryWeapon _unit): {
        private _currWeaponType = 2;
        _unit removeSecondaryWeaponItem _currItem;
        [{
            params ["_unit", "", "_switchItem"];
            _unit addSecondaryWeaponItem _switchItem;
            ["CBA_attachmentSwitched", _this] call CBA_fnc_localEvent;
        }, [_unit, _currItem, _switchItem, _currWeaponType]] call CBA_fnc_execNextFrame;
    };
};
private _configSwitchItem = configfile >> "CfgWeapons" >> _switchItem;
private _switchItemHintText = getText (_configSwitchItem >> "MRT_SwitchItemHintText");
private _switchItemHintImage = getText (_configSwitchItem >> "picture");
if (_switchItemHintText isNotEqualTo "") then {
    [[_switchItemHintImage, 2.0], [_switchItemHintText], true] call CBA_fnc_notify;
};
playSound "click";
