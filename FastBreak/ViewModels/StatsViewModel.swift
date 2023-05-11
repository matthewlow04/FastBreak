//
//  StatsViewModel.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-10.
//

import Foundation

class StatsViewModel: ObservableObject{
    @Published var titles =  [String]()
    @Published var titleMessages = [String]()
    
    
    func getTitles(player: Player){
        
        
        if (player.totalPoints>(player.teamPoints/2)){
            var message: String
            titles.append("Scorer")
            message = (player.name!+" is responsible for \(getPercent(player.totalPoints, player.teamPoints))% of their team's points")
            titleMessages.append(message)
        }
        if (player.totalAssists>(player.teamAssists/2)){
            var message: String
            titles.append("Dimer")
            message = (player.name!+" is responsible for \(getPercent(player.totalAssists, player.teamAssists))% of their team's assists")
            titleMessages.append(message)
        }
        if (player.totalRebounds>(player.teamRebounds/2)){
            var message: String
            titles.append("Glass Crasher")
            message = (player.name!+" is responsible for \(getPercent(player.totalRebounds, player.teamRebounds))% of their team's rebounds")
            titleMessages.append(message)
        }
        if (player.totalSteals>(player.teamSteals/2)){
            var message: String
            titles.append("Thief")
            message = (player.name!+" is responsible for \(getPercent(player.totalSteals, player.teamSteals))% of their team's steals")
            titleMessages.append(message)
        }
        if (player.totalBlocks>(player.totalBlocks/2)){
            var message: String
            titles.append("Clamps")
            message = (player.name!+" is responsible for \(getPercent(player.totalBlocks, player.teamBlocks))% of their team's blocks")
            titleMessages.append(message)
        }
        if (player.wins/player.games >= 0.6){
            var message: String
            titles.append("Winner")
            message = (player.name!+" wins \(getPercent(player.wins, player.games))% of their games")
            titleMessages.append(message)
        }
       
    }
    
    private func getPercent(_ numerator: Float, _ denominator: Float) -> Double{
        var percent: Double
        
        percent = (Double(numerator)/Double(denominator))*100
        
        var roundedPercent = (percent*100).rounded()/100
        
        return roundedPercent
    }
    
    func getExperienceTitle(player: Player) -> String{
        if player.games >= 25{
            return "Veteran"
        }
        else if player.games >= 15{
            return "Pro"
        }
        else if player.games >= 10{
            return "Casual"
        }
        else if player.games >= 5{
            return "Amateur"
        }
        else{
            return "Newbie"
        }
    }
}
