package com.example.guruapplogin

import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val button: Button = findViewById(R.id.button)
        button.setOnClickListener { // when button is clicked
            Toast.makeText(this, "TEST", Toast.LENGTH_SHORT).show()
        }
    }

    private fun readName() {
        // reads whatever name the user inputs at the username, and password
        // assuming user has signed in beforehand.
        // if username matches credentials + password is correct,
        // welcomes user to a new page, that says "Hello, [username]"
        // if not, Toast em!
    }
}