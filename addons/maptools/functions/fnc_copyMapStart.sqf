/*
 * Author: esteldunedain
 *
 * Send request to remote player
 *
 * Argument:
 * 0: Player (Unit)
 * 0: Target player (Unit)
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

PARAMS_1(_player,_target);

["drawing_requestMarkers", _target, [_player]] call EFUNC(common,targetEvent);
