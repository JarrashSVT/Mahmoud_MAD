import {Injectable} from '@angular/core';
import {Http} from '@angular/http';
import 'rxjs/Rx';

@Injectable()

export class MoviesService
{
    http:any;
    baseUrl: String;
    moviesDetailsUrl: String;
    key: String;

    constructor(http: Http)
    {
        this.http = http;
        this.baseUrl = 'https://tastedive.com/api/similar?q=';
        this.key = '287590-moviesSu-WFPMRRJ0';

        this.moviesDetailsUrl = 'https://www.omdbapi.com/?&apikey=1f58465&t=';
        //this.baseUrl = 'https://www.reddit.com/r/food/top/.json?limit'
    }

    displayMovie(title)
    {
        console.log(title);
    }

    getMovies(title, limit)
    {
        console.log("TEST:",title);
        //console.log("getMovies", this.http.get(this.baseUrl + title + '&k=' + this.key).map(res => res.json()))
        return this.http.get(this.baseUrl + title + '&k=' + this.key).map(res => res.json());
    }

    getMovieDetails(title)
    {
        console.log("getMovieDetails:",this.moviesDetailsUrl + title);
        return this.http.get(this.moviesDetailsUrl + title).map(res => res.json());
    }
}