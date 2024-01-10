#include "script_component.hpp"

["CBA_settingsInitialized", {
        if (isServer) then {
            [QGVAR(frag_eh), LINKFUNC(doFrag)] call CBA_fnc_addEventHandler;
            [QGVAR(spall_eh), LINKFUNC(doFragMomentum)] call CBA_fnc_addEventHandler;
            [] call FUNC(initBlackList);
        };
        
        /*if (hasInterface) then {
            ["ace_firedPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
            ["ace_firedPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
        };

        ["ace_firedNonPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
        ["ace_firedNonPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;*/

        // Debug info 
#ifdef DEBUG_MODE_DRAW
        if (hasInterface && GVAR(debugOptions)) then {	
	        private _h = [LINKFUNC(dev_drawTrace), 0] call CBA_fnc_addPerFrameHandler;
	        missionNamespace setVariable [QGVAR(dev_drawPFEH), _h];
	        ["unit", LINKFUNC(dev_switchUnitHandle), true] call CBA_fnc_addPlayerEventHandler;
	        [objNull, ace_player] call FUNC(dev_switchUnitHandle);
        };
#endif
}] call CBA_fnc_addEventHandler;


// Debug stuff:

#ifdef LOG_FRAG_INFO
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
