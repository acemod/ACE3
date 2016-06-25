#include "script_component.hpp"

private _russianRankIcons = [
    QPATHTOEF(nametags,UI\icons_russia\private_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\corporal_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\sergeant_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\lieutenant_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\captain_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\major_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\colonel_gs.paa)
];

["rhs_faction_msv", _russianRankIcons] call EFUNC(nametags,setFactionRankIcons);
["rhs_faction_vdv", _russianRankIcons] call EFUNC(nametags,setFactionRankIcons);
