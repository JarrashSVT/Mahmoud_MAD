package com.jarrash.mahmoud.moviefinder;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    final public static String INDEX = "INDEX";

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btn = (Button) findViewById(R.id.button);

        View.OnClickListener onclick = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                findMovie(v);
            }
        };

        btn.setOnClickListener(onclick);
    }

    public void findMovie(View v)
    {
        Intent intent = new Intent(this, MoviesActivity.class);

        Spinner genreSpinner = (Spinner) findViewById(R.id.genreSpinner);

        String genre = genreSpinner.getSelectedItem().toString();

        int movieIndex = getMovieIndex(genre);

        intent.putExtra(INDEX, movieIndex);

        startActivity(intent);


    }


    public int getMovieIndex(String genre)
    {
        int index;

        switch (genre)
        {
            case "Horror":
                index = 2;
                break;
            case "Crime":
                index = 1;
                break;
            case "Action":
                index = 0;
                break;
            case "Drama":
                index = 3;
                break;
            default:
                index = -1;
                break;
        }


        return  index;
    }
}
