private _categoryName = format ["ACE %1", localize ELSTRING(map,Module_DisplayName)];

[
    QGVAR(moveRestriction), "LIST",
    [LSTRING(MoveRestriction), LSTRING(MoveRestriction_Description)],
    [_categoryName, LLSTRING(Module_DisplayName)],
    [
        [
            MOVE_RESTRICTION_NOBODY,
            MOVE_RESTRICTION_ALL,
            MOVE_RESTRICTION_ADMINS,
            MOVE_RESTRICTION_GROUP_LEADERS,
            MOVE_RESTRICTION_GROUP_LEADERS_ADMINS,
            MOVE_RESTRICTION_OWNER
        ],
        [
            LSTRING(MoveRestriction_Nobody),
            LSTRING(MoveRestriction_All),
            LSTRING(MoveRestriction_Admins),
            LSTRING(MoveRestriction_GroupLeaders),
            LSTRING(MoveRestriction_GroupLeadersAndAdmins),
            LSTRING(MoveRestriction_Owner)
        ],
        1
    ]
] call CBA_fnc_addSetting;

[
    QGVAR(timestampEnabled), "CHECKBOX",
    [LSTRING(TimestampEnabled), LSTRING(TimestampEnabledDescription)],
    [_categoryName, LLSTRING(Module_DisplayName)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timestampTimezone), "LIST",
    [LSTRING(TimestampTimezone), LSTRING(TimestampTimezoneDescription)],
    [_categoryName, LLSTRING(Module_DisplayName)],
    [
        [0, 1, 2],
        [LSTRING(TimestampTimezoneIngameTime), LSTRING(TimestampTimezoneSystemTime), LSTRING(TimestampTimezoneUTCTime)],
        0
    ],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timestampUTCOffset), "SLIDER",
    [LSTRING(TimestampUTCOffset), LSTRING(TimestampUTCOffsetDescription)],
    [_categoryName, LLSTRING(Module_DisplayName)],
    [-12, 14, 0, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(TimestampUTCMinutesOffset), "LIST",
    [LSTRING(TimestampUTCMinutesOffset), LSTRING(TimestampUTCMinutesOffsetDescription)],
    [_categoryName, LLSTRING(Module_DisplayName)],
    [
        [0, 15, 30, 45],
        [0, 15, 30, 45],
        0
    ]
] call CBA_fnc_addSetting;

[
    QGVAR(timestampHourFormat), "LIST",
    [LSTRING(TimestampHourFormat), LSTRING(TimestampHourFormatDescription)],
    [_categoryName, LLSTRING(Module_DisplayName)],
    [
        [24, 12],
        [LSTRING(TimestampHourFormat24), LSTRING(TimestampHourFormat12)],
        0
    ]
] call CBA_fnc_addSetting;

private _formatDescription = [
    LLSTRING(TimestampFormatDescription0),
    LLSTRING(TimestampFormatDescription1),
    LLSTRING(TimestampFormatDescription2),
    LLSTRING(TimestampFormatDescription3),
    LLSTRING(TimestampFormatDescription4),
    LLSTRING(TimestampFormatDescription5)
] joinString endl;

[
    QGVAR(timestampFormat), "LIST",
    [LSTRING(timestampFormat), _formatDescription],
    [_categoryName, LLSTRING(Module_DisplayName)],
    [
        ["HH", "HH:MM", "HH:MM:SS", "HH:MM:SS:MM", "HH:MM:SS.mmm"],
        ["HH", "HH:MM", "HH:MM:SS", "HH:MM:SS:MM", "HH:MM:SS.mmm"],
        1
    ]
] call CBA_fnc_addSetting;
