package com.jarrash.mahmoud.moviefinder;

import android.content.Intent;
import android.graphics.Paint;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import org.json.JSONException;

public class MoviesActivity extends AppCompatActivity {
    final public static String LOG_TAG = MoviesActivity.class.getSimpleName();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movies);

        Intent intent = getIntent();

        int index = intent.getExtras().getInt(MainActivity.INDEX);


        Log.i("index===============> " , index + "");
        //indexTxt.setText(index + "");

        final Movie movie = selectMovie(index);

        TextView titleAndYearTxt = (TextView) findViewById(R.id.titleAndYearTxt);
        TextView ratingTxt = (TextView) findViewById(R.id.ratingTxt);
        ImageView poster = (ImageView)  findViewById(R.id.posterImg);
        TextView urlTxt = (TextView) findViewById(R.id.urlTxt);
        TextView runtimeTxt = (TextView) findViewById(R.id.runtimeTxt);
        TextView ratedTxt = (TextView) findViewById(R.id.boxOfficeTxt);

        titleAndYearTxt.setText(movie.getTitle() + " (" + movie.getYear() + ")");
        ratingTxt.setText("Rating: " + movie.getRating());
        runtimeTxt.setText("Runtime: " + movie.getRuntime());
        ratedTxt.setText("Rated: " + movie.getRated());
        urlTxt.setText(movie.getUrl());
        urlTxt.setPaintFlags(urlTxt.getPaintFlags() | Paint.UNDERLINE_TEXT_FLAG);

        String posterStr = movie.getImage();
        posterStr = posterStr.substring(0, posterStr.lastIndexOf('.'));
        int imageId = this.getResources().getIdentifier(posterStr, "drawable", this.getPackageName());
        poster.setImageResource(imageId);
        Log.d(LOG_TAG, "image ID : " + imageId);

        //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view, movie.getUrl());
            }
        };

        urlTxt.setOnClickListener(onclick);
    }

    public Movie selectMovie(int index)
    {
        String movieJsonStr = getMovieDetails(index);

        Movie movie = new Movie();
        try
        {

            movie.MovieFromJson(movieJsonStr);
        }
        catch (JSONException je)
        {
            je.printStackTrace();
        }

        Log.i(LOG_TAG,"Movie Title: " + movie.getTitle());
        Log.i(LOG_TAG,"Movie Year: " + movie.getYear());
        Log.i(LOG_TAG,"Movie URL: " + movie.getUrl());
        Log.i(LOG_TAG,"Movie Image: " + movie.getImage());
        Log.i(LOG_TAG,"Movie Rating: " + movie.getRating());

        return movie;

    }

    // I know that this is an overkill but I just wanted to play with JSON :)
    public String getMovieDetails( int index)
    {
        String movieDetails;

        switch (index)
        {
            case 0:
                movieDetails ="{\"Title\":\"Inception\",\"Year\":\"2010\",\"Rated\":\"PG-13\",\"Released\":\"16 Jul 2010\",\"Runtime\":\"148 min\",\"Genre\":\"Action, Adventure, Sci-Fi\",\"Director\":\"Christopher Nolan\",\"Writer\":\"Christopher Nolan\",\"Actors\":\"Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy\",\"Plot\":\"A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.\",\"Language\":\"English, Japanese, French\",\"Country\":\"USA, UK\",\"Awards\":\"Won 4 Oscars. Another 152 wins & 204 nominations.\",\"Poster\":\"inception.jpg\",\"Ratings\":[{\"Source\":\"Internet Movie Database\",\"Value\":\"8.8/10\"},{\"Source\":\"Rotten Tomatoes\",\"Value\":\"86%\"},{\"Source\":\"Metacritic\",\"Value\":\"74/100\"}],\"Metascore\":\"74\",\"imdbRating\":\"8.8\",\"imdbVotes\":\"1,636,262\",\"imdbID\":\"tt1375666\",\"Type\":\"movie\",\"DVD\":\"07 Dec 2010\",\"BoxOffice\":\"$292,568,851\",\"Production\":\"Warner Bros. Pictures\",\"Website\":\"http://inceptionmovie.warnerbros.com/\",\"Response\":\"True\"}";
                break;
            case 1:
                movieDetails ="{\"Title\":\"The Godfather\",\"Year\":\"1972\",\"Rated\":\"R\",\"Released\":\"24 Mar 1972\",\"Runtime\":\"175 min\",\"Genre\":\"Crime, Drama\",\"Director\":\"Francis Ford Coppola\",\"Writer\":\"Mario Puzo (screenplay), Francis Ford Coppola (screenplay), Mario Puzo (novel)\",\"Actors\":\"Marlon Brando, Al Pacino, James Caan, Richard S. Castellano\",\"Plot\":\"The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.\",\"Language\":\"English, Italian, Latin\",\"Country\":\"USA\",\"Awards\":\"Won 3 Oscars. Another 24 wins & 27 nominations.\",\"Poster\":\"godfather.jpg\",\"Ratings\":[{\"Source\":\"Internet Movie Database\",\"Value\":\"9.2/10\"},{\"Source\":\"Rotten Tomatoes\",\"Value\":\"99%\"},{\"Source\":\"Metacritic\",\"Value\":\"100/100\"}],\"Metascore\":\"100\",\"imdbRating\":\"9.2\",\"imdbVotes\":\"1,276,666\",\"imdbID\":\"tt0068646\",\"Type\":\"movie\",\"DVD\":\"09 Oct 2001\",\"BoxOffice\":\"N/A\",\"Production\":\"Paramount Pictures\",\"Website\":\"http://www.thegodfather.com\",\"Response\":\"True\"}";
                break;
            case 2:
                movieDetails ="{\"Title\":\"It\",\"Year\":\"2017\",\"Rated\":\"R\",\"Released\":\"08 Sep 2017\",\"Runtime\":\"135 min\",\"Genre\":\"Drama, Horror, Thriller\",\"Director\":\"Andy Muschietti\",\"Writer\":\"Chase Palmer (screenplay by), Cary Fukunaga (screenplay by), Gary Dauberman (screenplay by), Stephen King (based on the novel by)\",\"Actors\":\"Jaeden Lieberher, Jeremy Ray Taylor, Sophia Lillis, Finn Wolfhard\",\"Plot\":\"A group of bullied kids band together when a shapeshifting demon, taking the appearance of a clown, begins hunting children.\",\"Language\":\"English\",\"Country\":\"USA, Canada\",\"Awards\":\"1 win.\",\"Poster\":\"it.jpg\",\"Ratings\":[{\"Source\":\"Internet Movie Database\",\"Value\":\"7.8/10\"},{\"Source\":\"Rotten Tomatoes\",\"Value\":\"84%\"},{\"Source\":\"Metacritic\",\"Value\":\"70/100\"}],\"Metascore\":\"70\",\"imdbRating\":\"7.8\",\"imdbVotes\":\"163,749\",\"imdbID\":\"tt1396484\",\"Type\":\"movie\",\"DVD\":\"N/A\",\"BoxOffice\":\"$305,250,480\",\"Production\":\"Warner Bros. Pictures\",\"Website\":\"http://www.Itthemovie.com\",\"Response\":\"True\"}";
                break;
            case 3:
                movieDetails ="{\"Title\":\"Forrest Gump\",\"Year\":\"1994\",\"Rated\":\"PG-13\",\"Released\":\"06 Jul 1994\",\"Runtime\":\"142 min\",\"Genre\":\"Drama, Romance\",\"Director\":\"Robert Zemeckis\",\"Writer\":\"Winston Groom (novel), Eric Roth (screenplay)\",\"Actors\":\"Tom Hanks, Rebecca Williams, Sally Field, Michael Conner Humphreys\",\"Plot\":\"JFK, LBJ, Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.\",\"Language\":\"English\",\"Country\":\"USA\",\"Awards\":\"Won 6 Oscars. Another 39 wins & 66 nominations.\",\"Poster\":\"forrestgump.jpg\",\"Ratings\":[{\"Source\":\"Internet Movie Database\",\"Value\":\"8.8/10\"},{\"Source\":\"Rotten Tomatoes\",\"Value\":\"71%\"},{\"Source\":\"Metacritic\",\"Value\":\"82/100\"}],\"Metascore\":\"82\",\"imdbRating\":\"8.8\",\"imdbVotes\":\"1,416,319\",\"imdbID\":\"tt0109830\",\"Type\":\"movie\",\"DVD\":\"28 Aug 2001\",\"BoxOffice\":\"$405,000\",\"Production\":\"Paramount Pictures\",\"Website\":\"http://www.paramount.com/movies/forrest-gump/\",\"Response\":\"True\"}";
                break;
            default:
                movieDetails = "{NA}";
                break;
        }
        return movieDetails;
    }

    public void loadWebSite(View view, String url)
    {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        startActivity(intent);
    }


}
