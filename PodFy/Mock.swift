//
//  Mock.swift
//  PodFy
//
//  Created by Rodrigo Rodrigues on 24/11/21.
//

import UIKit

final class Mock {
    
    func loadMusic() -> [Music] {
        
        let song01 = URL(fileURLWithPath: Bundle.main.path(forResource: "song_01", ofType: "mp3")!)
        let song02 = URL(fileURLWithPath: Bundle.main.path(forResource: "song_02", ofType: "mp3")!)
        let song03 = URL(fileURLWithPath: Bundle.main.path(forResource: "song_03", ofType: "mp3")!)
        
        let capitalCities = Music(title: "Capital Cities - Safe And Sound", url: song01)
        let hozier = Music(title: "Hozier - Take Me To Church",url: song02)
        let wizKhalifa = Music(title: "Wiz Khalifa - See You Again ft. Charlie Puth", url: song03)
        
        return [capitalCities, hozier, wizKhalifa]
    }
}
