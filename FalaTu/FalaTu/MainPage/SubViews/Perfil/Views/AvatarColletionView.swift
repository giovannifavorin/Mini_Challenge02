import UIKit

class AvatarColletionView: UIView {
    
    private let size = UIScreen.main.bounds.size

    weak var delegatePopUp: DelegateUserPreferences?
    
    private var listaImages: [AvatarModelData] = []
//    private var avatarModel: [AvatarModelData]?
    
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
        return listaImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectAvatarCollectionViewCell.identifier, for: indexPath) as? SelectAvatarCollectionViewCell else
        {
            fatalError("error in AvatarColletionView")
        }
        
        let image = listaImages[indexPath.row].image
        
        cell.imageView.image = image
    
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegatePopUp?.presentPopUP(index: indexPath)
    }
}


extension AvatarColletionView: ViewModel{
    func addViews() {
        addSubviewsEx(collectionView)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setupStyle() {
        
    }
}

extension AvatarColletionView{
    public func configure( data: [AvatarModelData]){
        self.listaImages = data
    }
}
