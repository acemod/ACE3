/*
    Author: aeroson
    
    Description:
        Might be called several times a second
    
    Parameters: 
        None
    
    Returns:
        true if CrewInfo can be shown, false otherwise
*/

#include "script_component.hpp"

private["_player"];

_player = ACE_player;

// AGM_NameTags_ShowVehicleCrewInfo: -1 force NO, 0 doesnt care, 1 force YES

vehicle _player != _player &&
{
    (GVAR(CrewInfoVisibility) == 1) ||
    (GVAR(CrewInfoVisibility) != -1 && profileNamespace getVariable ["ACE_showVehicleCrewInfo", false])
} &&
{!(vehicle _player isKindOf "ParachuteBase")};
