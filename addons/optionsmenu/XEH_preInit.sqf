#include "script_component.hpp"

ADDON = false;

PREP(addClientSideOptions);
PREP(loadFromProfile);
PREP(onListBoxSettingsChanged);
PREP(onListBoxShowSelectionChanged);
PREP(onSettingsMenuOpen);
PREP(onSliderPosChanged);
PREP(resetSettings);
PREP(saveToProfile);
PREP(settingsMenuUpdateKeyView);
PREP(settingsMenuUpdateList);
PREP(updateSetting);

ADDON = true;

GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];
