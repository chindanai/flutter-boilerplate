package com.company.app

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import io.flutter.embedding.android.FlutterFragmentActivity
import android.widget.Toast;

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.nativeActivity/androidChannel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
    }
}