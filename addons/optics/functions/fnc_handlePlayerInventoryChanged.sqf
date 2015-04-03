// by commy2
#include "script_component.hpp"

private "_usedOptics";
_usedOptics = if (isNull (_this select 0)) then {["","",""]} else { //@todo fix eh
    [
        _this select 1 select 9 select 2,
        _this select 1 select 12 select 2,
        _this select 1 select 15 select 2
    ]
};

// update onDraw functions
{
    if (_x != GVAR(usedOptics) select _forEachIndex select 0) then {
        private ["_opticsTexture", "_opticsScript"];

        _opticsTexture = "";
        _opticsScript = {};

        if (_x != "") then { // @todo
            _opticsTexture = "";
            _opticsScript = {};
        };

        GVAR(usedOptics) set [_forEachIndex, [_x, _opticsTexture, _opticsScript]];
    };
} forEach _usedOptics;

//(uiNamespace getVariable "ACE_ctrlShortdotReticle") ctrlSetText QUOTE(PATHTOF(reticles\ace_shortdot_reticle_1.paa));
