package com.example.guruapplogin

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val button: Button = findViewById(R.id.button)
        var username: EditText = findViewById(R.id.editTextUsername)
        var password: EditText = findViewById(R.id.editTextPassword)

        button.setOnClickListener { // when button is clicked

            checkDataEntered(username, password)

        }
    }
    private fun checkDataEntered(a: EditText, b: EditText) {
        /*
        Reads whatever name the user inputs at the username, and password
        // assuming user has signed in beforehand.
        // if username matches credentials + password is correct,
        // welcomes user to a new page, that says "Hello, [username]"
        // if not, Toast em!

        Future implementations:
        - Data for username and password.
        - Registration page.
        - Checking password etc.
        - Actually making it work.
         */

        if (a === null || b === null) { // username is gone, password is gone. DOESN'T WORK YET ;-;
            Toast.makeText(this, "Incomplete information!", Toast.LENGTH_SHORT).show()
        }
        else { // task complete.
            var usernameVal = a.getText().toString() //gets text and converts to string.
            Toast.makeText(this, "Welcome, $usernameVal!", Toast.LENGTH_SHORT).show()
        }

    }

}