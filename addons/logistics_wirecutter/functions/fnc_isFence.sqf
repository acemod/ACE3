#include "script_component.hpp"

#define FENCE_A3_TYPENAMES ["Land_Net_Fence_4m_F", "Land_Net_Fence_8m_F", "Land_Net_FenceD_8m_F", "Land_New_WiredFence_5m_F", "Land_New_WiredFence_10m_Dam_F", "Land_New_WiredFence_10m_F", "Land_Pipe_fence_4m_F", "Land_Pipe_fence_4mNoLC_F", "Land_SportGround_fence_F", "Land_Wired_Fence_4m_F", "Land_Wired_Fence_4mD_F", "Land_Wired_Fence_8m_F", "Land_Wired_Fence_8mD_F", "Land_Razorwire_F"]
#define FENCE_A3_P3DS ["mil_wiredfence_f"]


private ["_typeOf", "_returnValue"];
PARAMS_1(_object);

_typeOf = typeOf _object;
_returnValue = false;

if (_typeOf != "") then {
  systemChat format ["checking %1", _typeOf];
  _returnValue = _typeOf in FENCE_A3_TYPENAMES;
} else {
  _typeOf = str _object;
  {
    if ((_typeOf find _x) != -1) then {
      _returnValue = true;
    };
  } forEach FENCE_A3_P3DS;
};
_returnValue
