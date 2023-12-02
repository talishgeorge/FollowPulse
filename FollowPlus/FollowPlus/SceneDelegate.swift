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
    /**
     An enumeration representing different image assets.

     Each case represents a specific image asset and provides a computed property to get the corresponding UIImage instance.

     - Case `search`: Represents the search image asset.
     - Case `favourites`: Represents the favourites image asset.
     - Case `selectedFavourites`: Represents the selected favourites image asset.
     - Case `selectedSearch`: Represents the selected search image asset.

     The computed property `image` returns the UIImage instance for each case. The image is loaded from the asset catalog and its rendering mode is set to alwaysOriginal to ensure it appears as designed, regardless of the tint color of the tab bar.
     */
    enum ImageAsset: String {
        // Define cases for each image asset
        case search
        case favourites
        case selectedFavourites
        case selectedSearch

        // Computed property to get the UIImage instance for each case
        var image: UIImage {
            // Load the image from the asset catalog and set its rendering mode to alwaysOriginal
            // This ensures the image appears as you've designed it, regardless of the tint color of the tab bar
            return (UIImage(named: rawValue) ?? UIImage()).withRenderingMode(.alwaysOriginal)
        }
    }

    /// This method is called when a new scene session is being created.
    /// It prepares the user interface and configures the scene-based state of the app.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupTabBarController()
        window?.makeKeyAndVisible()
    }

    /**
     Creates and returns a UITabBarController with two view controllers: SearchVC and FavoritesListVC.
     
     - Returns: A UITabBarController instance.
     */
    func setupTabBarController() -> UITabBarController {
        // Get the images for the tab bar items
        let search = ImageAsset.search.image
        let searchSelectedIcon = ImageAsset.selectedSearch.image
        let favorites = ImageAsset.favourites.image
        let favoritesSelectedIcon = ImageAsset.selectedFavourites.image
        let defaultAppearance = UINavigationBarAppearance()
        let searchVC = createNavController(for: SearchVC(), title: "Search", icon: search, selectedIcon: searchSelectedIcon, with: navBarAppearance ?? defaultAppearance, tag: 0)
        let favoritesVC = createNavController(for: FavoritesListVC(), title: "Favorites", icon: favorites, selectedIcon: favoritesSelectedIcon, with: navBarAppearance ?? defaultAppearance, tag: 1)

        // Create the tab bar controller and set its view controllers
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [searchVC, favoritesVC]
        // Set the appearance of the tab bar
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        // For iOS 13 and above, also set the scroll edge appearance of the tab barni
        if #available(iOS 13.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        }

        return tabBarController
    }
    
    /**
     Creates a navigation controller with the specified root view controller, appearance, and tab bar item properties.

     - Parameters:
        - rootVC: The root view controller for the navigation controller.
        - title: The title for the root view controller and tab bar item.
        - icon: The image for the tab bar item.
        - selectedIcon: The selected image for the tab bar item.
        - appearance: The appearance of the navigation bar.
        - tag: The tag value for the tab bar item.

     - Returns: A newly created navigation controller.
     */
    func createNavController(for rootVC: UIViewController, title: String, icon: UIImage?, selectedIcon: UIImage?, with appearance: UINavigationBarAppearance, tag: Int) -> UINavigationController {
        // Create a navigation controller with the specified root view controller
        let navController = UINavigationController(rootViewController: rootVC)
        // Set the appearance of the navigation bar
        navController.navigationBar.standardAppearance = appearance
        // For iOS 13 and above, also set the scroll edge appearance of the navigation bar
        if #available(iOS 13.0, *) {
            navController.navigationBar.scrollEdgeAppearance = appearance
        }
        // Set the title and tab bar item of the root view controller
        rootVC.title = title
        let tabBarItem = UITabBarItem(title: title, image: icon, tag: tag)
        tabBarItem.selectedImage = selectedIcon
        navController.tabBarItem = tabBarItem
        return navController
    }
    
    /// Creates a customized navigation bar appearance.
    /// - Returns: The customized UINavigationBarAppearance object.
    static func createNavBarAppearance() -> UINavigationBarAppearance? {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray6
        UINavigationBar.appearance().tintColor = .systemGreen
        return appearance
    }

    /// Creates a customized appearance for the tab bar.
    /// - Returns: A `UITabBarAppearance` object with the customized appearance.
    static func createTabBarAppearance() -> UITabBarAppearance {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemGray6
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

