package com.example.requestlocationapp

import android.app.AlertDialog
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    val reqFineLocation = 101 // request codes for location.
    val reqCamera = 102 // request codes for camera.

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        buttonTaps()
    }

    private fun buttonTaps() { //button listeners, follows to checkPermission functions.
        button1.setOnClickListener {
            checkForPermission(android.Manifest.permission.ACCESS_FINE_LOCATION, "location", reqFineLocation)
        }

        button2.setOnClickListener {
            checkForPermission(android.Manifest.permission.CAMERA, "camera", reqCamera)
        }
    }

    private fun checkForPermission(permission: String, name: String, requestCode: Int) { //params are type of permission, name of hardware, and request code.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            when {
                ContextCompat.checkSelfPermission(applicationContext, permission) == PackageManager.PERMISSION_GRANTED -> {
                    Toast.makeText(applicationContext, "$name permission granted", Toast.LENGTH_SHORT).show()
                }
                //permission to explain why they need it, when users rejected it first time.
                shouldShowRequestPermissionRationale(permission) -> showDialog(permission, name, requestCode)

                // check if permission hasn't been granted, simply ask again for permission
                else -> ActivityCompat.requestPermissions(this, arrayOf(permission), requestCode)
            }
        }
    }

    override fun onRequestPermissionsResult( // tell whether user accepted or refuse the permission...
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        fun innerCheck(name: String) {
            if (grantResults.isEmpty() || grantResults[0] != PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(applicationContext, "$name permission refused", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(applicationContext, "$name permission granted", Toast.LENGTH_SHORT).show()
            }
        }

        when (requestCode) {// matches request code checks with type of hardware using innerCheck()
            reqFineLocation -> innerCheck("location")
            reqCamera -> innerCheck("camera")
        }
    }

    private fun showDialog(permission: String, name: String, requestCode: Int) {
        val builder = AlertDialog.Builder(this)

        builder.apply {
            setMessage ("Permission to access your $name is required to use this app")
            setTitle("Permission required")
            setPositiveButton("OK") { dialog, which ->
                ActivityCompat.requestPermissions(this@MainActivity, arrayOf(permission), requestCode)
            }
        }
        // dialog to show...
        val dialog = builder.create()
        dialog.show()
    }
}
