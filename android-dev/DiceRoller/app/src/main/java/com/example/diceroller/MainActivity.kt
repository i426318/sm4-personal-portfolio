package com.example.diceroller

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val rollButton: Button = findViewById(R.id.button)
        rollButton.setOnClickListener {//if button is clicked, toggle:
            //results of the dice.
            rollDice()
        }
    }

    private fun rollDice() {//rolls the dice.
        val dice = Dice(6)
        val diceRoll = dice.roll()
        val resultTextView: TextView = findViewById(R.id.textView)
        resultTextView.text = diceRoll.toString()

        Toast.makeText(this, "Dice Rolled!", Toast.LENGTH_SHORT).show()
    }
}

class Dice(val numSides: Int) {

    fun roll(): Int {//gets a random number from 1 to 6
        return (1..numSides).random()
    }
}