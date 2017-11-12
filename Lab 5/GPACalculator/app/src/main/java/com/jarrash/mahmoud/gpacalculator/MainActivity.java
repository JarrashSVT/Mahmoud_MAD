package com.jarrash.mahmoud.gpacalculator;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Toast;
import android.widget.ToggleButton;

import java.text.DecimalFormat;

public class MainActivity extends AppCompatActivity {

    public static final String RESULT_ACTIVITY = "com.jarrash.mahmoud.gpacalculator.RESULT";
    public static final String CUMULATIVE = "CUMULATIVE";
    public static final String MESSAGE = "MESSAGE";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    public void calculateBtnClicked(View view)
    {
        Intent intent = new Intent(this, ResultActivity.class);

        double gpa;
        double cumulativeGpa;
        int cumulativeCredits;
        boolean valid = true;

        EditText cumulativeGpaTxt = (EditText) findViewById(R.id.cGpaTxt);
        EditText cumulativeCreditsTxt = (EditText) findViewById(R.id.cCreditsTxt);

        ToggleButton credit1 = (ToggleButton) findViewById(R.id.creditsToggleButton1);
        ToggleButton credit2 = (ToggleButton) findViewById(R.id.creditsToggleButton2);
        ToggleButton credit3 = (ToggleButton) findViewById(R.id.creditsToggleButton3);
        ToggleButton credit4 = (ToggleButton) findViewById(R.id.creditsToggleButton4);
        ToggleButton credit5 = (ToggleButton) findViewById(R.id.creditsToggleButton5);

        Spinner grade1 = (Spinner) findViewById(R.id.gradeSpinner1);
        Spinner grade2 = (Spinner) findViewById(R.id.gradeSpinner2);
        Spinner grade3 = (Spinner) findViewById(R.id.gradeSpinner3);
        Spinner grade4 = (Spinner) findViewById(R.id.gradeSpinner4);
        Spinner grade5 = (Spinner) findViewById(R.id.gradeSpinner5);

        RadioGroup gpaTypeGroup = (RadioGroup) findViewById(R.id.gpaTypeRadioGroup);
        int gpaType = gpaTypeGroup.getCheckedRadioButtonId();

        CheckBox displayMsg = (CheckBox) findViewById(R.id.showMsgCheckBox);

        double [][] grades = new double[][] {
                {getCreditValue(credit1), getGradeValue(grade1)},
                {getCreditValue(credit2), getGradeValue(grade2)},
                {getCreditValue(credit3), getGradeValue(grade3)},
                {getCreditValue(credit4), getGradeValue(grade4)},
                {getCreditValue(credit5), getGradeValue(grade5)},
        };

        if(gpaType == R.id.radioButton1)
        {
            cumulativeGpa = 0;
            cumulativeCredits = 0;
            intent.putExtra(CUMULATIVE, false);
        }
        else
        {
            if(cumulativeGpaTxt.getText().length() > 0 && cumulativeCreditsTxt.getText().length() > 0)
            {
                cumulativeGpa = Double.parseDouble(cumulativeGpaTxt.getText().toString());
                cumulativeCredits = Integer.parseInt(cumulativeCreditsTxt.getText().toString());
                intent.putExtra(CUMULATIVE, true);
            }
            else
            {
                cumulativeGpa = 0;
                cumulativeCredits = 0;
                valid = false;
                displayToast("Make sure to enter the cumulative values");
            }
        }

        DecimalFormat df = new DecimalFormat(".###");
        gpa = calculateGpa(grades,cumulativeGpa, cumulativeCredits);

        if(Double.isNaN(gpa))
        {
            displayToast("Enter at least 1 grade");
            valid = false;
        }

        if(displayMsg.isChecked())
        {
            intent.putExtra(MESSAGE, getMotivtionalMessage(gpa));
        }
        else
        {
            intent.putExtra(MESSAGE, "None");
        }
        intent.putExtra(RESULT_ACTIVITY, String.valueOf(df.format(gpa)));

        if(valid)
        {
            startActivity(intent);
        }


    }

    public int getCreditValue(ToggleButton tb)
    {
        if (tb.isChecked())
        {
            return 4;
        }
        else
        {
            return 3;
        }
    }

    public double getGradeValue(Spinner s)
    {
        String gradeLetter = String.valueOf(s.getSelectedItem());
        double grade;
        switch (gradeLetter)
        {
            case "A":
                grade = 4.0;
                break;
            case "A-":
                grade = 3.7;
                break;
            case "B+":
                grade = 3.3;
                break;
            case "B":
                grade = 3.0;
                break;
            case "B-":
                grade = 2.7;
                break;
            case "C+":
                grade = 2.3;
                break;
            case "C":
                grade = 2.0;
                break;
            case "C-":
                grade = 1.7;
                break;
            case "D+":
                grade = 1.3;
                break;
            case "D":
                grade = 1.0;
                break;
            case "D-":
                grade = 0.7;
                break;
            case "F":
                grade = 0.0;
                break;
            case "Grade":
                grade = -1;
                break;
            default:
                grade = -1;
                break;
        }
        return grade;
    }

    public double calculateGpa(double[][] grades, double cumulativeGpa, int totalCredits )
    {
        double gpa;
        double total = 0;
        int credits = 0;
        for(int i = 0 ; i < 5 ; i++)
        {
            if(grades[i][1] != -1)
            {
                total += grades[i][0] * grades[i][1];
                credits += grades[i][0];
            }
        }

        total += cumulativeGpa * totalCredits;
        credits += totalCredits;
        Log.d("total", String.valueOf(total));
        Log.d("credits", String.valueOf(credits));
        gpa = total/credits;

        Log.d("gpa", String.valueOf(gpa));

        return  gpa;
    }

    public String getMotivtionalMessage(double gpa)
    {
        String msg;
        if( gpa > 3.8)
        {
            msg = "Magnificent";
        }
        else if (gpa > 3.3)
        {
            msg = "Excellent";
        }
        else if (gpa > 3)
        {
            msg = "Good Work";
        }
        else if (gpa > 2.5)
        {
            msg = "You need to work harder!";
        }
        else if ( gpa > 2)
        {
            msg = "You REALLY REALLY need to work harder";
        }
        else
        {
            msg = ":(";
        }

        return msg;
    }

    public void displayToast(String msg)
    {
        //toast
        Context context = getApplicationContext();
        CharSequence text = msg ;
        int duration = Toast.LENGTH_SHORT;

        Toast toast = Toast.makeText(context, text, duration);
        toast.show();
    }
}
