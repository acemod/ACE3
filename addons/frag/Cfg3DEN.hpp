
class Cfg3DEN {
    class Mission {
        class ACE_Settings {
            class AttributeCategories {
                class ADDON {
                    displayName = QUOTE(ADDON);
                    collapsed = 0;

                    class Attributes {
                        class GVAR(Enabled) {
                            property = QGVAR(Enabled);
                            displayName = CSTRING(EnableFrag);
                            tooltip = CSTRING(EnableFrag_Desc);
                            typeName = "BOOL";
                            control = "Checkbox";
                            defaultValue = "true";
                            expression = "%s = _value";
                            condition = "true";
                        };
                        class GVAR(SpallEnabled) {
                            property = QGVAR(SpallEnabled);
                            displayName = CSTRING(EnableSpall);
                            tooltip = CSTRING(EnableSpall_Desc);
                            typeName = "BOOL";
                            control = "Checkbox";
                            defaultValue = "false";
                            expression = "%s = _value";
                            condition = "true";
                        };
                        class GVAR(maxTrack) {
                            property = QGVAR(maxTrack);
                            displayName = CSTRING(MaxTrack);
                            tooltip = CSTRING(MaxTrack_Desc);
                            typeName = "NUMBER";
                            control = "Edit";
                            defaultValue = "500";
                            expression = "%s = _value";
                            condition = "true";
                            validate = "number";
                            value = 0;
                        };
                        class GVAR(MaxTrackPerFrame) {
                            property = QGVAR(MaxTrackPerFrame);
                            displayName = CSTRING(MaxTrackPerFrame);
                            tooltip = CSTRING(MaxTrackPerFrame_Desc);
                            typeName = "NUMBER";
                            control = "Edit";
                            defaultValue = "50";
                            expression = "%s = _value";
                            condition = "true";
                            validate = "number";
                            value = 0;
                        };
                        class GVAR(EnableDebugTrace) {
                            property = QGVAR(EnableDebugTrace);
                            displayName = CSTRING(EnableDebugTrace);
                            tooltip = CSTRING(EnableDebugTrace_Desc);
                            typeName = "BOOL";
                            control = "Checkbox";
                            defaultValue = "false";
                            expression = "%s = _value";
                            condition = "true";
                        };
                    };
                };
            };
        };
    };
};
