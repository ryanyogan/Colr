class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # Declare our window object, use the full scren
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # Controller initializations
    @search_controller = SearchController.alloc.initWithNibName(nil, bundle: nil)
    @navigation_controller = UINavigationController.alloc.initWithRootViewController @search_controller

    # Set the window root view to the navigation controller
    @window.rootViewController = @navigation_controller
    @window.makeKeyAndVisible

    true
  end
end
