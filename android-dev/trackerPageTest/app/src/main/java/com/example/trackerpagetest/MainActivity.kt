package com.example.trackerpagetest

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), SensorEventListener {

    private var sensorManager: SensorManager? = null

    private var running = false
    private var totalSteps = 0f
    private var prevTotalSteps = 0f

//    var stepsVal: TextView = findViewById(R.id.stepsVal)
//    var circular_ProgressBar: CircularProgressBar = findViewById(R.id.circular_ProgressBar)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadData()
        resetSteps()

        //gets system service
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
    }

    override fun onResume() {
        super.onResume()
        running = true
        val StepSensor = sensorManager?.getDefaultSensor(Sensor.TYPE_STEP_COUNTER)

        if(StepSensor == null) {
            Toast.makeText(this, "No sensor detected on this device.", Toast.LENGTH_SHORT).show()
        } else {
            sensorManager?.registerListener(this, StepSensor, SensorManager.SENSOR_DELAY_UI)
        }
    }

    override fun onSensorChanged(event: SensorEvent?) {
       // if it is running, we want to register our total steps.
        if (running) {
            totalSteps = event!!.values[0]
            val currentSteps = totalSteps.toInt() - prevTotalSteps.toInt()
            stepsVal.text = ("$currentSteps")

            circular_ProgressBar.apply {
                setProgressWithAnimation(currentSteps.toFloat())
            }
        }
    }

    private fun resetSteps() {
        stepsVal.setOnClickListener {
            Toast.makeText(this, "Long tap to reset steps", Toast.LENGTH_SHORT).show()
        }

        stepsVal.setOnLongClickListener {
            prevTotalSteps = totalSteps
            stepsVal.text = 0.toString()
            saveData()
            true
        }
    }

    private fun saveData() {
        val sharedPrefs = getSharedPreferences("myPrefs", Context.MODE_PRIVATE)
        val editor = sharedPrefs.edit()
        editor.putFloat("key1", prevTotalSteps)
        editor.apply()
    }

    private fun loadData() {
        val sharedPrefs = getSharedPreferences("myPrefs", Context.MODE_PRIVATE)
        val savedNumber = sharedPrefs.getFloat("key1", 0f)
        Log.d("MainActivity", "$savedNumber")
        prevTotalSteps = savedNumber
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        TODO("Not yet implemented")
    }

}