import pandas as pd

class player:

    def __init__ ( self, lastName, firstName, number, position, dominant, goals, assists):
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
        self.position = position
        self.dominant = dominant
        self.goals = goals
        self.assists = assists

    def printPlayerInfo (self):
        print(f"{self.name}, Number: {self.number}, Position: {self.position}, Dominance {self.dominant}")  
        
        

#example 


playerStats = pd.read_csv("IceJacks2324.csv", header=0)
dfPlayerStats = pd.DataFrame(playerStats)
print(dfPlayerStats)







