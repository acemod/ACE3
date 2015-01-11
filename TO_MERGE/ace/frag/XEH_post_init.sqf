#include "script_component.hpp"
[QUOTE(ffsBIS), "oneachframe", QUOTE(FUNC(onFrame))] call BIS_fnc_addStackedEventHandler;
if(isServer) then {
	[QGVAR(frag_eh), { _this call FUNC(frago); }] call CBA_fnc_addClientToServerEventhandler;
};
GVAR(replacedBisArtyWrapper) = false;
[] spawn {
	waitUntil {
		if(!(isNil "BIS_ARTY_F_ShellFlight")) then {
			ACE_WRAPPER_BIS_ARTY_F_ShellFlight = BIS_ARTY_F_ShellFlight;
			BIS_ARTY_F_ShellFlight = FUNC(BIS_ARTY_WRAPPER);
			GVAR(replacedBisArtyWrapper) = true;
		};
		sleep 4;
		GVAR(replacedBisArtyWrapper)
	};
};
