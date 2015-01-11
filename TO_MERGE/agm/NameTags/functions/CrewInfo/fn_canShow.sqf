/*
	Author: aeroson
	
	Description:
		Might be called several times a second
	
	Parameters: 
		None
	
	Returns:
		true if CrewInfo can be shown, false otherwise
*/

private["_player"];


_player = AGM_player;

// AGM_NameTags_ShowVehicleCrewInfo: -1 force NO, 0 doesnt care, 1 force YES

vehicle _player != _player &&
{
	(AGM_NameTags_CrewInfoVisibility == 1) ||
	(AGM_NameTags_CrewInfoVisibility != -1 && profileNamespace getVariable ["AGM_showVehicleCrewInfo", false])
} &&
{!(vehicle _player isKindOf "ParachuteBase")};
