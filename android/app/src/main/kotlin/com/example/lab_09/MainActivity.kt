package com.example.native_calculator

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "calculator_channel"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "calculate") {
                val operation = call.argument<String>("operation")
                val a = call.argument<Double>("a") ?: 0.0
                val b = call.argument<Double>("b") ?: 0.0
                val res = when (operation) {
                    "sum" -> a + b
                    "subtract" -> a - b
                    "multiply" -> a * b
                    "divide" -> if (b != 0.0) a / b else Double.NaN
                    else -> null
                }

                if (res != null) {
                    result.success(res)
                } else {
                    result.error("INVALID_OPERATION", "Operación no válida", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
