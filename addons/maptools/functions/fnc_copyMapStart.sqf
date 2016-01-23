/*
 * Author: esteldunedain
 * Send request to remote player
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 0: Target player <OBJECT>
 *
 * Code Chain:
 * START:       copyMapStart: triggers event drawing_requestMarkers on remote
 * handeled by: copyMapRemoteSend: triggers event "drawing_sendbackMarkers" on origin
 * handeled by: copyMapReceiveMarkers
 *
 * Return value:
 * Return
 */

#include "script_component.hpp"

params ["_player", "_target"];

["drawing_requestMarkers", _target, [_player]] call EFUNC(common,targetEvent);
