// by commy2
#include "\z\ace\addons\common\script_component.hpp"

if (isNil "ACE_itemFix") then {
  ACE_isMapEnabled     = call {_config = missionConfigFile >> "showMap";     !isNumber _config || {getNumber _config == 1}};
  ACE_isCompassEnabled = call {_config = missionConfigFile >> "showCompass"; !isNumber _config || {getNumber _config == 1}};
  ACE_isWatchEnabled   = call {_config = missionConfigFile >> "showWatch";   !isNumber _config || {getNumber _config == 1}};
  ACE_isRadioEnabled   = call {_config = missionConfigFile >> "showRadio";   !isNumber _config || {getNumber _config == 1}};
  ACE_isGPSEnabled     = call {_config = missionConfigFile >> "showGPS";     !isNumber _config || {getNumber _config == 1}};

  ACE_itemFix = ["ACE_itemFix", "onEachFrame", {
    _items = assignedItems ACE_player;
    showMap     (ACE_isMapEnabled     && {"ItemMap"     in _items});
    showCompass (ACE_isCompassEnabled && {"ItemCompass" in _items});
    showWatch   (ACE_isWatchEnabled   && {"ItemWatch"   in _items});
  //showRadio   (ACE_isRadioEnabled   && {"ItemRadio"   in _items});
    showGPS     (ACE_isGPSEnabled     && {"ItemGPS"     in _items || {cameraOn == getConnectedUAV ACE_player}});  //If player is activly controling a UAV, showGPS controls showing the map (m key)
  }] call BIS_fnc_addStackedEventHandler;
};
