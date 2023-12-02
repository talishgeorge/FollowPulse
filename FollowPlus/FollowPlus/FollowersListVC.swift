//
//  FollowersListVC.swift
//  FollowPlus
//
//  Created by Talish George on 27/11/2023.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {
        case main
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var userName: String = "Talish"
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureViewController()
        configureCollectionView()
        configureDataSource()
        getFollowers()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        configureCollectionView()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

//    func configureCollectionView() {
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
//        view.addSubview(collectionView)
//        collectionView.backgroundColor = .systemBackground
//        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
//    }
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.collectionViewLayout = createThreeColumnFlowLayout(in: collectionView)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
//    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
//        let width = view.bounds.width
//        let padding: CGFloat = 12
//        let minumumItemSpacing: CGFloat = 10
//        let availableWidth = width - (padding * 2) - (minumumItemSpacing * 2)
//        let itemWidth = availableWidth / 3
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
//        return flowLayout
//    }
    func createThreeColumnFlowLayout(in: UICollectionView) -> UICollectionViewFlowLayout {
        let width = collectionView.bounds.width
          let padding: CGFloat = 12
          let minumumItemSpacing: CGFloat = 10
          let availableWidth = width - (padding * 2) - (minumumItemSpacing * 2)
          let itemWidth = availableWidth / 3
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
          flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
          return flowLayout
    }
    func getFollowers() {
        NetworkManager.shared.getFollower(for: userName, page: 1) { result in

            switch result {
            case let .success(followers):
                print("Followers count = \(followers.count)")
               print(followers)
                self.followers = followers
                self.updateData()
            case let .failure(eror):
                print(eror)
            }
        }
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async{
            self.dataSource?.apply(snapshot, animatingDifferences: true)
        }
    }
}

#Preview("FollowersListVC") {
    FollowersListVC()
}
