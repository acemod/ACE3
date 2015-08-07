#include "script_component.hpp"

ADDON = false;

PREP(debugDumpToClipboard);
PREP(onListBoxSettingsChanged);
PREP(onListBoxShowSelectionChanged);
PREP(onSettingsMenuOpen);
PREP(onSliderPosChanged);
PREP(onServerSaveInputField);
PREP(onServerSettingsMenuOpen);
PREP(onServerListBoxShowSelectionChanged);
PREP(onCategorySelectChanged);
PREP(resetSettings);
PREP(serverResetSettings);
PREP(settingsMenuUpdateKeyView);
PREP(settingsMenuUpdateList);
PREP(serverSettingsMenuUpdateKeyView);
PREP(serverSettingsMenuUpdateList);
PREP(updateSetting);
PREP(exportSettings);
PREP(toggleIncludeClientSettings);
PREP(moduleAllowConfigExport);

GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];

GVAR(serverConfigGeneration) = 0;
GVAR(ClientSettingsExportIncluded) = false;
GVAR(serverSideOptions) = [];
GVAR(serverSideColors) = [];
GVAR(serverSideValues) = [];
GVAR(categories) = [];
GVAR(currentCategorySelection) = 0;

ADDON = true;
