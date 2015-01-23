#include "script_component.hpp"

ADDON = false;

PREP(addClientSideColor);
PREP(addClientSideOptions);
PREP(addFromConfig);
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

GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];

ADDON = true;
