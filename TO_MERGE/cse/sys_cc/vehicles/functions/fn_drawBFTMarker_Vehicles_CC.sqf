/**
 * fn_drawBFTMarker_Vehicles_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private [ "_marker", "_map"];
_marker = _this select 0;
if !(_marker isEqualTo []) then {
	_pos = _marker select 0;
	_args = _marker select 1;
	_icon = _args select 0;
	_text = _args select 1;
	_color = _args select 2;

	_timeOfPlacement = _marker select 2;
	_side  = _marker select 3;
	if ((side CSE_CURRENT_VEHICLE_BFT_DISPLAY_CC) == _side) then {
		(_this select 1) drawIcon [_icon,_color, _pos, 30, 30, 0, _text, 0, 0.05, 'PuristaMedium', 'right'];
	};
};
