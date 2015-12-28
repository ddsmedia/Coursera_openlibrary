//
//  ViewController.swift
//  Reproductor5songs
//
//  Created by ANGEL GABRIEL RAMIREZ ALVA on 27/12/15.
//  Copyright © 2015 DDS.media. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var reproductor: AVAudioPlayer!
    private var reproductor2: AVAudioPlayer!
    private var reproductor3: AVAudioPlayer!
    private var reproductor4: AVAudioPlayer!
    private var reproductor5: AVAudioPlayer!
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var image4: UIImage!
    var image5: UIImage!
    
    var id: Int = 0
    var volume: Float = 0.1
    
    @IBOutlet var titulo: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sonido1URL = NSBundle.mainBundle().URLForResource("Stay Rihanna", withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonido1URL!)
        }catch{
            print("Error al cargar el archivo de sonido Rihanna")
        }
        
        let sonido2URL = NSBundle.mainBundle().URLForResource("Blur - Song 2", withExtension: "mp3")
        do{
            try reproductor2 = AVAudioPlayer(contentsOfURL: sonido2URL!)
        }catch{
            print("Error al cargar el archivo de sonido Song2")
        }
        
        let sonido3URL = NSBundle.mainBundle().URLForResource("Creep Radiohead", withExtension: "mp3")
        do{
            try reproductor3 = AVAudioPlayer(contentsOfURL: sonido3URL!)
        }catch{
            print("Error al cargar el archivo de sonido Creep")
        }
        
        let sonido4URL = NSBundle.mainBundle().URLForResource("Coldplay The Scientist", withExtension: "mp3")
        do{
            try reproductor4 = AVAudioPlayer(contentsOfURL: sonido4URL!)
        }catch{
            print("Error al cargar el archivo de sonido Coldplay")
        }
        
        let sonido5URL = NSBundle.mainBundle().URLForResource("In The End Linkin Park", withExtension: "mp3")
        do{
            try reproductor5 = AVAudioPlayer(contentsOfURL: sonido5URL!)
        }catch{
            print("Error al cargar el archivo de sonido Linking Park")
        }
        
        
        //image1 = UIImage(named: "rihanna")!
        
    }


   
    @IBOutlet var portada: UIImageView!
    
    func imprime(){
        print("id: \(id)")
        print("   volumen: \(reproductor5.volume)")
    }
    
    @IBAction func song1() {
        detener()
        id = 1
        tocar()
        loadItem("Stay Rihanna", imagen: "rihanna.jpg")
        imprime()
    }

    @IBAction func song2() {
        detener()
        id = 2
        tocar()
        loadItem("Song2 Blur", imagen: "song2.jpg")
        imprime()
    }
    
    @IBAction func song3() {
        detener()
        id = 3
        tocar()
        loadItem("Creep Radiohead", imagen: "radiohead.jpg")
        imprime()
    }
    
    @IBAction func song4() {
        detener()
        id = 4
        tocar()
        loadItem("Scientist Coldplay", imagen: "coldplay.jpg")
        imprime()
    }
    
    
    @IBAction func song5() {
        detener()
        id = 5
        tocar()
        loadItem("In The End Linkin Park", imagen: "linkin-park.jpg")
        imprime()
    }
    
  
    
    @IBAction func tocar() {
        imprime()
        switch id{
        case 1:
            reproductor.play()
        case 2:
            reproductor2.play()
        case 3:
            reproductor3.play()
        case 4:
            reproductor4.play()
        case 5:
            reproductor5.play()
        default:
            print("Número no encontrado en switch: \(id)")
        }

    }
    
    @IBAction func pausar() {
        imprime()
        switch id{
        case 1:
            reproductor.pause()
        case 2:
            reproductor2.pause()
        case 3:
            reproductor3.pause()
        case 4:
            reproductor4.pause()
        case 5:
            reproductor5.pause()
        default:
            print("Número no encontrado en switch: \(id)")
        }
    }
    
    
    @IBAction func detener() {
        imprime()
        switch id{
        case 1:
            reproductor.stop()
            reproductor.currentTime = 0.0
        case 2:
            reproductor2.stop()
            reproductor2.currentTime = 0.0
        case 3:
            reproductor3.stop()
            reproductor3.currentTime = 0.0
        case 4:
            reproductor4.stop()
            reproductor4.currentTime = 0.0
        case 5:
            reproductor5.stop()
            reproductor5.currentTime = 0.0
        default:
            print("Número no encontrado en switch: \(id)")
        }

    }
    
  
    @IBOutlet weak var sliderval: UISlider!
    
    @IBAction func slidermov(sender: UISlider) {
        
        switch id{
        case 1:
            reproductor.volume = sliderval.value
            print(reproductor.volume)
        case 2:
            reproductor2.volume = sliderval.value
            print(reproductor2.volume)
        case 3:
            reproductor3.volume = sliderval.value
            print(reproductor3.volume)
        case 4:
            reproductor4.volume = sliderval.value
            print(reproductor4.volume)
        case 5:
            reproductor5.volume = sliderval.value
            print(reproductor5.volume)
        default:
            print("Número no encontrado en switch: \(id)")
        }

    }
    
    
    @IBAction func ranma() {
        let i = Int(arc4random_uniform(5) + 1)
        print("random: \(i)")
        switch i{
        case 1:
            song1()
        case 2:
            song2()
        case 3:
            song3()
        case 4:
            song4()
        case 5:
            song5()
        default:
            print("sin opción")
        }
    }
 
    
    
    func loadItem(title: String, imagen: String!) {
        titulo.text = title
        //pageBook.text = page
        portada.image = UIImage(named: imagen)
    }
    
}

