#include "script_component.hpp"
    GVAR(PostProcessEyes) ppEffectEnable false;
    SETGLASSES(ace_player,GLASSESDEFAULT);
    call FUNC(removeGlassesEffect);
    GVAR(EffectsActive)=false;
    ace_player setVariable ["ACE_EyesDamaged", false];
    if (GVAR(EyesDamageScript) != -1) then {
        [GVAR(EyesDamageScript)] call CALLSTACK(cba_fnc_removePreFrameHandler);
    };
    if (GVAR(DustHandler) != -1) then {
        [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
        GVAR(DustHandler) = -1;
    };