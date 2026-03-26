import SwiftUI

struct ContentView: View {
    var gameElements = ["rock", "scissors", "paper"]
    @State private var choiceOfApp = ""
    @State private var choiceOfUser = ""
    @State private var stateOfGameGoal = Bool.random()
    
    //alert
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var isGameOver = false
    
    //points' and games' counter
    @State private var counter: Int = 0
    @State private var games: Int = 0
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.brown)
                    .opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack {
                        Text(gameGoal())
                            .font(Font.headline.bold())
                        Text(String(counter))
                            .font(Font.headline.bold())
                    }
                    
                    VStack {
                        Spacer()
                        Text("The computer chose:")
                        Text(choiceOfApp)
                            .font(Font.largeTitle.bold())
                        Spacer()
                    }
                    .onAppear {
                        chooseRandomElement()
                    }
                    HStack {
                        buttonsStyle
                    }
                    
                }
            }
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue") {
                    if games == 10 {
                        isGameOver.toggle()
                        return
                        
                    }
                    chooseRandomElement()
                    stateOfGameGoal = Bool.random()
                    choiceOfUser = ""
                }
            }
            .alert("Game Over", isPresented: $isGameOver) {
                Button("Start a new game") {
                    chooseRandomElement()
                    stateOfGameGoal = Bool.random()
                    choiceOfUser = ""
                    counter = 0
                    games = 0
                }
            } message: {
                Text("Your score is \(counter) points")
            }
        }
    }
    
    
    func gameGoal() -> String {
        stateOfGameGoal ? "You should Win" : "You should Lose"
    }
    func chooseRandomElement() {
        choiceOfApp = gameElements.randomElement() ?? "Error"
    }
    func incrementCounter() {
        counter += 1
    }
    func winningLogic() {
        if choiceOfUser == choiceOfApp {
            scoreTitle = "It's a draw!"
        } else if (choiceOfUser == "rock" && choiceOfApp == "scissors") ||
                    (choiceOfUser == "scissors" && choiceOfApp == "paper") ||
                    (choiceOfUser == "paper" && choiceOfApp == "rock") {
            
            scoreTitle = "You won!"
            counter += 1
        } else {
            scoreTitle = "You lost!"
            if counter > 0 { counter -= 1 }
        }
        games += 1
        showingScore = true
    }
    func losingLogic() {
        if choiceOfUser == choiceOfApp {
            scoreTitle = "It's a draw!"
        } else if (choiceOfApp == "rock" && choiceOfUser == "scissors") ||
                    (choiceOfApp == "scissors" && choiceOfUser == "paper") ||
                    (choiceOfApp == "paper" && choiceOfUser == "rock") {
            
            scoreTitle = "You won!"
            counter += 1
        } else {
            scoreTitle = "You lost!"
            if counter > 0 { counter -= 1 }
        }
        games += 1
        showingScore = true
    }
    
    var buttonsStyle: some View {
        ForEach(gameElements, id: \.self) { element in
            Button {
                choiceOfUser = element
                stateOfGameGoal ? winningLogic() : losingLogic()
            } label: {
                Text(element)
                    .frame(width: 100, height: 100)
                    .background(.black.gradient)
                    .opacity(0.6)
                    .clipShape(.circle)
                    .padding(10)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
