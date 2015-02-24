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

vehicle _player != _player &&
{GVAR(ShowCrewInfo)} &&
{!(vehicle _player isKindOf "ParachuteBase")};
