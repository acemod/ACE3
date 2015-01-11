/*
	Name: AGM_Goggles_fnc_ClearGlasses

	Author: Garth de Wet (LH)

	Description:
	Clears all dirt, rain, dust from glasses.
	Removes glasses effect (PP, overlay) and then puts it back.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call AGM_Goggles_fnc_ClearGlasses;
*/
#include "\AGM_Goggles\script.sqf"

private "_broken";
_broken = GETBROKEN;
AGM_Goggles_Effects = GLASSESDEFAULT;
AGM_Goggles_Effects set [BROKEN, _broken];

if ((stance player) != "PRONE") then {
	player playActionNow "gestureWipeFace";
};

null = [] spawn {
	sleep 0.3;
	if (cameraView == "INTERNAL") then {
		addCamShake [5, 1.75, 2];
	};
};

call AGM_Goggles_fnc_RemoveDirtEffect;
call AGM_Goggles_fnc_RemoveRainEffect;
call AGM_Goggles_fnc_RemoveDustEffect;
