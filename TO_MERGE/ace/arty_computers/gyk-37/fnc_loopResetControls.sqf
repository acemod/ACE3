//fnc_loopResetControls.sqf
#include "script_component.hpp"
private ["_controls"];
_controls = _this;
for "_i" from 0 to (count _controls)-1 do {
	_control = _controls select _i;
	_type = getNumber(_control >> "type");
	_idc = getNumber(_control >> "idc");
	
	if(_idc != -1) then {
		switch(_type) do {
			case CT_EDIT: {
				_defaultText = getText(_control >> "text");
				ctrlSetText [_idc, _defaultText];
			};
			case CT_STATIC: {
				_defaultText = getText(_control >> "text");
				ctrlSetText [_idc, _defaultText];
			};
			case CT_COMBO: {
				lbSetCurSel [_idc, 0];
			};
			case CT_LISTBOX: {
				lbSetCurSel [_idc, 0];
			};
			case CT_TOOLBOX: {
				
			};
			case CT_CONTROLS_GROUP: {
				(_control >> "controls") call FUNC(loopResetControls);
			};
		};
	};
};