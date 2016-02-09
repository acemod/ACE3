
class Cfg3DEN {
    class Mission {
        class PREFIX {
            class AttributeCategories {
                class ADDON {
                    displayName = QGVAR(ADDON);

                    class Attributes {
                        class GVAR(Enabled) {
                            data = QGVAR(Enabled);
                            property = QGVAR(Enabled);
                            displayName = CSTRING(EnableFrag);
                            tooltip = CSTRING(EnableFrag_Desc);
                            typeName = "BOOL";
                            control = "Checkbox";
                            defaultValue = "true";
                            expression = "%s = _value";
                        };
                        class GVAR(SpallEnabled) {
                            data = QGVAR(SpallEnabled);
                            property = QGVAR(SpallEnabled);
                            displayName = CSTRING(EnableSpall);
                            tooltip = CSTRING(EnableSpall_Desc);
                            typeName = "BOOL";
                            control = "Checkbox";
                            defaultValue = "false";
                            expression = "%s = _value";
                        };
                        class GVAR(maxTrack) {
                            data = QGVAR(maxTrack);
                            property = QGVAR(maxTrack);
                            displayName = CSTRING(MaxTrack);
                            tooltip = CSTRING(MaxTrack_Desc);
                            typeName = "NUMBER";
                            control = "Edit";
                            defaultValue = "500";
                            expression = "%s = _value";
                            validate = "number";
                            wikiType = "[[Number]]";
                            value = 0;
                        };
                        class GVAR(MaxTrackPerFrame) {
                            data = QGVAR(MaxTrackPerFrame);
                            property = QGVAR(MaxTrackPerFrame);
                            displayName = CSTRING(MaxTrackPerFrame);
                            tooltip = CSTRING(MaxTrackPerFrame_Desc);
                            typeName = "NUMBER";
                            control = "Edit";
                            defaultValue = "50";
                            expression = "%s = _value";
                            validate = "number";
                            wikiType = "[[Number]]";
                            value = 0;
                        };
                        class GVAR(EnableDebugTrace) {
                            data = QGVAR(EnableDebugTrace);
                            property = QGVAR(EnableDebugTrace);
                            displayName = CSTRING(EnableDebugTrace);
                            tooltip = CSTRING(EnableDebugTrace_Desc);
                            typeName = "BOOL";
                            control = "Checkbox";
                            defaultValue = "false";
                            expression = "%s = _value";
                        };
                    };
                };
            };
        };
    };
};
