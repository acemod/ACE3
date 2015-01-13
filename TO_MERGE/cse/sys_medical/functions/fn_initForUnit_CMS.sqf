/**
 * fn_initForUnit_CMS.sqf
 * @Descr: Deprecated. Is no longer used, as we dropped init eventhandler methods.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_handler"];
	_unit = _this select 0;
	if (!local _unit) exitwith {[format["UNIT IS NOT LOCAL: %1",_this]] call cse_fnc_debug;};
	if !(_unit isKindOf "CAManBase") exitwith{[format["UNIT IS NOT CAManBase: %1",_this]] call cse_fnc_debug;};
	if (isPlayer _unit) then {
		[_unit] spawn {
			disableSerialization;
			_CMSFadingBlackUI = uiNamespace getVariable "CMSFadingBlackUI";
			if (!isnil "_CMSFadingBlackUI") then {
				_ctrlFadingBlackUI = _CMSFadingBlackUI displayCtrl 11112;
				2 fadeSound 1;
				_ctrlFadingBlackUI ctrlSetTextColor [0.0,0.0,0.0,0.0];
			};
			waituntil {!isnil "cse_fnc_effectsLoop_CMS"};
			[_this select 0] call cse_fnc_effectsLoop_CMS;
		};
	};

{
	if(_x == "FirstAidKit" || {_x == "Medikit" || {_x isKindOf "FirstAidKit" || {_x isKindOf "Medikit"}}}) then {
		_unit removeItem _x;
	};
}foreach (items _unit);