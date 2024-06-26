import SwiftUI

struct CurrentGlucoseView: View {
    @Binding var recentGlucose: BloodGlucose?
    @Binding var delta: Int?
    @Binding var units: GlucoseUnits
    @Binding var alarm: GlucoseAlarm?

    private var glucoseFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        if units == .mmolL {
            formatter.minimumFractionDigits = 1
            formatter.maximumFractionDigits = 1
        }
        formatter.roundingMode = .halfUp
        return formatter
    }

    private var deltaFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        formatter.positivePrefix = "  +"
        formatter.negativePrefix = "  -"
        return formatter
    }

    private var timaAgoFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.negativePrefix = ""
        return formatter
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(
                    recentGlucose?.glucose
                        .map {
                            glucoseFormatter
                                .string(from: Double(units == .mmolL ? $0.asMmolL : Decimal($0)) as NSNumber)! }
                        ?? "--"
                )
                .font(.title).fontWeight(.bold)
                .foregroundColor(alarm == nil ? colorOfGlucose : .loopRed)

                image
            }
            HStack {
                let minutes = (recentGlucose?.dateString.timeIntervalSinceNow ?? 0) / 60
                let text = timaAgoFormatter.string(for: Double(minutes)) ?? ""
                Text(
                    text == "0" ? "< 1 " + NSLocalizedString("min", comment: "Short form for minutes") : (
                        text + " " +
                            NSLocalizedString("min", comment: "Short form for minutes") + " "
                    )
                )
                .font(.caption2).foregroundColor(.secondary)

                Text(
                    delta
                        .map {
                            deltaFormatter.string(from: Double(units == .mmolL ? $0.asMmolL : Decimal($0)) as NSNumber)!
                        } ?? "--"
                )
                .font(.caption2).foregroundColor(.secondary)
            }.frame(alignment: .top)
        }
    }

    var image: Image {
        guard let direction = recentGlucose?.direction else {
            return Image(systemName: "arrow.left.and.right")
        }

        switch direction {
        case .doubleUp,
             .singleUp,
             .tripleUp:
            return Image(systemName: "arrow.up")
        case .fortyFiveUp:
            return Image(systemName: "arrow.up.right")
        case .flat:
            return Image(systemName: "arrow.forward")
        case .fortyFiveDown:
            return Image(systemName: "arrow.down.forward")
        case .doubleDown,
             .singleDown,
             .tripleDown:
            return Image(systemName: "arrow.down")

        case .none,
             .notComputable,
             .rateOutOfRange:
            return Image(systemName: "arrow.left.and.right")
        }
    }

    var colorOfGlucose: Color {
        let whichGlucose = recentGlucose?.glucose ?? 0

        switch whichGlucose {
        case 71 ... 145:
            return .loopGreen
        case 1 ... 55,
             217...:
            return .loopRed
        case 56 ... 70,
             146 ... 216:
            return .loopYellow
        default:
            return .primary
        }
    }
}
