package com.example.cameraapp2

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.os.Bundle
import android.provider.MediaStore
import android.widget.Button
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat

class MainActivity : AppCompatActivity() {


    /*
    Camera App2 (camera app 1 failed miserably)
    A simple camera app that takes pictures and
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val button: Button = findViewById(R.id.button)

        button.isEnabled = false

        //check permission whenever you want to use the camera
        if(ActivityCompat.checkSelfPermission(this,Manifest.permission.CAMERA)!= PackageManager.PERMISSION_GRANTED) {//if not permission granted...
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA), 111)
        }
        else{ // permission granted.
            button.isEnabled = true

            button.setOnClickListener{//capture using camera!
                var i = Intent(MediaStore.ACTION_IMAGE_CAPTURE)//stores the media
                startActivityForResult(i, 101)//start activity (sends code & intent i)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {//override fun to access the image.
        super.onActivityResult(requestCode, resultCode, data)
        if(requestCode == 101)//if code matches,
        {
            val imageView: ImageView = findViewById(R.id.imageView) //gets imageView id
            var pic = data?.getParcelableExtra<Bitmap>("data")//declare variable, data will return whatever image is captured. Returns value of Bitmap.
            imageView.setImageBitmap(pic)
        }
    }
    override fun onRequestPermissionsResult(
            requestCode: Int,
            permissions: Array<out String>,
            grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if(requestCode == 111 && grantResults[0] == PackageManager.PERMISSION_GRANTED)
        {
            val button: Button = findViewById(R.id.button)
            button.isEnabled = true
        }
    }
}