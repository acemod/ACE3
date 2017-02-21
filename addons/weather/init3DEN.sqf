// point of this file is to disable "auto-weather" by default
// we want this, because it breaks weather commands we use in this component
#include "script_component.hpp"

// cannot create checkboxes which have the default value "true"
// 3den uses inverted checkboxes instead, but those only change in appearence
// we have to auto set these settings manually - on mission creation
add3DENEventHandler ["onMissionNew", {
    set3DENMissionAttributes [
        ["Intel", "IntelRainIsForced", true],
        ["Intel", "IntelLightningIsForced", true],
        ["Intel", "IntelWavesIsForced", true],
        ["Intel", "IntelWindIsForced", true]
    ];
}];
