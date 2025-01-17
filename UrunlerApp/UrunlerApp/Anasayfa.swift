//
//  ViewController.swift
//  UrunlerApp
//
//  Created by İzem Özer on 8.10.2024.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var urunlerTableView: UITableView!
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 40000)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 4500)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 2000)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 4500)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 3200)
        let u6 = Urunler(id: 6 , ad: "Dyson V8", resim: "supurge", fiyat: 25000)
        let u7 = Urunler(id: 7, ad: "IPhone 13", resim: "telefon", fiyat: 45000)
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}
extension Anasayfa : UITableViewDelegate, UITableViewDataSource, HucreProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.urunAd.text = urun.ad
        hucre.urunFiyat.text = "\(urun.fiyat!) ₺"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius = 10.0
        
        hucre.selectionStyle = .none
        
        hucre.hucreProtokol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            print("\(urun.ad!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") { contextualAction, view, bool in
            print("\(urun.ad!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            contexualAction,view,bool in
            print("\(urun.ad!) silindi")
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            contexualAction,view,bool in
            print("\(urun.ad!) düzenlendi")
        }
        return  UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let urun = sender as? Urunler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
            }
        }
    }
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete eklendi")
    }
}
