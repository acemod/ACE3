#include "script_component.hpp"

if (GVAR(Threshold) >= GVAR(border)) then {
    GVAR(isSuppressed) = true;
	
    if (alive ACE_player) then {
		private "_worValue";
        _workValue = GVAR(intensity) * ((GVAR(Threshold) - GVAR(border)) / (GVAR(maxValue) - GVAR(border)));
        addCamShake 
        [
            (_workValue * 1),		// Power
            2 + (_workValue * 23),	// Frequency
            1.5						// Duration
        ];
	
        GVAR(blur) ppEffectAdjust [(_workValue * 1.28)];
        GVAR(blur) ppEffectCommit 0.5;
	
        GVAR(cc) ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,(1 - (_workValue * 0.40))],[1,1,1,0]];
        GVAR(cc) ppEffectCommit 0.5;
			
        GVAR(rBlur) ppEffectAdjust [(_workValue * 0.011), (_workValue * 0.011), 0.2, 0.2];
        GVAR(rBlur) ppEffectCommit 0.05;
    };
} else {	
    GVAR(cc) ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
    GVAR(cc) ppEffectCommit 0;
	
    // Blur
    GVAR(blur) ppEffectAdjust [0];
    GVAR(blur) ppEffectCommit 0.3;
    	
	// RBlur
    GVAR(rBlur) ppEffectAdjust [0, 0, 0, 0];
    GVAR(rBlur) ppEffectCommit 0;

    GVAR(isSuppressed) = false;
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};