#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "cse_ab_RscKestrel4500")
#define __ctrlcse_ab_Kestrel4500 (__dsp displayCtrl 75000)
#define __ctrlTop (__dsp displayCtrl 75100)
#define __ctrlCenterBig (__dsp displayCtrl 75200)
#define __ctrlCenterLine1Left (__dsp displayCtrl 75300)
#define __ctrlCenterLine2Left (__dsp displayCtrl 75301)
#define __ctrlCenterLine3Left (__dsp displayCtrl 75302)
#define __ctrlCenterLine1Right (__dsp displayCtrl 75303)
#define __ctrlCenterLine2Right (__dsp displayCtrl 75304)
#define __ctrlCenterLine3Right (__dsp displayCtrl 75305)
#define __ctrlInfoLine1 (__dsp displayCtrl 75400)
#define __ctrlInfoLine2 (__dsp displayCtrl 75401)

if (cse_ab_Kestrel4500_Overlay) exitWith {
	cse_ab_Kestrel4500_Overlay = false;
	3 cutText ["", "PLAIN"];
	true
};
if (underwater player) exitWith { true };
if (!([player, "cse_ab_Kestrel4500"] call cse_fnc_hasItem_CC)) exitWith { true };

if (cse_ab_Kestrel4500 && dialog) then {
	cse_ab_Kestrel4500 = false;
	closeDialog 0;
};

[] spawn {
	private ["_outputData"];

	cse_ab_Kestrel4500_Overlay = true;

	while {cse_ab_Kestrel4500_Overlay && (("cse_ab_Kestrel4500" in (uniformItems player)) || ("cse_ab_Kestrel4500" in (vestItems player)))} do {
		_outputData = call cse_ab_Kestrel4500_fnc_generate_output_data;

		3 cutRsc ["cse_ab_RscKestrel4500", "PLAIN", 1, false];

		__ctrlTop ctrlSetText (_outputData select 0);
		__ctrlCenterBig ctrlSetText (_outputData select 1);

		__ctrlTop ctrlSetText (_outputData select 0);
		__ctrlCenterBig ctrlSetText (_outputData select 1);

		__ctrlCenterLine1Left ctrlSetText (_outputData select 2);
		__ctrlCenterLine2Left ctrlSetText (_outputData select 3);
		__ctrlCenterLine3Left ctrlSetText (_outputData select 4);

		__ctrlCenterLine1Right ctrlSetText (_outputData select 5);
		__ctrlCenterLine2Right ctrlSetText (_outputData select 6);
		__ctrlCenterLine3Right ctrlSetText (_outputData select 7);

		__ctrlInfoLine1 ctrlSetText (_outputData select 8);
		__ctrlInfoLine2 ctrlSetText (_outputData select 9);

		sleep 1;
	};

	cse_ab_Kestrel4500_Overlay = false;
	3 cutText ["", "PLAIN"];
};

true
