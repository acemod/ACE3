/*
	Name: ACE_Goggles_fnc_ClearGlasses

	Author: Garth de Wet (LH)

	Description:
	Clears all dirt, rain, dust from glasses.
	Removes glasses effect (PP, overlay) and then puts it back.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call ACE_Goggles_fnc_ClearGlasses;
*/
#include "\ACE_Goggles\script.sqf"

private "_broken";
_broken = GETBROKEN;
ACE_Goggles_Effects = GLASSESDEFAULT;
ACE_Goggles_Effects set [BROKEN, _broken];

if ((stance player) != "PRONE") then {
	player playActionNow "gestureWipeFace";
};

null = [] spawn {
	sleep 0.3;
	if (cameraView == "INTERNAL") then {
		addCamShake [5, 1.75, 2];
	};
};

call ACE_Goggles_fnc_RemoveDirtEffect;
call ACE_Goggles_fnc_RemoveRainEffect;
call ACE_Goggles_fnc_RemoveDustEffect;
