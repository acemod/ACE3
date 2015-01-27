#define DEBUG_MODE_FULL
#include "script_component.hpp"
// TODO: we should do this differently eventually
private["_onActionId", "_offActionId"];
TRACE_1("ENTER", _this);

// TODO: THIS SHOULD NOT BE ACTIONS EVENTUALLY

_onActionId = player addAction ["Laser Designator On", { _this call FUNC(laserHudDesignateOn) }, [], 1, false, false, "", QUOTE( (gunner (vehicle player)) == player && !GVAR(laserActive))];
player setVariable[QGVAR(onActionId), _onActionId, false];

_offActionId = player addAction ["Laser Designator Off", { _this call FUNC(laserHudDesignateOff) }, [], 1, false, false, "", QUOTE( (gunner (vehicle player)) == player && GVAR(laserActive))];
player setVariable[QGVAR(offActionId), _offActionId, false];