import { useEffect, useState } from 'react';
import './App.css';
import {getMovieList, searchMovie} from "./api"

const App = () => {
  const [popularMovie, setPopularMovie] = useState([])

  useEffect(() => {
    getMovieList().then((result) =>{
      setPopularMovie(result)
    });
  },[])

  const PopularMovieList = () =>{
    return popularMovie.map((movie, i) =>{
      return(
        <div className="Movie-wrapper" key={i}>
              <div className="Movie-title">{movie.title} </div>
              <img className='Movie-image' src={ `${process.env.REACT_APP_BASEIMGURL}/${movie.poster_path}` } alt=""/>
              <div className="Movie-date">{movie.release_date}</div>
              <div className="Movie-rate">{movie.vote_average}</div>
        </div>
      )
    })
  }

  const search = async (q) => {
    if(q.length > 3)
    {
      const query = await searchMovie(q)
      setPopularMovie(query.results)
    }
  }

  console.log({popularMovie : popularMovie})

  return (
    <div className="App">
      <header className="App-header">
          <h1>Hello World</h1>
          <input type="text" placeholder='cari film kesayangan' className='Movie-search' onChange={({target}) => search(target.value)}/>
          <div className="Movie-container">
            <PopularMovieList></PopularMovieList>
          </div>
      </header>
    </div>
  );
}

export default App;
