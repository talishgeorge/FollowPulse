//
//  SceneDelegate.swift
//  FollowPlus
//
//  Created by Talish George on 24/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    // Cache appearance objects
    let navBarAppearance = createNavBarAppearance()
    let tabBarAppearance = createTabBarAppearance()
    
   
    enum ImageAsset: String {
        case search = "search"
        case favourites = "favourites"
        
        var image: UIImage {
            return UIImage(named: self.rawValue) ?? UIImage()
        }
    }
    
    /// This method is called when a new scene session is being created.
    /// It prepares the user interface and configures the scene-based state of the app.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let searchIcon = ImageAsset.search.image
        let favoritesIcon = ImageAsset.favourites.image

        let searchVC = createNavController(for: SearchVC(), title: "Search", icon: searchIcon, with: navBarAppearance)
        let favoritesVC = createNavController(for: FavoritesListVC(), title: "Favorites", icon: favoritesIcon, with: navBarAppearance)

        let tabBar = UITabBarController()
        tabBar.viewControllers = [searchVC, favoritesVC]
        tabBar.tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 13.0, *) {
            tabBar.tabBar.scrollEdgeAppearance = tabBarAppearance
        }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func createNavController(for rootVC: UIViewController, title: String, icon: UIImage?, with appearance: UINavigationBarAppearance) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.standardAppearance = appearance
        if #available(iOS 13.0, *) {
            navController.navigationBar.scrollEdgeAppearance = appearance
        }
        rootVC.title = title
        navController.tabBarItem = UITabBarItem(title: title, image: icon, tag: 0)
        return navController
    }

    /// Creates and configures a UINavigationBarAppearance object.
    static func createNavBarAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray
        return appearance
    }

    /// Creates and configures a UITabBarAppearance object.
    static func createTabBarAppearance() -> UITabBarAppearance {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemGray
        return tabBarAppearance
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
