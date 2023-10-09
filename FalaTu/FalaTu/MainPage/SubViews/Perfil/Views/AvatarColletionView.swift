import UIKit

class AvatarColletionView: UIView {
    
    private let size = UIScreen.main.bounds.size

    weak var delegatePopUp: DelegateUserPreferences?
    
    private var listaImages: [AvatarModelData] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: size.width / 5, height: size.width / 5)
    
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.delegate = self
        colletion.dataSource = self
        colletion.register(SelectAvatarCollectionViewCell.self, forCellWithReuseIdentifier: SelectAvatarCollectionViewCell.identifier)
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.backgroundColor = UIColor(named: "backgroundColor")
        
        return colletion
    }()
    
    private lazy var imageBlock: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "block")!
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewModel()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension AvatarColletionView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaImages.count*2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectAvatarCollectionViewCell.identifier, for: indexPath) as? SelectAvatarCollectionViewCell else
        {
            fatalError("error in AvatarColletionView")
        }
        
        if indexPath.row < listaImages.count{
            let image = listaImages[indexPath.row].image
            cell.imageView.image = image
        }else{
            let image = imageBlock.image
            cell.imageView.image = image
        }
        

        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < listaImages.count{
            self.delegatePopUp?.presentPopUP(index: indexPath)
        }else{
            print("person invalid")
        }
        
    }
}


extension AvatarColletionView: ViewModel{
    func addViews() {
        addSubviewsEx(collectionView)
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
        
    }
}


extension AvatarColletionView{
    public func configure( data: [AvatarModelData]){
        self.listaImages = data
    }
}


extension AvatarColletionView{
    private func contrainsiPhone(){
        print("Contrins para iphones ativas ")
        NSLayoutConstraint.activate([
            
            imageBlock.heightAnchor.constraint(equalToConstant: 20),
            imageBlock.widthAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    
    private func contrainsiPad(){
        print("Contrins para iPads ativas")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: size.width / 6, height: size.width / 6)
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

