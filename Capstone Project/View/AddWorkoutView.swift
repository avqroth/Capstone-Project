
import SwiftUI

struct AddWorkoutView: View {
    let mainColor = Color("MainColor")
    let detailsColor = Color("DetailsColor")
    let textFieldColor = Color("TextFieldColor")

    @State private var workoutType: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""
    @State private var equipment: String = ""
    @State private var weight: String = ""

    @ObservedObject var saveWorkoutDataStore = SaveWorkoutData()

    var body: some View {
        VStack {
            Section(header: Text("Workout Type").foregroundColor(mainColor))
            {
                TextField("  Workout Type", text: $workoutType)
                    .font(.custom("Avenir", size: textFieldFontSize))
                    .padding(.vertical, textFieldVerticalPadding)
                    .padding(.horizontal, textFieldHorizontalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: textFieldCornerRadius)
                            .foregroundColor(textFieldColor))
                    .padding(.bottom)
            }

            Section(header: Text("Sets").foregroundColor(mainColor))
            {
                TextField("  Sets", text: $sets)
                    .font(.custom("Avenir", size: textFieldFontSize))
                    .padding(.vertical, textFieldVerticalPadding)
                    .padding(.horizontal, textFieldHorizontalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: textFieldCornerRadius)
                            .foregroundColor(textFieldColor))
                    .padding(.bottom, sectionBottomPadding)
            }

            Section(header: Text("Reps").foregroundColor(mainColor))
            {
                TextField("  Reps", text: $reps)
                    .font(.custom("Avenir", size: textFieldFontSize))
                    .padding(.vertical, textFieldVerticalPadding)
                    .padding(.horizontal, textFieldHorizontalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: textFieldCornerRadius)
                            .foregroundColor(textFieldColor))
                    .padding(.bottom, sectionBottomPadding)
            }

            Section(header: Text("Equipment Used").foregroundColor(mainColor))
            {
                TextField("  Equipment Used", text: $equipment)
                    .font(.custom("Avenir", size: textFieldFontSize))
                    .padding(.vertical, textFieldVerticalPadding)
                    .padding(.horizontal, textFieldHorizontalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: textFieldCornerRadius)
                            .foregroundColor(textFieldColor))
                    .padding(.bottom, sectionBottomPadding)
            }

            Section(header: Text("Weights Used").foregroundColor(mainColor))
            {
                TextField("  Weights Used", text: $weight)
                    .font(.custom("Avenir", size: textFieldFontSize))
                    .padding(.vertical, textFieldVerticalPadding)
                    .padding(.horizontal, textFieldHorizontalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: textFieldCornerRadius)
                            .foregroundColor(textFieldColor))
                    .padding(.bottom, sectionBottomPadding)
            }

            Button("Add Workout") {
                let newWorkout = Workout(
                    workoutType: workoutType,
                    sets: sets,
                    reps: reps,
                    equipment: equipment,
                    weight: weight
                )
                saveWorkoutDataStore.addWorkout(newWorkout)
            }
            .foregroundColor(.white)
            .padding()
            .background(mainColor)
            .cornerRadius(buttonCornerRadius)
            .padding(buttonPadding)
        }
        .padding(mainPadding)
    }
}

private let textFieldFontSize: CGFloat = 18
private let textFieldVerticalPadding: CGFloat = 8
private let textFieldHorizontalPadding: CGFloat = 6
private let textFieldCornerRadius: CGFloat = 10

private let sectionBottomPadding: CGFloat = 20
private let buttonCornerRadius: CGFloat = 10
private let buttonPadding: CGFloat = 20
private let mainPadding: CGFloat = 20

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView()
    }
}
