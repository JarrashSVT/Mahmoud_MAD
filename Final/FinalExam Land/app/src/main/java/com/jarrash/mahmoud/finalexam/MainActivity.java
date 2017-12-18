package com.jarrash.mahmoud.finalexam;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    final public static String LOG_TAG = MainActivity.class.getSimpleName();
    public static final String LOCATION = "LOCATION";
//    public String burritoLocation;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btn = (Button) findViewById(R.id.button);

        View.OnClickListener onClickListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                buildBurrito();
            }
        };

        btn.setOnClickListener(onClickListener);

        Button find_btn = (Button) findViewById(R.id.button2);

        View.OnClickListener onClickListener2 = new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                findBurritoPlace();
            }
        };

        find_btn.setOnClickListener(onClickListener2);
    }

    public void buildBurrito()
    {
        TextView burritoDesc = (TextView) findViewById(R.id.burritoDesc);

        EditText burritoNameTxt = (EditText) findViewById(R.id.burritoName);
        String burritoName = burritoNameTxt.getText().toString();

        ToggleButton burritoTypeToggle = (ToggleButton) findViewById(R.id.toggleButton);
        String burritFilling;
        if(burritoTypeToggle.isChecked())
        {
            burritFilling = "Meat";
        }
        else
        {
            burritFilling = "Veggie";
        }

        String toppings = "" ;

        CheckBox salsaCB = (CheckBox) findViewById(R.id.salsaCheckBox);
        CheckBox cheeseCB = (CheckBox) findViewById(R.id.cheeseCheckBox);
        CheckBox sourCreameCB = (CheckBox) findViewById(R.id.sourcreamCheckBox);
        CheckBox guacamoleCB = (CheckBox) findViewById(R.id.guacamoleCheckBox);

        if(salsaCB.isChecked()) {
            //toppings.concat(" salsa") ;
            toppings = toppings + " salsa";
        }

        if(cheeseCB.isChecked())
        {
//            toppings.concat(" cheese") ;
            toppings = toppings + " cheese";

        }

        if(sourCreameCB.isChecked())
        {
//            toppings.concat(" sour cream") ;
            toppings = toppings + " sour cream";

        }

        if(guacamoleCB.isChecked())
        {
//            toppings.concat(" guacamole") ;
            toppings = toppings + " guacamole";

        }

        ImageView img = (ImageView) findViewById(R.id.burritoImg);
        RadioGroup rg = (RadioGroup) findViewById(R.id.radioGroup);
        int burritTypeId = rg.getCheckedRadioButtonId();

        String burritType;
        if(burritTypeId == R.id.radioButton2)
        {
            burritType = "taco";
            img.setImageResource(R.drawable.taco);
        }
        else
        {
            burritType = "burrito";
            img.setImageResource(R.drawable.burrito);

        }

        Spinner places = (Spinner) findViewById(R.id.spinner);

        String place = String.valueOf(places.getSelectedItem());

        Log.i(LOG_TAG, "FUNCTION: buildBurrito --> place = " + place);


        Switch glutenFreeSwitch = (Switch) findViewById(R.id.switch1);

        String glutenFree = "";
        if(glutenFreeSwitch.isChecked())
        {
            glutenFree = " and with a corn tortilla";
        }

        burritoDesc.setText("The " + burritoName + " is " + burritType+" with "+ burritFilling +
                " with " + toppings + glutenFree +" you would like to eat on " +place);
    }

    public void findBurritoPlace()
    {
        Intent intent = new Intent(this, Main2Activity.class);

        Spinner places = (Spinner) findViewById(R.id.spinner);

        String place = String.valueOf(places.getSelectedItem());
        intent.putExtra(LOCATION, place);

        startActivity(intent);
    }

}
