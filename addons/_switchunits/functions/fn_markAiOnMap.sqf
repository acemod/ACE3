/*
  Name: AGM_SwitchUnits_fnc_markAiOnMap
  
  Author(s):
    bux578
  
  Description:
    Creates markers for AI units for given sides
    Marks players in a different color
  
  Parameters:
    0: OBJECT - side
  
  Returns:
    VOID
*/

private ["_sidesToShow"];
_sidesToShow = _this select 0;

_sidesToShow spawn {

  private ["_sides", "_allMarkerNames"];
  _sides = _this;
  _allMarkerNames = [];

  while { true } do {
    sleep 1.5;

    // delete markers
    {
      deleteMarkerLocal _x;
    } forEach _allMarkerNames;

    // create markers
    {
      if (([_x] call AGM_SwitchUnits_fnc_isValidAi && (side group _x in _sides)) || (_x getVariable ["AGM_SwitchUnits_IsPlayerControlled", false])) then {
        private ["_markerName", "_marker", "_markerColor"];

        //_markerName = format ["%1", [_x] call AGM_Core_fnc_getName];
        _markerName = str _x;

        _marker = createMarkerLocal [_markerName, position _x];
        _markerName setMarkerTypeLocal "mil_triangle";
        _markerName setMarkerShapeLocal "ICON";
        _markerName setMarkerSizeLocal [0.5,0.7];
        _markerName setMarkerDirLocal getDir _x;
        
        // commy's one liner magic
        _markerColor = format ["Color%1", side group _x];
        
        if ((_x getVariable ["AGM_SwitchUnits_IsPlayerControlled", false])) then {
          _markerName setMarkerColorLocal "ColorOrange";
          _markerName setMarkerTextLocal (_x getVariable ["AGM_SwitchUnits_PlayerControlledName",""]);
        } else {
          _markerName setMarkerColorLocal _markerColor;
          _markerName setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName"));
        };

        _allMarkerNames pushBack _markerName;
      };
    } forEach allUnits;
  };
};
