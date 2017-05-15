
#include "script_component.hpp"
TRACE_1("Params",_this);

private _camera = GVAR(camera);
private _dummy = GVAR(camDummy);

if !(isNull _camera || isNull _dummy) then {
    _camera camPrepareTarget objNull;
    _camera camCommitPrepared 0;

    detach _dummy;

    GVAR(camHasTarget) = false;
};
