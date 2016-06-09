{
  _currentMarker = _x;
  _markerPos = format ["%1",(getMarkerPos _currentMarker)];
  _markerDir = format ["%1",(markerDir  _currentMarker)];
  
  _aCurrentMarker = toArray _currentMarker;
  _aCurrentMarker resize 3;
  
  if(toString _aCurrentMarker == "wi_") then {
	  _sql_res = "extDB2" callExtension format["0:SQL:SELECT id FROM marker WHERE markerName = '%2' AND mission_FK = '%1'",sru_pdb_mission_fk,_currentMarker];
	  _sql_res = _sql_res splitString "[,]";
			
	  if(count _sql_res > 1) then {
			
			
			_sql_res = "extDB2" callExtension format["0:SQL:UPDATE marker SET markerPos = '%3', markerDir = '%4' WHERE markerName = '%2' AND mission_FK = '%1'",sru_pdb_mission_fk,_currentMarker,_markerPos,_markerDir];
			
	  } else {
			
			_sql_res = "extDB2" callExtension format["0:SQL:INSERT INTO marker SET markerName = '%2', markerDir = '%4', mission_FK = '%1', markerPos = '%3'",sru_pdb_mission_fk,_currentMarker,_markerPos,_markerDir];
	  
	  };
  };
  
} forEach allMapMarkers;