// by commy2
#include "script_component.hpp"

private "_cameraView";
_cameraView = _this select 1;

GVAR(isUsingOptic) = _cameraView == "GUNNER";
