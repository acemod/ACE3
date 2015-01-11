// by commy2

if (isNil "AGM_itemFix") then {
  AGM_isMapEnabled     = call {_config = missionConfigFile >> "showMap";     !isNumber _config || {getNumber _config == 1}};
  AGM_isCompassEnabled = call {_config = missionConfigFile >> "showCompass"; !isNumber _config || {getNumber _config == 1}};
  AGM_isWatchEnabled   = call {_config = missionConfigFile >> "showWatch";   !isNumber _config || {getNumber _config == 1}};
  AGM_isRadioEnabled   = call {_config = missionConfigFile >> "showRadio";   !isNumber _config || {getNumber _config == 1}};
  AGM_isGPSEnabled     = call {_config = missionConfigFile >> "showGPS";     !isNumber _config || {getNumber _config == 1}};

  AGM_itemFix = ["AGM_itemFix", "onEachFrame", {
    _items = assignedItems AGM_player;
    showMap     (AGM_isMapEnabled     && {"ItemMap"     in _items});
    showCompass (AGM_isCompassEnabled && {"ItemCompass" in _items});
    showWatch   (AGM_isWatchEnabled   && {"ItemWatch"   in _items});
  //showRadio   (AGM_isRadioEnabled   && {"ItemRadio"   in _items});
    showGPS     (AGM_isGPSEnabled     && {"ItemGPS"     in _items || {cameraOn == getConnectedUAV AGM_player}});  //If player is activly controling a UAV, showGPS controls showing the map (m key)
  }] call BIS_fnc_addStackedEventHandler;
};
