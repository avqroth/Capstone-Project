
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
    @State private var notes: String = ""
    @State private var isButtonHighlighted = false
    @State private var isSavingWorkout = false

    @ObservedObject var saveWorkoutDataStore = SaveWorkoutData()

    var body: some View {
        ScrollView {
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

                Section(header: Text("Equipment").foregroundColor(mainColor))
                {
                    TextField("  Equipment", text: $equipment)
                        .font(.custom("Avenir", size: textFieldFontSize))
                        .padding(.vertical, textFieldVerticalPadding)
                        .padding(.horizontal, textFieldHorizontalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                                .foregroundColor(textFieldColor))
                        .padding(.bottom, sectionBottomPadding)
                }

                Section(header: Text("Weights").foregroundColor(mainColor))
                {
                    TextField("  Weights", text: $weight)
                        .font(.custom("Avenir", size: textFieldFontSize))
                        .padding(.vertical, textFieldVerticalPadding)
                        .padding(.horizontal, textFieldHorizontalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                                .foregroundColor(textFieldColor))
                        .padding(.bottom, sectionBottomPadding)
                }

                Section(header: Text("Notes").foregroundColor(mainColor))
                {
                    TextField("  Notes", text: $notes, axis: .vertical)
                        .lineLimit(5...)
                        .font(.custom("Avenir", size: textFieldFontSize))
                        .padding(.vertical, textFieldVerticalPadding)
                        .padding(.horizontal, textFieldHorizontalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                                .foregroundColor(textFieldColor))
                        .padding(.bottom, sectionBottomPadding)
                }
            }

            Button("Add Workout") {
                    let newWorkout = Workout(
                        workoutType: workoutType,
                        sets: sets,
                        reps: reps,
                        equipment: equipment,
                        weight: weight,
                        notes: notes
                    )
                    saveWorkoutDataStore.addWorkout(newWorkout)
                }
            .accessibility(identifier: "Add Workout")
            .onTapGesture {
                withAnimation(Animation.easeInOut(duration: 1).delay(1)) {
                    isButtonHighlighted.toggle()
                }
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
