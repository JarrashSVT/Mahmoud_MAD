package com.jarrash.mahmoud.moviefinder;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by mahmoud on 11/16/17.
 */

public class Movie {
    final public static String LOG_TAG = Movie.class.getSimpleName();

    private String title;
    private String year;
    private String image;
    private String url;
    private String rating;
    private String runtime;
    private String boxOffice;
    private String rated;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getRuntime() {
        return runtime;
    }

    public void setRuntime(String runtime) {
        this.runtime = runtime;
    }

    public String getBoxOffice() {
        return boxOffice;
    }

    public void setBoxOffice(String boxOffice) {
        this.boxOffice = boxOffice;
    }

    public String getRated() {
        return rated;
    }

    public void setRated(String rated) {
        this.rated = rated;
    }

    public void MovieFromJson(String json) throws JSONException {
        Log.d(LOG_TAG, "-------> JSON :" + json);
        JSONObject jsonObject = new JSONObject(json);

        this.setTitle(jsonObject.getString("Title"));
        Log.d(LOG_TAG, "Title: " + jsonObject.getString("Title"));

        this.setYear(jsonObject.getString("Year"));
        Log.d(LOG_TAG, "Year: " + jsonObject.getString("Year"));

        this.setUrl(jsonObject.getString("Website"));
        Log.d(LOG_TAG, "URL: " + jsonObject.getString("Website"));

        this.setRating(jsonObject.getString("imdbRating"));
        Log.d(LOG_TAG, "Rating: " + jsonObject.getString("imdbRating"));

        this.setImage(jsonObject.getString("Poster"));
        Log.d(LOG_TAG, "Image: " + jsonObject.getString("Poster"));

        this.setRuntime(jsonObject.getString("Runtime"));
        Log.d(LOG_TAG, "Runtime: " + jsonObject.getString("Runtime"));

        this.setBoxOffice(jsonObject.getString("BoxOffice"));
        Log.d(LOG_TAG, "Box Office: " + jsonObject.getString("BoxOffice"));

        this.setRated(jsonObject.getString("Rated"));
        Log.d(LOG_TAG, "Rated: " + jsonObject.getString("Rated"));

    }

}
