
_code = {
	if (isnil "CSE_INTEL_MARKER_COLLECTION_CC" || !(([player] call cse_fnc_hasTrackerItem_CC))) exitwith {};

	_playerPos = (getPos player);
	{

		_pos = _x select 0;
		_args = _x select 1;
		_icon = _args select 0;
		_text = _args select 1;
		_color = _args select 2;
		_side  = _x select 3;
		if (playerSide == _side && {_playerPos distance _pos < 200}) then {
			drawIcon3D [_icon,_color, _pos, 1, 1, 0, _text, 0, 0.03, 'PuristaMedium'];
		};

		false;
	}count CSE_INTEL_MARKER_COLLECTION_CC;

	{
		_pos = _x select 1;
		_unit = _x select 5;
		if (playerSide == (_x select 6) && {_playerPos distance _pos < 200} && {_unit != player}) then {
			drawIcon3D [(_x select 0), (_X select 3), _pos, 1, 1, 0, (_x select 2), 0, 0.03, 'PuristaMedium'];
		};
		false;
	}count CSE_TRACKER_ICONS;

};

["cse_futureSoldierDraw", [], _code] call cse_fnc_addTaskToPool_f;
