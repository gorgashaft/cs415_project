import React, {useState, useEffect} from 'react'
import { useNavigate } from "react-router-dom"


const Ratings = () => {
    const navigate = useNavigate();
    const [columns, setColumns] = useState([]);
    const [records, setRecords] = useState([]);


    useEffect(() => {
        if (!window.sessionStorage.getItem("auth")) navigate('/unauthorized')
        fetch('http://localhost:8000/ratings/')
        .then(res => res.json())
        .then(data => {
            setColumns(Object.keys(data.Ratings[0]))
            setRecords(data.Ratings)
        })
        .catch(error => console.error(error));
    }, []);

  return (
    <div>
        <h2>Movie Ratings</h2>
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
                            <td>{record.rating_id}</td>
                            <td>{record.value}</td>
                            <td>{record.movie_id}</td>
                            <td>{record.user_id}</td>
                            <td>{record.comments}</td>
                        </tr>
                    ))
                }
            </tbody>
        </table>
        <button className="link-btn" onClick={() => navigate('/newratingentry')}>+Add Rating Entry</button>
    </div>

  )
}

export default Ratings