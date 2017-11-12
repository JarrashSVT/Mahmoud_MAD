package com.jarrash.mahmoud.gpacalculator;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

public class ResultActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        // Get the Intent that started this activity and extract the string
        Intent intent = getIntent();
        String gpaTxt = intent.getStringExtra(MainActivity.RESULT_ACTIVITY);
        Boolean c = intent.getExtras().getBoolean(MainActivity.CUMULATIVE);
        String msg = intent.getStringExtra(MainActivity.MESSAGE);
        // Capture the layout's TextView and set the string as its text
        TextView textView = findViewById(R.id.resultGpaTxt);
        if(c)
        {
            textView.setText("Cumulative GPA: " + gpaTxt);
        }
        else
        {
            textView.setText("Semester GPA: " + gpaTxt);
        }

        if(!msg.equals("None"))
        {
            TextView messageTxt = findViewById(R.id.msgTxt);
            messageTxt.setText(msg);
        }


    }
}
