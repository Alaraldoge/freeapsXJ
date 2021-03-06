extension OpenAPS {
    enum Bundle {
        static let iob = "bundle/iob"
        static let meal = "bundle/meal"
        static let autotunePrep = "bundle/autotune-prep"
        static let autotuneCore = "bundle/autotune-core"
        static let getLastGlucose = "bundle/glucose-get-last"
        static let basalSetTemp = "bundle/basal-set-temp"
        static let determineBasal = "bundle/determine-basal"
        static let autosens = "bundle/autosens"
        static let profile = "bundle/profile"
    }

    enum Prepare {
        static let iob = "prepare/iob"
        static let meal = "prepare/meal"
        static let autotunePrep = "prepare/autotune-prep"
        static let autotuneCore = "prepare/autotune-core"
        static let determineBasal = "prepare/determine-basal"
        static let autosens = "prepare/autosens"
        static let profile = "prepare/profile"
    }

    enum Settings {
        static let preferences = "preferences.json"
        static let autotune = "settings/autotune.json"
        static let autosense = "settings/autosense.json"
        static let profile = "settings/profile.json"
        static let pumpProfile = "settings/pumpprofile.json"
        static let settings = "settings/settings.json"
        static let bgTargets = "settings/bg_targets.json"
        static let insulinSensitivities = "settings/insulin_sensitivities.json"
        static let basalProfile = "settings/basal_profile.json"
        static let carbRatios = "settings/carb_ratios.json"
        static let tempTargets = "settings/temptargets.json"
        static let model = "settings/model.json"
    }

    enum Monitor {
        static let pumpHistory = "monitor/pumphistory-24h-zoned.json"
        static let reservoir = "monitor/reservoir.json"
        static let battery = "monitor/battery.json"
        static let carbHistory = "monitor/carbhistory.json"
        static let clock = "monitor/clock-zoned.json"
        static let status = "monitor/status.json"
        static let tempBasal = "monitor/temp_basal.json"
        static let meal = "monitor/meal.json"
        static let glucose = "monitor/glucose.json"
        static let iob = "monitor/iob.json"
    }

    enum Enact {
        static let suggested = "enact/suggested.json"
        static let enacted = "enact/enacted.json"
    }

    enum Upload {
        static let nsStatus = "upload/ns-status.json"
        static let latestTreatments = "upload/latest-treatments.json"
        static let recentPumphistory = "upload/recent-pumphistory.json"
    }

    enum Function {
        static let freeaps = "freeaps"
        static let generate = "generate"
        static let tempBasalFunctions = "tempBasalFunctions"
        static let exportDefaults = "exportDefaults"
    }

    enum FreeAPS {
        static let settings = "freeaps/freeaps_settings.json"
        static let announcements = "freeaps/announcements.json"
        static let announcementsEnacted = "freeaps/announcements_enacted.json"
    }
}