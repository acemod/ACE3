#include "..\script_component.hpp"
/*
 * Author: ACE-Team
 * Update the blue force tracking.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_blueForceTrackingUpdate
 *
 * Public: No
 */

// BEGIN_COUNTER(blueForceTrackingUpdate);

// Delete last set of markers (always)
{
    deleteMarkerLocal _x;
} forEach GVAR(BFT_markers);

GVAR(BFT_markers) = [];

if (GVAR(BFT_Enabled) and {(!isNil "ACE_player") and {alive ACE_player}}) then {
	private _groupsToDrawMarkers = [];
	private _playerSide = call EFUNC(common,playerSide);

	_groupsToDrawMarkers = allGroups select {side _x == _playerSide};

	if (GVAR(BFT_HideAiGroups)) then {
		_groupsToDrawMarkers = _groupsToDrawMarkers select {
			{
				_x call EFUNC(common,isPlayer);
			} count units _x > 0;
		};
	};

	if (GVAR(BFT_ShowPlayerNames)) then {
		private _playersToDrawMarkers = allPlayers select {side _x == _playerSide && {!(_x getVariable [QGVAR(hideBlueForceMarker), false])}};

		{
			private _markerType = [_x] call EFUNC(common,getMarkerType);
			private _colour = format ["Color%1", side _x];

			private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos _x) select 0, (getPos _x) select 1]];
			_marker setMarkerTypeLocal _markerType;
			_marker setMarkerColorLocal _colour;
			_marker setMarkerTextLocal (name _x);

			GVAR(BFT_markers) pushBack _marker;
		} forEach _playersToDrawMarkers;

		_groupsToDrawMarkers = _groupsToDrawMarkers select {
			{
				!(_x call EFUNC(common,isPlayer));
			} count units _x > 0;
		};
	};

	_groupsToDrawMarkers = _groupsToDrawMarkers select {!(_x getVariable [QGVAR(hideBlueForceMarker), false])};

	{
		private "_markerDetail";
		_markerDetail = switch (groupId _x) do {
			case "HQ": {["SR_Marker_HQ","SRColorGold",false]};
			case "PL": {["SR_Marker_PL1","SRColorGold",false]};
			case "PL-1": {["SR_Marker_PL1","SRColorGold",false]};
			case "PL-2": {["SR_Marker_PL2","SRColorGold",false]};
			case "A": {["SR_Marker_A1","SRColorGreen",false]};
			case "A-1": {["SR_Marker_A1","SRColorGreen",false]};
			case "A-2": {["SR_Marker_A2","SRColorGreen",false]};
			case "B": {["SR_Marker_B1","SRColorBrown",false]};
			case "B-1": {["SR_Marker_B1","SRColorBrown",false]};
			case "B-2": {["SR_Marker_B2","SRColorBrown",false]};				
			case "C": {["SR_Marker_C1","SRColorPurple",false]};
			case "C-1": {["SR_Marker_C1","SRColorPurple",false]};
			case "C-2": {["SR_Marker_C2","SRColorPurple",false]};
			case "D": {["SR_Marker_D1","SRColorBlack",false]};
			case "D-1": {["SR_Marker_D1","SRColorBlack",false]};
			case "D-2": {["SR_Marker_D2","SRColorBlack",false]};			
			case "S": {["SR_Marker_S1","SRColorBlue",false]};
			case "S-1": {["SR_Marker_S1","SRColorBlue",false]};
			case "S-2": {["SR_Marker_S2","SRColorBlue",false]};		
			case "R": {["SR_Marker_R1","SRColorBlue",false]};
			case "R-1": {["SR_Marker_R1","SRColorBlue",false]};
			case "R-2": {["SR_Marker_R2","SRColorBlue",false]};
			case "R-3": {["SR_Marker_R3","SRColorBlue",false]};	
			case "R-4": {["SR_Marker_R4","SRColorBlue",false]};	
			case "RPR": {["SR_Marker_R1","SRColorRed",false]};	
			case "RPR-1": {["SR_Marker_R1","SRColorRed",false]};	
			case "RPR-2": {["SR_Marker_R2","SRColorRed",false]};	
			case "RPR-3": {["SR_Marker_R3","SRColorRed",false]};	
			case "RPR-4": {["SR_Marker_R4","SRColorRed",false]};	
			case "F": {["SR_Marker_F1","SRColorBlue",false]};
			case "F-1": {["SR_Marker_F1","SRColorBlue",false]};
			case "F-2": {["SR_Marker_F2","SRColorBlue",false]};		
			case "F-3": {["SR_Marker_F3","SRColorBlue",false]};		
			case "F-4": {["SR_Marker_F4","SRColorBlue",false]};		
			case "M": {["SR_Marker_M1","SRColorBlue",false]};		
			case "M-1": {["SR_Marker_M1","SRColorBlue",false]};		
			case "M-2": {["SR_Marker_M2","SRColorBlue",false]};		
			case "M-3": {["SR_Marker_M3","SRColorBlue",false]};		
			case "M-4": {["SR_Marker_M4","SRColorBlue",false]};		
			case "E": {["SR_Marker_E1","SRColorBlue",false]};
			case "E-1": {["SR_Marker_E1","SRColorBlue",false]};
			case "E-2": {["SR_Marker_E2","SRColorBlue",false]};	
			case "L": {["SR_Marker_L1","SRColorBlue",false]};	
			case "L-1": {["SR_Marker_L1","SRColorBlue",false]};	
			case "L-2": {["SR_Marker_L2","SRColorBlue",false]};	
			case "H-1": {["SR_Marker_H1","SRColorBlue",false]};	
			case "H-2": {["SR_Marker_H2","SRColorBlue",false]};	
			case "H-3": {["SR_Marker_H3","SRColorBlue",false]};	
			case "H-4": {["SR_Marker_H4","SRColorBlue",false]};	
			case "W-1": {["SR_Marker_W1","SRColorBlue",false]};	
			case "W-2": {["SR_Marker_W2","SRColorBlue",false]};	
			case "W-3": {["SR_Marker_W3","SRColorBlue",false]};	
			case "W-4": {["SR_Marker_W4","SRColorBlue",false]};	
			default {[[_x] call EFUNC(common,getMarkerType),"SRColorBlue",true]}; 
		};

		// Check if element is platoon for sgt and pm markerse
		if ([_x] call FUNC(isPlatoon)) then {
			// loop through platoon to find sgt and pm
			{	
				if ([_x] call FUNC(isSergeant)) then {
				private _sgtm = createMarkerLocal [format ["ACE_BFT_SGT_%1", _forEachIndex],[(getPos _x) select 0, (getPos _x) select 1]];
				_sgtm setMarkerTypeLocal "SR_Marker_FTL";
				_sgtm setMarkerColorLocal "ColorWhite";
				_sgtm setMarkerTextLocal "SGT";
				GVAR(BFT_markers) pushBack _sgtm;
				};
				if ([_x] call FUNC(isPlatoonMedic)) then {
					private _pmm = createMarkerLocal [format ["ACE_BFT_PM_%1", _forEachIndex],[(getPos _x) select 0, (getPos _x) select 1]];
					_pmm setMarkerTypeLocal "SR_Marker_PM";
					_pmm setMarkerColorLocal "ColorWhite";
					_pmm setMarkerTextLocal "";
					GVAR(BFT_markers) pushBack _pmm;
				};
			}forEach units _x;
		};

	
		
		private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos leader _x) select 0, (getPos leader _x) select 1]];
		_marker setMarkerTypeLocal (_markerDetail select 0);
		_marker setMarkerColorLocal (_markerDetail select 1);
		if (_markerDetail select 2) then {
			_marker setMarkerTextLocal (groupId _x);
		};
		GVAR(BFT_markers) pushBack _marker;
	} forEach _groupsToDrawMarkers;
	
	// Check if more than 3 per Squad
	_units = units group ACE_player;
	if (count _units > 3) then {
		{
			// Check if FTL and select Marker Details
			_markerDetail = [];
			switch (_x getVariable ["ACE_FTL",""]) do {
				case "RED": {_markerDetail = ["SR_Marker_FTL","SRColorRed",false]};
				case "BLUE": {_markerDetail = ["SR_Marker_FTL","SRColorBlue",false]};
				case "GREEN": {_markerDetail = ["SR_Marker_FTL","SRColorGreen",false]};
				case "YELLOW": {_markerDetail = ["SR_Marker_FTL","SRColorGold",false]};
			};
			// Draw FTL Marker
			if (count _markerDetail > 0) then {
				private _marker = createMarkerLocal [format ["ACE_BFT_FTL_%1", _forEachIndex], [(getPos  _x) select 0, (getPos _x) select 1]];
				_marker setMarkerTypeLocal (_markerDetail select 0);
				_marker setMarkerColorLocal (_markerDetail select 1);
				GVAR(BFT_markers) pushBack _marker;
			};
		}forEach _units;	
	};
};
// END_COUNTER(blueForceTrackingUpdate);