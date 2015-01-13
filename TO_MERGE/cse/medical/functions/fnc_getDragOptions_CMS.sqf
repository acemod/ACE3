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
	_unit = GVAR(INTERACTION_TARGET);
	if (!isNull _unit) then {
		if (_unit != player && (_unit isKindOf "CaManBase")) then {
			_nameOfUnit = [_unit] call EFUNC(common,getName);
			if (vehicle _unit == _unit) then {
				if (([player] call EFUNC(common,getCarriedObj)) != _unit && (isNull ([player] call EFUNC(common,getCarriedObj)))) then {

					_return pushback [localize "STR_ACE_ACTION_DRAG_PATIENT","[_this select 1,_this select 0] call FUNC(drag_CMS);",format[localize "STR_ACE_ACTION_DRAG_PATIENT_TOOLTIP",_nameOfUnit]];
					_return pushback [localize "STR_ACE_ACTION_CARRY_PATIENT","[_this select 1,_this select 0] call FUNC(carry_CMS);",format[localize "STR_ACE_ACTION_CARRY_PATIENT_TOOLTIP",_nameOfUnit]];
					if ([_unit, player] call FUNC(canPutInBodyBag_CMS)) then {
						_return pushback [localize "STR_ACE_ACTION_BODYBAG","[_this select 0,_this select 1] call FUNC(placeInBodyBag_CMS);",localize "STR_ACE_ACTION_BODYBAG_TOOLTIP"];
					};
				} else {
					if (([player] call EFUNC(common,getCarriedObj)) == _unit) then {
						_return pushback [localize "STR_ACE_ACTION_DROP_PATIENT","[_this select 1,_this select 0] call FUNC(drop_CMS);",format[localize "STR_ACE_ACTION_DROP_PATIENT_TOOLTIP",_nameOfUnit]];
					};
				};
				_return pushback [localize "STR_ACE_ACTION_LOAD_PATIENT","[_this select 1,_this select 0] call FUNC(load_CMS);",format[localize "STR_ACE_ACTION_LOAD_PATIENT_TOOLTIP",_nameOfUnit]];
			} else {
				_return pushback [localize "STR_ACE_ACTION_UNLOAD_PATIENT","[_this select 1,_this select 0] call FUNC(unload_CMS);",format[localize "STR_ACE_ACTION_UNLOAD_PATIENT_TOOLTIP",_nameOfUnit]];
			};
		};
		_return = [_unit, "getDragOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
	};
};

_return