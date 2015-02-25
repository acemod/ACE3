#include "script_component.hpp"

ADDON = false;

PREP(onListBoxSettingsChanged);
PREP(onListBoxShowSelectionChanged);
PREP(onSettingsMenuOpen);
PREP(onSliderPosChanged);
PREP(resetSettings);
PREP(settingsMenuUpdateKeyView);
PREP(settingsMenuUpdateList);
PREP(updateSetting);

GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];

ADDON = true;
