package com.jarrash.mahmoud.finalexam;

/**
 * Created by mahmoud on 12/17/17.
 */

public class burritoPlaces
{
    private String location;
    private String name;
    private String url;

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    public burritoPlaces(String location) {
        this.location = location;

        if(location.equals("The Hill"))
        {
            this.setName("Illegal Petes");
            this.setUrl("http://illegalpetes.com/");
        }
        else if(location.equals("29th Street"))
        {
            this.setName("Chipotle");
            this.setUrl("https://www.chipotle.com/");
        }
        else
        {
            this.setName("Bartaco");
            this.setUrl("https://bartaco.com/");
        }
    }

    public burritoPlaces()
    {

    }

}
