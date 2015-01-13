/**
 * fn_drawBFTMarkers_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


_marker = _this select 0;
_map = _this select 1;
if !(_marker isEqualTo []) then {
	_pos = _marker select 0;
	_args = _marker select 1;
	_icon = _args select 0;
	_text = _args select 1;
	_color = _args select 2;

	_timeOfPlacement = _marker select 2;
	_side  = _marker select 3;
	if (([([] call cse_fnc_getCurrentDeviceName_CC)] call cse_fnc_getDeviceSide_CC) == _side) then {
		_map drawIcon [_icon,_color, _pos, 30, 30, 0, _text, 0, 0.05, 'PuristaMedium', 'right'];
	};
};
