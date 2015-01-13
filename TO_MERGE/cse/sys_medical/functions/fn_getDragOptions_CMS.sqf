/**
 * fn_getDragOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return","_nameOfUnit","_unit"];
_return = [];

if (hasInterface) then {
	//_unit = [player] call cse_fnc_getInteractionTarget;
	_unit = CSE_SYS_MEDICAL_INTERACTION_TARGET;
	if (!isNull _unit) then {
		if (_unit != player && (_unit isKindOf "CaManBase")) then {
			_nameOfUnit = [_unit] call cse_fnc_getName;
			if (vehicle _unit == _unit) then {
				if (([player] call cse_fnc_getCarriedObj) != _unit && (isNull ([player] call cse_fnc_getCarriedObj))) then {

					_return pushback [localize "STR_CSE_ACTION_DRAG_PATIENT","[_this select 1,_this select 0] call CSE_fnc_drag_CMS;",format[localize "STR_CSE_ACTION_DRAG_PATIENT_TOOLTIP",_nameOfUnit]];
					_return pushback [localize "STR_CSE_ACTION_CARRY_PATIENT","[_this select 1,_this select 0] call cse_fnc_carry_CMS;",format[localize "STR_CSE_ACTION_CARRY_PATIENT_TOOLTIP",_nameOfUnit]];
					if ([_unit, player] call cse_fnc_canPutInBodyBag_CMS) then {
						_return pushback [localize "STR_CSE_ACTION_BODYBAG","[_this select 0,_this select 1] call cse_fnc_placeInBodyBag_CMS;",localize "STR_CSE_ACTION_BODYBAG_TOOLTIP"];
					};
				} else {
					if (([player] call cse_fnc_getCarriedObj) == _unit) then {
						_return pushback [localize "STR_CSE_ACTION_DROP_PATIENT","[_this select 1,_this select 0] call cse_fnc_drop_CMS;",format[localize "STR_CSE_ACTION_DROP_PATIENT_TOOLTIP",_nameOfUnit]];
					};
				};
				_return pushback [localize "STR_CSE_ACTION_LOAD_PATIENT","[_this select 1,_this select 0] call cse_fnc_load_CMS;",format[localize "STR_CSE_ACTION_LOAD_PATIENT_TOOLTIP",_nameOfUnit]];
			} else {
				_return pushback [localize "STR_CSE_ACTION_UNLOAD_PATIENT","[_this select 1,_this select 0] call cse_fnc_unload_CMS;",format[localize "STR_CSE_ACTION_UNLOAD_PATIENT_TOOLTIP",_nameOfUnit]];
			};
		};
		_return = [_unit, "getDragOptions_CMS", _return] call cse_fnc_getOptionsForCategory_CMS;
	};
};

_return