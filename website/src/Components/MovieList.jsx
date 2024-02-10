// import React, {useState, useEffect} from 'react'
// import { useNavigate } from "react-router-dom"

// const MovieList = () => {
//   const navigate = useNavigate();
//   const [pageName, setPageName] = useState('')
//   const [pageTitle, setPageTitle] = useState('')
//   const [pageDescription, setPageDescription] = useState('')

//   useEffect(() => {
//     if (!window.sessionStorage.getItem("auth")) navigate('/unauthorized')
//     fetch('http://localhost:8000/movies/')
//     .then(res => res.json())
//     .then(data => {
//         console.log(data)
//         setPageName(data.page.page_name)
//         setPageTitle(data.page.page_title)
//         setPageDescription(data.page.page_description)
//     })
//     .catch(error => console.error(error));
// }, []);

//   return (
//     <div>

//       <h1>Movie Database</h1>
//       <p><font color="white">This is only accessible when logged in</font></p>

//         <h2>{pageName}</h2>
//         <p><b>{pageTitle}</b></p>
//         <p><font color='white'>{pageDescription}</font></p>
//     </div>

//   )
// }

// export default MovieList
import React, {useState, useEffect} from 'react'
import { useNavigate } from "react-router-dom"


const MovieList = () => {
    const navigate = useNavigate();
    const [columns, setColumns] = useState([]);
    const [records, setRecords] = useState([]);


    useEffect(() => {
        if (!window.sessionStorage.getItem("auth")) navigate('/unauthorized')
        fetch('http://localhost:8000/movies/')
        .then(res => res.json())
        .then(data => {
            setColumns(Object.keys(data.Movies[0]))
            setRecords(data.Movies)
        })
        .catch(error => console.error(error));
    }, []);

  return (
    <div>
        <h2>Movie Database</h2>
        <table className='table'>
            <thead>
                <tr>
                    {columns.map((c, i) => (
                        <th key={i}>{c.replaceAll("_", " ").toUpperCase()}</th>
                    ))}
                </tr>
            </thead>
            <tbody>
                {
                    records.map((record,i) => (
                        <tr key={i}>
                            <td>{record.movie_id}</td>
                            <td>{record.title}</td>
                            <td>{record.studio_id}</td>
                            <td>{record.genre_id}</td>
                            <td>{record.director}</td>
                            <td>{record.release_date}</td>
                            <td>{record.rating}</td>
                        </tr>
                    ))
                }
            </tbody>
        </table>

    </div>
  )
}

export default MovieList
