import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let mathChannel = FlutterMethodChannel(name: "com.example.math", binaryMessenger: controller.binaryMessenger)

    mathChannel.setMethodCallHandler { call, result in
      guard let args = call.arguments as? [String: Any],
            let a = args["a"] as? Double,
            let b = args["b"] as? Double else {
        result(FlutterError(code: "BAD_ARGS", message: "Invalid arguments", details: nil))
        return
      }

      switch call.method {
        case "sum":
          result(a + b)
        case "subtract":
          result(a - b)
        case "multiply":
          result(a * b)
        case "divide":
          if b == 0 {
            result(FlutterError(code: "DIV_BY_ZERO", message: "Cannot divide by zero", details: nil))
          } else {
            result(a / b)
          }
        default:
          result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
