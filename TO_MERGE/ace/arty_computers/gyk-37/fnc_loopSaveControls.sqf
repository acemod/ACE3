//fnc_loopSaveControls.sqf
#include "script_component.hpp"
#define STATESET(data,key,val)	[data,key,val] call CBA_fnc_hashSet
private ["_controls"];
_controls = _this select 0;
_data = GVAR(currentState);
if((count _this) > 1) then {
	_data = _this select 1;
};

for "_i" from 0 to (count _controls)-1 do {
	_control = _controls select _i;
	_type = getNumber(_control >> "type");
	_idc = getNumber(_control >> "idc");
	
	if(_idc != -1) then {
		switch(_type) do {
			case CT_EDIT: {
				_text = ctrlText _idc;
				STATESET(_data,_idc,_text);
			};
			case CT_STATIC: {
				_text = ctrlText _idc;
				STATESET(_data,_idc,_text);
			};
			case CT_COMBO: {
				STATESET(_data,_idc,[(lbCurSel _idc)]);
			};
			case CT_LISTBOX: {
				STATESET(_data,_idc,[(lbCurSel _idc)]);
			};
			case CT_TOOLBOX: {
				
			};
			case CT_CONTROLS_GROUP: {
				[(_control >> "controls"), _data] call FUNC(loopSaveControls);
			};
		};
	};
};