import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = HomeViewModel()
        let homeViewController = HomeViewController()
        homeViewController.viewModel = viewModel
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()

        return true
    }

}
