# CoordinatorPattern

Coordinator 가  등장한 이유와 무엇을 해결 하려 하였으며, 적용 후 어떤 부분이 개선 되었는지를 같은 기능을 Coordinator 적용 유/무 두 가지로 구현하여 확인해 보도록하겠습니다. 


### NoCoordinator

아래와 같이 Coordinator 없이 구현할 경우 UINavigationController 에 이동 대상 ViewController (DetailViewController) 를 등록해 주어야 하기 때문에 ViewController 간의 의존성이 생기게 됩니다. 

<br>

또한 각각의 First, Second ViewController 에서 DetailViewController 로 직접적으로 화면 전환을 시켜주기에 진입점의 관리가 각각의 ViewController 에서 이루어지게 됩니다. 

```swift
// in 진입점 ViewController...

class NoCoordinatorFirstVC: UIViewController{
	...

    override func viewDidLoad() {
        super.viewDidLoad()
        confifureUI()
    }
    
    func confifureUI() {
		...
		
		button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        // MARK: setup page router
        let detailViewController = DetailViewController()
        // MARK: push to page
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

```

```swift
// in 진입점 ViewController...

class NoCoordinatorSecondVC: UIViewController{
	...

    override func viewDidLoad() {
        super.viewDidLoad()
        confifureUI()
    }
    
    func confifureUI() {
		...
		
		button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        // MARK: setup page router
        let detailViewController = DetailViewController()
        // MARK: push to page
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

```



### Apply Coordinator

Coordinator 는 일반적으로 protocol 로 구현하며 **start** method 를 가지고 있습니다.

<br>

start() 에서는 Coordinator 가 화면 전환을 역할 해주기에 전환될 대상 ViewController 에 대한 초기화, 나아가 MVVM 패턴에서는 ViewModel 에 대한 초기화 설정 등의 화면 전환 이전 시점에서 실행한 로직에 필요한 기능을 수행합니다. 

```swift
protocol Coordinator {
    func start()
}
```


진입점이 존재하는 Coordinator 에서는 화면 전환이 이루어져야 되기 때문에 rootViewController 를 UINavigationController 로 사용하며, 초기 viewController 를 등록해 줍니다. 

```swift
class FirstCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    lazy var firstViewController = FirstViewController()
    
    func start() {
        self.rootViewController = UINavigationController(rootViewController: self.firstViewController)
    }
}

...SecondCoordinator 동일

```


Coordinator 를 통하여 아래와 같이 구현하게 되면, 화면 전환 로직에 대한 처리를 Coordinator 에게 넘기게 됨으로써,

1. DetailViewController 즉 전환 대상 ViewController 에 대한 의존성이 끊어지게 됩니다.
2. 진입점에 대한 화면 전환 로직 관리를 Coordinator 에서만 가능함으로써 ViewController 가 UI 에만 집중 할 수 있게 됩니다.

```swift
// in 진입점 ViewController...

class FirstViewController: UIViewController{
	lazy var coordinator = DetailCoordinator()
	
	...

    override func viewDidLoad() {
        super.viewDidLoad()
        confifureUI()
    }
    
    func confifureUI() {
		...
		
		button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        if let nvc: UINavigationController = self.navigationController {
            coordinator.pushToDetail(navigationController: nvc)
        } else { return }
    }
}

```
