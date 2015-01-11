/*
 * Author: CAA-Picard
 *
 * Opens or closes the gps on the map screen, showing coordinates
 *
 * Argument:
 * 0: Open GPS? (Boolean)
 *
 * Return value:
 * Nothing
 */


_open = _this select 0;
_isOpen = !(isNull (uiNamespace getVariable ['AGM_Map_mapGpsDisplay', displayNull]));

if (_open && {"ItemGPS" in assignedItems player} && {!_isOpen}) then {
  ("AGM_mapGpsLayer" call BIS_fnc_rscLayer) cutRsc ["RscAGM_MapGps","PLAIN"];

  // Spawn a thread to update gps display
  [] spawn {
    disableSerialization;
    while {!(isNull (uiNamespace getVariable ['AGM_Map_mapGpsDisplay', displayNull]))} do {
      if !("ItemGPS" in assignedItems player) exitWith {};

      _mapGpsDisplay = uiNamespace getVariable ['AGM_Map_mapGpsDisplay', displayNull];
      _ctrl = _mapGpsDisplay displayCtrl 913590;
      _ctrl ctrlSetText str(round(getDir player));
      _ctrl = _mapGpsDisplay displayCtrl 913591;
      _ctrl ctrlSetText str(round((getPosASL player) select 2));
      _ctrl = _mapGpsDisplay displayCtrl 913592;
      _ctrl ctrlSetText mapGridPosition player;

      sleep 0.5;
    };
    ("AGM_mapGpsLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
  };

} else {
  ("AGM_mapGpsLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};

