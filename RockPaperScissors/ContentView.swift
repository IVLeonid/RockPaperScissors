import SwiftUI

struct ContentView: View {
    var gameElements = ["rock", "scissors", "paper"]
    @State private var chooseOfApp = ""
    @State private var chooseOfUser = ""
    @State private var stateOfGameGoal = Bool.random()
    
    //alert
    @State private var scoreTitle = ""
    @State private var showingScore = false
    
    //points' and games' counter
    @State private var counter: Int = 0
    @State private var games: Int = 0
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    VStack {
                        Text(gameGoal())
                    }
                    
                    VStack {
                        Spacer()
                        Text(chooseOfApp)
                        Text(chooseOfUser)
                        Spacer()
                    }
                    .onAppear {
                        chooseRandomElement()
                    }
                    
                    VStack {
                        HStack {
                            buttonsStyle
                            
                        }
                    }
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue") {
                    chooseRandomElement()
                    stateOfGameGoal.toggle()
                    chooseOfUser = ""
                }
            }
        }
    }
    
    
    func gameGoal() -> String {
        stateOfGameGoal ? "You can Win" : "You can Lose"
    }
    func chooseRandomElement() {
        chooseOfApp = gameElements.randomElement() ?? "rock"
    }
    func incrementCounter() {
        counter += 1
    }
    func winningLogic() {
        if chooseOfUser == chooseOfApp {
            scoreTitle = "It's a draw!"
            showingScore = true
        } else if chooseOfUser == "rock" && chooseOfApp == "scissors" {
            scoreTitle = "You won!"
            showingScore = true
        } else if chooseOfUser == "scissors" && chooseOfApp == "paper" {
            scoreTitle = "You won!"
            showingScore = true
        } else if chooseOfUser == "paper" && chooseOfApp == "rock" {
            scoreTitle = "You won!"
            showingScore = true
        } else {
            scoreTitle = "You lost!"
            showingScore = true
        }
    }
    func losingLogic() {
        if chooseOfUser == chooseOfApp {
            scoreTitle = "It's a draw!"
            showingScore = true
        } else if chooseOfApp == "rock" && chooseOfUser == "scissors" {
            scoreTitle = "You won!"
            showingScore = true
        } else if chooseOfApp == "scissors" && chooseOfUser == "paper" {
            scoreTitle = "You won!"
            showingScore = true
        } else if chooseOfApp == "paper" && chooseOfUser == "rock" {
            scoreTitle = "You won!"
            showingScore = true
        } else {
            scoreTitle = "You lost!"
            showingScore = true
        }
    }
    
    var buttonsStyle: some View {
        ForEach(gameElements, id: \.self) { element in
            Button {
                chooseOfUser = element
                stateOfGameGoal ? winningLogic() : losingLogic()
            } label: {
                Text(element)
                    .padding(30)
                    .background(.black.gradient)
                    .opacity(0.8)
                    .clipShape(.circle)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
