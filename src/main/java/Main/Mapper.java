package Main;

import Model.Movie;
import Model.User;
import Storage.Storage;
import Views.MovieListView;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.ArrayList;
import java.util.List;

public class Mapper {
    public static List<MovieListView> MapWatchList(User user) throws JsonProcessingException {
        List<MovieListView> list = new ArrayList<>();
        for(Movie movie : user.watchList)
            list.add(new MovieListView(movie));
        return list;

    }

    public static List<MovieListView> MapGenreMovies(String genre) throws JsonProcessingException {
        List<MovieListView> list = new ArrayList<>();
        for(Movie movie : Storage.Database.Movies)
            if(movie.genres.contains(genre))
                list.add(new MovieListView(movie));
        return list;
    }
}
