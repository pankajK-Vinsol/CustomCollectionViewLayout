import UIKit

class CharactersCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterTitle: UILabel!
    
    func setup(_ character: Characters) {
        characterImage.image = UIImage(named: character.name)
        characterTitle.text = character.title
    }
}
