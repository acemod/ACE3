// by commy2

#include "script_component.hpp"

_setupPlayer = {
  if (!isNull ACE_player) then {
    [(_this select 1)] call cba_fnc_removePerFrameHandler;

    [ACE_player] call EFUNC(common,muteUnit);
    ACE_player setVariable [QGVAR(isMuted), true, true];
  };
};

[_setupPlayer, 0, []] call CBA_fnc_addPerFrameHandler;

// Mutes/unmutes units when the player changes
["playerChanged", {
  EXPLODE_2_PVT(_this,_newPlayer,_oldPlayer);

  // On player change mute the new player
  [_newPlayer] call EFUNC(common,muteUnit);
  _newPlayer setVariable [QGVAR(isMuted), true, true];

  // Unmute the old player
  //@todo: sort interaction with medical system
  if (!(_oldPlayer getVariable ["ACE_isUnconscious", false]) && {alive _oldPlayer}) then {
    [_oldPlayer] call EFUNC(common,unMuteUnit);
  };
  _oldPlayer setVariable [QGVAR(isMuted), false, true];

}] call EFUNC(common,addEventhandler);
