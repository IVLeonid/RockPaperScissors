import SwiftUI

struct ContentView: View {
    var gameElements = ["rock", "scissors", "paper"]
    @State var chooseOfApp = ""
    @State var chooseOfUser = ""
    
    //alerts
    @State var win = false
    @State var lose = false
    @State var draw = false
    
    //points' and games' counter
    @State var counter: Int = 0
    @State var games: Int = 0
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    VStack {
                        //hint from app
                        //some spacer()?
                        //choice from app
                    }
                    
                    VStack {
                        //choice from app (image or icon)
                        //choice from user
                    }
                    
                    VStack {
                        HStack {
                            //buttoms with choicing from user
                            
                        }
                    }
                }
                //notification of loss or win on all screen
            }
            
        }
    }
    
    func chooseRandomElement() {
        chooseOfApp = gameElements.randomElement() ?? "rock"
    }
    func incrementCounter() {
        counter += 1
    }
    func winningLogic() {
        if chooseOfUser == chooseOfApp {
            draw = true
        } else if chooseOfUser == "rock" && chooseOfApp == "scissors" {
            win = true
        } else if chooseOfUser == "scissors" && chooseOfApp == "paper" {
            win = true
        } else if chooseOfUser == "paper" && chooseOfApp == "rock" {
            win = true
        } else {
            lose = true
        }
    }
    func losingLogic() {
        if chooseOfUser == chooseOfApp {
            draw = true
        } else if chooseOfApp == "rock" && chooseOfUser == "scissors" {
            win = true
        } else if chooseOfApp == "scissors" && chooseOfUser == "paper" {
            win = true
        } else if chooseOfApp == "paper" && chooseOfUser == "rock" {
            win = true
        } else {
            lose = true
        }
    }
    
}

#Preview {
    ContentView()
}
