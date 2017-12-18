package com.jarrash.mahmoud.finalexam;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {
    String url;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        TextView burritoLocationTxt = (TextView) findViewById(R.id.burritoLocation);

        Intent i = getIntent();

        String locationTxt = i.getStringExtra(MainActivity.LOCATION);

        burritoPlaces bp = new burritoPlaces(locationTxt);
        burritoLocationTxt.setText("You should check out " + bp.getName());
        url = bp.getUrl();
        //get image button
        final ImageButton imageButton = (ImageButton) findViewById(R.id.imageButton);
        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view,url);
            }
        };

        //add listener to the button
        imageButton.setOnClickListener(onclick);
    }

    public void loadWebSite(View view, String url)
    {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        startActivity(intent);
    }
}
