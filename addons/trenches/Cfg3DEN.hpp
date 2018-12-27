class Cfg3DEN {
    class EventHandlers {
        class ADDON {
            onMissionPreviewEnd = QUOTE(with uiNamespace do {call FUNC(initTrench3DEN)});
            onMissionLoad = QUOTE(with uiNamespace do {call FUNC(initTrench3DEN)});
        };
    };
};
