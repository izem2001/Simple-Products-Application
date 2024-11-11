//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by İzem Özer on 8.10.2024.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTiklandi(indexPath:IndexPath)
}

class UrunlerHucre: UITableViewCell {
    @IBOutlet weak var urunFiyat: UILabel!
    @IBOutlet weak var urunAd: UILabel!
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    var hucreProtokol:HucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func butonSepeteEkle(_ sender: Any) {
        hucreProtokol?.sepeteEkleTiklandi(indexPath: indexPath!)
        
    }
}
