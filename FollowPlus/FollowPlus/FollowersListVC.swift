//
//  FollowersListVC.swift
//  FollowPlus
//
//  Created by Talish George on 27/11/2023.
//
/*

*/
import UIKit

/// A view controller that displays a list of followers.
class FollowersListVC: UIViewController {
    
    /// The sections in the collection view.
    enum Section {
        case main
    }
    
    /// The username of the user whose followers are being displayed.
    var userName: String = "Talish"
    
    /// The array of followers.
    var followers: [Follower] = []
    
    /// The collection view used to display the followers.
    var collectionView: UICollectionView!
    
    var page = 1
    
    var hasMoreFollowers = true
    
    /// The data source for the collection view.
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViewController()
        configureCollectionView()
        configureDataSource()
        getFollowers(userName: userName, page: page)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /// Configures the view controller.
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /// Configures the collection view.
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    /// Creates a flow layout with three columns.
    /// - Parameter view: The view in which the collection view is displayed.
    /// - Returns: The created flow layout.
    func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        let itemHeight = itemWidth + 40 // Height is width + 40
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        return flowLayout
    }

    /// Retrieves the followers from the network.
    func getFollowers(userName: String, page: Int) {
        
        showLoadingView()
        NetworkManager.shared.getFollower(for: userName, page: page) { [weak self] result in
            
            switch result {
            case let .success(followers):
                if followers.count < 100 {
                    self?.hasMoreFollowers = false
                }
                self?.followers.append(contentsOf: followers)
                self?.updateData()
                self?.dismissLoadingView()
            case let .failure(error):
                print(error)
                self?.presentFPAlertOnMainThread(title: "Parsing Error", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    /// Configures the data source for the collection view.
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    /// Updates the data in the collection view.
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource?.apply(snapshot, animatingDifferences: true)
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150) // Set a constant height
    }
}

extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            
            page += 1
            getFollowers(userName: userName, page: page)
        }
    }
}

#Preview("FollowersListVC") {
    FollowersListVC()
}

