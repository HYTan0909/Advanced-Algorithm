package com.example.healthcare_app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.format.DateUtils;
import android.widget.Toast;

import java.text.ParseException;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class CheckIn extends AppCompatActivity {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    String lastCheckedInTime = "2022-06-23";

    Date compareTime;

    {
        try {
            compareTime = dateFormat.parse(lastCheckedInTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    Date currentTime = Calendar.getInstance().getTime();

    String str_today = dateFormat.format(currentTime);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check_in);

        if(currentTime.after(compareTime)){
            //connect to database compare time
            Toast.makeText(this, "Checked in successfully. Point + 1", Toast.LENGTH_SHORT).show();
        }
        else{
            Toast.makeText(this, "You already checked in today. Please come back tomorrow. ", Toast.LENGTH_SHORT).show();
        }
    }
}