// by commy2
#include "script_component.hpp"

private "_newUnit";

_newUnit = _this select 0;

switch (side group _newUnit) do {
    case (west): {
        ((missionNamespace getVariable ["ACE_Rallypoint_West", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 1;
        ((missionNamespace getVariable ["ACE_Rallypoint_East", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_West_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 1;
        ((missionNamespace getVariable ["ACE_Rallypoint_East_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
    };

    case (east): {
        ((missionNamespace getVariable ["ACE_Rallypoint_West", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_East", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 1;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_West_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_East_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 1;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
    };

    case (independent): {
        ((missionNamespace getVariable ["ACE_Rallypoint_West", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_East", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 1;
        ((missionNamespace getVariable ["ACE_Rallypoint_West_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_East_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 1;
    };

    default {
        ((missionNamespace getVariable ["ACE_Rallypoint_West", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_East", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_West_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_East_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
        ((missionNamespace getVariable ["ACE_Rallypoint_Independent_Base", objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal 0;
    };
};
