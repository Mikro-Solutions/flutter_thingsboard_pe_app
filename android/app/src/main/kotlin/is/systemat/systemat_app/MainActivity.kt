package `is`.systemat.systemat_app

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        registerTbWebAuth(flutterEngine)
    }

    fun registerTbWebAuth(flutterEngine: FlutterEngine) {
        val channel = MethodChannel(flutterEngine.dartExecutor, "tb_web_auth")
        channel.setMethodCallHandler(TbWebAuthHandler(this))
    }

}
