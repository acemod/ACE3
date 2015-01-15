// by CAA-Picard

#include "script_component.hpp"

if (!hasInterface) exitWith{};

[] spawn {
  while {true} do {
    sleep 5;
    _markers = [];

    while {GVAR(BFT_Enabled) and {(!isNil "ACE_player") and {alive ACE_player}}} do {

      _groups = [];
      _playerSide = call EFUNC(common,playerSide);

      if (GVAR(BFT_HideAiGroups)) then {
        _groups = [allGroups, {side _this == _playerSide}] call EFUNC(common,filter);
      } else {
        _groups = [allGroups, {
          _anyPlayers = {
            [_x] call EFUNC(common,isPlayer);
          } count units _this;
          (side _this == _playerSide) && _anyPlayers > 0
        }] call EFUNC(common,filter);
      };

      {
        deleteMarkerLocal _x;
      } forEach _markers;
      _markers = [];

      for "_i" from 0 to (count _groups - 1) do {
        _group1 = _groups select _i;

        _markerType = [_group1] call EFUNC(common,getMarkerType);

        _colour = format ["Color%1", side _group1];

        _marker = createMarkerLocal [format ["ACE_BFT_%1", _i], [(getPos leader _group1) select 0, (getPos leader _group1) select 1]];
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerColorLocal _colour;
        _marker setMarkerTextLocal (groupID _group1);

        _markers pushBack _marker;
      };

      sleep GVAR(BFT_Interval);
    };

    // Delete markers as soon as the player dies
    {
      deleteMarkerLocal _x;
    } forEach _markers;
  };
};

[] spawn {
  // Init variables
  GVAR(mapTool_Shown) = 0;
  GVAR(mapTool_pos) = [0,0];
  GVAR(mapTool_angle) = 0;
  GVAR(mapTool_isDragging) = false;
  GVAR(mapTool_isRotating) = false;
  
  GVAR(mapGpsShow) = true;
  
  GVAR(drawing_isDrawing) = false;
  GVAR(drawing_tempLineMarker) = [];
  GVAR(drawing_lineMarkers) = [];
  GVAR(drawing_drawColor) = "ColorBlack";
  GVAR(drawing_controls) = [36732, 36733, 36734, 36735, 36736, 36737];

  _fnc_installMapEvents = {
    _d = _this;
    diag_log format ["Installing EH in display %1", _d];
    ((finddisplay _d) displayctrl 51) ctrlAddEventHandler ["MouseMoving", {_this call FUNC(handleMouseMove);}];
    ((finddisplay _d) displayctrl 51) ctrlAddEventHandler ["MouseButtonDown", {[1, _this] call FUNC(handleMouseButton);}];
    ((finddisplay _d) displayctrl 51) ctrlAddEventHandler ["MouseButtonUp", {[0, _this] call FUNC(handleMouseButton)}];
    ((finddisplay _d) displayctrl 51) ctrlAddEventHandler ["Draw", {[] call FUNC(updateMapToolMarkers);}];
    (finddisplay _d) displayAddEventHandler ["KeyDown", {_this call FUNC(handleKeyDown);}];
  };

  // Wait until the briefing map is detected
  // display = 37 for SP
  // display = 52 for host server on MP;
  // display = 53 for MP clients)
  waitUntil {(!isNull findDisplay 37) || (!isNull findDisplay 52) || (!isNull findDisplay 53) || (!isNull findDisplay 12)};

  if (isNull findDisplay 12) then {
    // Install event handlers on the map control of the briefing screen (control = 51)
    GVAR(drawing_syncMarkers) = true;
    if (!isNull findDisplay 52) then {
      52 call _fnc_installMapEvents;
    } else {
      if (!isNull findDisplay 53) then {
        53 call _fnc_installMapEvents;
      } else {
        37 call _fnc_installMapEvents;
      };
    };
  } else {
    // Briefing screen was skipped; the player is JIP, create the markers defined during the briefing
    GVAR(drawing_syncMarkers) = false;
    {
      _x call FUNC(addLineMarker);
    } forEach GVAR(drawing_serverLineMarkers);
  };

  // Wait until the main map display is detected (display = 12)
  waitUntil { !isNull findDisplay 12 };
  // Install event handlers on the map control and display (control = 51)
  GVAR(drawing_syncMarkers) = false;
  12 call _fnc_installMapEvents;

  // Update the size and rotation of map tools
  [] call FUNC(updateMapToolMarkers);

  while {true} do {
    waitUntil {visibleMap};

    // Show and update map tools if required
    [] call FUNC(updateMapToolMarkers);
    // Show GPS if required
    [GVAR(mapGpsShow)] call FUNC(openMapGps);

    // Update visibility of maptools and gps, handling inventory changes
    [] spawn {
      while {visibleMap} do {
        // Show/Hide draw buttons
        if ("ACE_MapTools" in items player) then {
          { ((finddisplay 12) displayctrl _x) ctrlShow true; } forEach GVAR(drawing_controls);
        } else {
          { ((finddisplay 12) displayctrl _x) ctrlShow false; } forEach GVAR(drawing_controls);
          if (GVAR(drawing_isDrawing)) then {
            call FUNC(cancelDrawing);
          };
        };
        sleep 1;
      };
    };

    waitUntil {!visibleMap};

    // Hide GPS
    [false] call FUNC(openMapGps);
    // Hide Map tools
    deleteMarkerLocal MARKERNAME_MAPTOOL_FIXED;
    deleteMarkerLocal MARKERNAME_MAPTOOL_ROTATINGNORMAL;
    deleteMarkerLocal MARKERNAME_MAPTOOL_ROTATINGSMALL;
    GVAR(mapTool_markerRotatingFixed) = nil;
    GVAR(mapTool_markerRotatingNormal) = nil;
    GVAR(mapTool_markerRotatingSmall) = nil;
    // Cancel drawing
    call FUNC(cancelDrawing);
  };
};
