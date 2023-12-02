//
//  FollowersListVC.swift
//  FollowPlus
//
//  Created by Talish George on 27/11/2023.
//

import UIKit

class FollowersListVC: UIViewController /*UICollectionViewDelegateFlowLayout*/ {
    enum Section {
           case main
       }

       var userName: String = "Talish"
       var followers: [Follower] = []
       var collectionView: UICollectionView!
       var dataSource: UICollectionViewDiffableDataSource<Section, Follower>?

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .systemBackground
           configureViewController()
           configureCollectionView()
           configureDataSource()
           getFollowers()
       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(false, animated: true)
       }

       func configureViewController() {
           view.backgroundColor = .systemBackground
           navigationController?.isNavigationBarHidden = false
           navigationController?.navigationBar.prefersLargeTitles = true
       }

       func configureCollectionView() {
           collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout(in: view))
//           collectionView.delegate = self
           view.addSubview(collectionView)
           collectionView.backgroundColor = .systemBackground
           collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
       }

       func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
           let width = view.bounds.width
           let padding: CGFloat = 12
           let minimumItemSpacing: CGFloat = 10
           let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
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
                   self.followers = followers
                   self.updateData()
               case let .failure(error):
                   print(error)
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
           DispatchQueue.main.async {
               self.dataSource?.apply(snapshot, animatingDifferences: true)
           }
       }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
//            return CGSize(width: 100, height: 100)
//        }
//        let insets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
//        let spacing = flowLayout.minimumInteritemSpacing * 2
//        let availableWidth = collectionView.frame.width - insets - spacing
//        let itemWidth = availableWidth / 3
//        return CGSize(width: itemWidth, height: itemWidth + 40)
//    }
}

#Preview("FollowersListVC") {
    FollowersListVC()
}
