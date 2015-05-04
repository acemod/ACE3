#include "script_component.hpp"
private ["_markerArray","_unit","_markerData","_visibleTo","_doUpdate","_doCreate"];

{ // Begin ForEach; Create and update dynamic markers
	_unit = _x;
	_markerArray = _unit getVariable QGVAR(markerArray);
	_markerData = _unit getVariable QGVAR(markerData);
	_markerBFT = _unit getVariable QGVAR(markerBFT);
	// TRACE_5("",_unit,_markerData,_markerArray,_visibleTo,_markerBFT);
	_doUpdate = true;
	_doCreate = true;
	
	if (!isNil "_markerData") then { // Fix beta 106400 uninitialized variable testing
		_visibleTo = _markerData select 5;
		if (GVAR(playerSide) in _visibleTo) then {
			if (!isNil "_markerarray") then {
				if (_markerBFT) then {
					// Marker is only visible to BLUFOR tracker-equipped units
					if (GVAR(playerBFT) || GVAR(gPlayerBFT)) then {
						// Player has BLUFOR tracker; update the marker
						_doUpdate = true;
					} else {
						// Player does not not have BLUFOR tracker; delete the marker so he can't see it
						_doUpdate = false;
						LOG("Hiding marker");
						[_markerArray select 0] call FUNC(hideMarker);
					};
				} else {
					// Standard marker; update it
					_doUpdate = true;
				};
				if (_doUpdate) then {
					{
						_x setMarkerPosLocal (getpos _unit);
					} forEach _markerArray;
				};
			} else {
				if (!isNil "_markerData") then {
					if (_markerBFT) then {
						// Marker is only visible to BLUFOR tracker-equipped units
						if (GVAR(playerBFT) || GVAR(gPlayerBFT)) then {
							// Player has BLUFOR tracker; create the marker
							_doCreate = true;
						} else {
							_doCreate = false;
						};
					} else {
						// Standard marker; create it
						_doCreate = true;
					};
					if (_doCreate) then {
						_pos = getPos _unit;
						PUSH(_markerData,_pos);
						_markerArray = _markerData call FUNC(createMarker);
						TRACE_3("Creating marker for",_unit,_markerData,_markerArray);
						_unit setVariable [QGVAR(markerArray),_markerArray];
					};
				};
			};
		};
	};
} forEach allUnits + vehicles;