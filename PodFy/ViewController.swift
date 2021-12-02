//
//  ViewController.swift
//  PodFy
//
//  Created by Rodrigo Rodrigues on 24/11/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var musics: [Music] = []
    private var player = AVAudioPlayer()
    
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var tbListMusics: UITableView!
    
    //-----------------------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMusic()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //-----------------------------------------------------------------------------------
    //  MARK: - UITableView
    //-----------------------------------------------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellMusic = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        cellMusic.textLabel?.text = musics[indexPath.row].title
        cellMusic.textLabel?.textColor = UIColor(red: 0.99, green: 0.80, blue: 0.00, alpha: 1.00)
        return cellMusic
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        do {
            player = try AVAudioPlayer (contentsOf: musics[indexPath.row].url)
            player.prepareToPlay()
            tableView.deselectRow(at: indexPath, animated: true)
        } catch {
        }
    }
    
    //-----------------------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------------------
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    
    @IBAction func upDateVolume(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    private func loadMusic() {
        musics = Mock().loadMusic()
        self.tbListMusics.reloadData()
    }
}
