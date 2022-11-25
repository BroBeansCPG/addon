// FILE: CBA Settings

#include "script_component.hpp"
#include "XEH_prep.sqf"

GVAR(allSettings) = [
  // Section: Auto-Start Settings

  /*
    CBA Setting: OCAP_settings_autoStart
    Description:
      Automatically start OCAP recordings at session start. Default: true

    Setting Name:
      Auto Start Recording

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,autoStart),
    "CHECKBOX", // setting type
    [
      localize LSTRING(AutoStartRecording), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(AutoStartRecording_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsAutoStart)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // default enabled
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    true // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_minPlayerCount
    Description:
      Auto-start will begin once this player count is reached. Default: 15

    Setting Name:
      Minimum Player Count

    Value Type:
      Number
  */
  [
    QEGVAR(settings,minPlayerCount),
    "SLIDER", // setting type
    [
      localize LSTRING(MinimumPlayerCount), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(MinimumPlayerCount_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsAutoStart)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        1, // min
        150, // max
        15, // default
        0, // trailing decimals
        false // percentage
    ], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],


  // Section: Core

  /*
    CBA Setting: OCAP_settings_frameCaptureDelay
    Description:
      Positioning, medical status, and crew states of units and vehicles will be captured every X amount of seconds. Default: 1

    Setting Name:
      Frame Capture Delay

    Value Type:
      Number
  */
  [
    QEGVAR(settings,frameCaptureDelay),
    "SLIDER", // setting type
    [
      localize LSTRING(FrameCaptureDelay), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(FrameCaptureDelay_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsCore)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        0.30, // min
        10, // max
        1, // default
        2, // trailing decimals
        false // percentage
    ], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    true // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_preferACEUnconscious
    Description:
      If true, will check ACE3 medical status on units. If false, or ACE3 isn't loaded, fall back to vanilla. Default: true

    Setting Name:
      Use ACE3 Medical

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,preferACEUnconscious),
    "CHECKBOX", // setting type
    [
      localize LSTRING(UseACE3Medical), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(UseACE3Medical_Tooltip)
    ],
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsCore)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // default enabled
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],





  // Section: Exclusions

  /*
    CBA Setting: OCAP_settings_excludeClassFromRecord
    Description:
      Array of object classnames that should be excluded from recording. Use single quotes! Default: ['ACE_friesAnchorBar', 'WeaponHolderSimulated']

    Setting Name:
      Classnames to Exclude

    Value Type:
      Stringified Array

    Example:
      > "['ACE_friesAnchorBar', 'WeaponHolderSimulated']"
  */
  [
    QEGVAR(settings,excludeClassFromRecord),
    "EDITBOX", // setting type
    [
      localize LSTRING(ClassnamesToExclude), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(ClassnamesToExclude_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsExclusions)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "['ACE_friesAnchorBar']", // default string value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_excludeKindFromRecord
    Description:
      Array of classnames which, along with all child classes, should be excluded from recording. Use single quotes! Default: []

    Setting Name:
      Object KindOfs to Exclude

    Value Type:
      Stringified Array

    Example:
      > "['WeaponHolder']"
  */
  [
    QEGVAR(settings,excludeKindFromRecord),
    "EDITBOX", // setting type
    [
      localize LSTRING(KindOfToExclude), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(KindOfToExclude_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsExclusions)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "['WeaponHolder']", // default string value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_excludeMarkerFromRecord
    Description:
      Array of prefixes. Any markers matching these prefixes will be excluded from recording. Use single quotes! Default: ['SystemMarker_','ACE_BFT_']

    Setting Name:
      Marker Prefixes To Exclude

    Value Type:
      Stringified Array

    Example:
      > "['SystemMarker_','ACE_BFT_']"
  */
  [
    QEGVAR(settings,excludeMarkerFromRecord),
    "EDITBOX", // setting type
    [
      localize LSTRING(MarkerPrefixesExclude), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(MarkerPrefixesExclude_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsExclusions)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "['SystemMarker_','ACE_BFT_']", // default string value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],




  // Section: Extra Tracking

  /*
    CBA Setting: OCAP_settings_trackTickets
    Description:
      Will track respawn ticket counts for missionNamespace and each playable faction every 30th frame. Default: true

    Setting Name:
      Enable Ticket Tracking

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,trackTickets),
    "CHECKBOX", // setting type
    [
      localize LSTRING(TicketTracking), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(TicketTracking_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsExtraTracking)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // default enabled
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_trackTimes
    Description:
      Will continuously track in-game world time during a mission. Useful for accelerated/skipped time scenarios. Default: false

    Setting Name:
      Enable Mission Time Tracking

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,trackTimes),
    "CHECKBOX", // setting type
    [
      localize LSTRING(MissionTimeTracking), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(MissionTimeTracking_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsExtraTracking)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // default enabled
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_trackTimeInterval
    Description:
      If <OCAP_settings_trackTimes> is enabled, it will be checked every X capture frames. Default: 10

    Setting Name:
      Mission Time Tracking Interval

    Value Type:
      Number
  */
  [
    QEGVAR(settings,trackTimeInterval),
    "SLIDER", // setting type
    [
      localize LSTRING(MissionTimeTrackingInterval), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(MissionTimeTrackingInterval_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsExtraTracking)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        5, // min
        25, // max
        10, // default
        0, // trailing decimals
        false // percentage
    ], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],



  // Section: Save/Export Settings

  /*
    CBA Setting: OCAP_settings_saveTag
    Description:
      If not overriden by the <OCAP_exportData> CBA event or if a mission is auto-saved, this will be used to categorize and filter the recording in the database and web list of missions.

    Setting Name:
      Mission Type Tag

    Value Type:
      String
  */
  [
    QEGVAR(settings,saveTag),
    "EDITBOX", // setting type
    [
      localize LSTRING(MissionTag), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(MissionTag_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsSaveExport)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "TvT", // default string value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_saveMissionEnded
    Description:
      If true, automatically save and export the mission when the MPEnded event fires. Default: true

    Setting Name:
      Auto-save on MPEnded Event

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,saveMissionEnded),
    "CHECKBOX", // setting type
    [
      localize LSTRING(SaveOnEnd), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(SaveOnEnd_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsSaveExport)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // default enabled
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_saveOnEmpty
    Description:
      Will automatically save recording when there are 0 players on the server and existing data accounts for more time than the minimum save duration setting. Default: true

    Setting Name:
      Auto-Save When No Players

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,saveOnEmpty),
    "CHECKBOX", // setting type
    [
      localize LSTRING(SaveOnEmpty), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(SaveOnEmpty_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsSaveExport)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // default enabled
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    false // requires restart to apply
  ],

  /*
    CBA Setting: OCAP_settings_minMissionTime
    Description:
      A recording must be at least this long (in minutes) to auto-save. Calling an <OCAP_exportData> CBA server event will override this restriction. Default: 20

    Setting Name:
      Required Duration to Sav

    Value Type:
      Boolean
  */
  [
    QEGVAR(settings,minMissionTime),
    "SLIDER", // setting type
    [
      localize LSTRING(MinimumSaveDuration), // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
      localize LSTRING(MinimumSaveDuration_Tooltip)
    ],
    [COMPONENT_NAME, localize LSTRING(SettingsSaveExport)], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        1, // min
        120, // max
        20, // default
        0, // trailing decimals
        false // percentage
    ], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    true // requires restart to apply
  ]
];

{
  _x call CBA_fnc_addSetting;
} forEach GVAR(allSettings);

ADDON = true;
