/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"
private ["_disp", "_ctrl", "_currentcargo", "_item", "_typei", "_name", "_pic", "_dummy", "_weight", "_text", "_index","_ui"];

PARAMS_1(_location);

// Prevent viewing of dialog if vehicle is already accessed by other player // TODO: Better not show in interaction menu
if (GVAR(target) getVariable [QGVAR(busy),false]) exitWith {
	[] spawn {
		sleep 0.1;
		if (dialog) then { closeDialog 0 };
		[localize "STR_ACE_CARGO_ERR_OCC",[1,0,0,1],true,0] spawn ace_fnc_visual;
	};
};

_ui = if (_location == "back") then {"ACE_Cargo_List"} else {"ACE_CargoFront_List"};
_disp = uiNamespace getVariable _ui;
_ctrl = _disp displayCtrl 99;
_tit = _disp displayCtrl 30;

// Set vehicle busy to prevent multi unloading
[GVAR(target),objnull,1,1] call FUNC(cbusy);

_currentcargo = if (_location == "back") then { GVAR(target) getVariable [QGVAR(content), []] } else { GVAR(target) getVariable [QGVAR(content_front), []] };
lbClear _ctrl;

if (count _currentcargo > 0) then {
	_dn = getText(configFile >> "CfgVehicles" >> typeOf GVAR(target) >> "displayName");
	_tit ctrlSetText format[localize "STR_DIAG_ACE_CARGO_TITLE",_dn];
	for "_x" from 0 to (count _currentcargo) - 1 do {
		_item = _currentcargo select _x;
		_typei = typeOf _item;
		_name = _item getVariable "ace_sys_cargo_name";
		if (isNil "_name") then {
			_name = getText(configFile >> "CfgVehicles" >> _typei >> "displayName");
		};
		_pic = getText (configFile >> "cfgVehicles" >> _typei >> "icon");
		if (_pic == "" || {_pic == "iconThing"}) then {
			_pic = "\ca\data\data\Unknown_object.paa";
		};
		_weight = [_item,1] call FUNC(weight);
		// Disable low weight stuff
		_text = if (_weight <= 5) then {
			_name
		} else {
			format["%1 %2 kg", _name, round _weight]
		};
		_index = _ctrl lbAdd _text;
		_ctrl lbSetPicture [_index, _pic];
	};
	_ctrl lbSetCurSel 0;
};

if (player in crew GVAR(vehicle) || {count _currentcargo == 0} || {player getVariable [QGVAR(carrying),false]}) then { (_disp displayCtrl 10) ctrlEnable false; _disp displayCtrl 10 ctrlCommit 0; }; // Cannot unload from inside

[] spawn {
	while {dialog} do {
		sleep 0.1;
	};
	[GVAR(target),objnull,0,0] call FUNC(cbusy);
};


