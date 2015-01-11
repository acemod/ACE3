//fnc_loopRestoreControls.sqf
#include "script_component.hpp"
#define GETSTATE(idc,data)	[data,idc] call CBA_fnc_hashGet
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
				_text = GETSTATE(_idc,_data);
				ctrlSetText [_idc, _text];
			};
			case CT_STATIC: {
				_text = GETSTATE(_idc,_data);
				ctrlSetText [_idc, _text];
			};
			case CT_COMBO: {
				_index = GETSTATE(_idc,_data);
				if(IS_ARRAY(_index)) then {
					lbSetCurSel [_idc, (_index select 0)];
				};
			};
			case CT_LISTBOX: {
				_index = GETSTATE(_idc,_data);
				if(IS_ARRAY(_index)) then {
					lbSetCurSel [_idc, (_index select 0)];
				};
			};
			case CT_TOOLBOX: {
				
			};
			case CT_CONTROLS_GROUP: {
				[(_control >> "controls"),_data] call FUNC(loopRestoreControls);
			};
		};
	};
};