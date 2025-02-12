import SwiftUI

struct Constants {
    static let background = Color(red: 0, green: 0.106, blue: 0.098)
    static let cardBackground = Color(red: 0.141, green: 0.208, blue: 0.365)
    static let cardForeground = Color(red: 0.353, green: 0.412, blue: 0.596)
}

struct Step: Hashable {
    var title: String
    var isActive: Bool
}

struct ContentView: View {
    
    private let steps = [
        Step(title: "Step1", isActive: false),
        Step(title: "Step2", isActive: true),
        Step(title: "Step3", isActive: true),
        Step(title: "Step4", isActive: true)
    ]
    
    var body: some View {
        ZStack {
            Constants.background.ignoresSafeArea()
            VStack(alignment: .leading) {
                HeaderView()
                    .padding(.bottom, 16)
                StepsListView(steps: steps)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12)
                .stroke(Constants.cardForeground, lineWidth: 10)
                .fill(Constants.cardBackground))
            .padding(.horizontal)
        }
    }
}

private struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Let's get started")
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
            Text("Tick these off to make the most out of Company")
                .font(.body)
                .foregroundStyle(.white)
                .frame(width: 200, alignment: .leading)
        }
    }
}

private struct StepsListView: View {
    let steps: [Step]
    
    var body: some View {
        ForEach(steps, id: \.self) { step in
            StepRowView(step: step)
        }
    }
}

private struct StepRowView: View {
    let step: Step
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: step.isActive ? "circle.dashed" : "checkmark.circle.fill")
                .foregroundStyle(.white)
                .font(.title2)
            Text(step.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "chevron.right")
                .foregroundStyle(.white)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background {
             RoundedRectangle(cornerRadius: 12)
                 .fill(Constants.cardForeground)
                 .overlay(
                     RoundedRectangle(cornerRadius: 12)
                        .fill(Constants.cardForeground)
                        .shimmerEffect(
                            isActive: step.isActive,
                            speed: 1.8,
                            colors: shimmerColors,
                            cornerRadius: 12
                         )
                 )
         }
    }
    
    private var shimmerColors: [Color] {
        [Constants.cardForeground.opacity(0.6),
         .white.opacity(0.02),
         .white.opacity(0.15),
        ]
    }
}

#Preview {
    ContentView()
}
