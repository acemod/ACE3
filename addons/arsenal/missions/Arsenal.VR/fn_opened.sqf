_player = missionnamespace getvariable ["BIS_fnc_arsenal_center",player];
{
	{
		if (_x iskindof "VR_CoverObject_base_F") then {
			[_x,-10] call bis_fnc_setheight; //--- Move cover objects below ground instead, they have unexplainable problem with hideObject
		} else {
			_x enablesimulation false;
			_x hideobject true;
		};
	} foreach ([_x] + crew _x - [_player]);
} foreach (allmissionobjects "All" - [_player]);

("RscVRMeta" call bis_fnc_rscLayer) cuttext ["","plain"];
player setvariable ["BIS_drawLines",false];
player setfatigue 0;