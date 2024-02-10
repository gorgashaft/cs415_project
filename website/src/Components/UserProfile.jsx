import React, {useState, useEffect} from 'react'
import { useNavigate } from "react-router-dom"

const UserProfile = () => {
    const navigate = useNavigate();
    const [userColumns, setUserColumns] = useState([]);
    const [record, setRecord] = useState([]);
    const user_id = window.sessionStorage.getItem("user_id")


    useEffect(() => {
        if (!window.sessionStorage.getItem("auth")) navigate('/unauthorized')
        fetch('http://localhost:8000/users/user/' + user_id)
        .then(res => res.json())
        .then(data => {
            console.log(data)
            setUserColumns(Object.keys(data.User))
            setRecord(data.User)
        })
        .catch(error => console.error(error));
    }, []);

    const handleLogout = (e) => {
        e.preventDefault();
        window.sessionStorage.removeItem("auth")
        window.sessionStorage.removeItem("user_id")
        window.sessionStorage.removeItem("token")
        navigate('/login')
    }

  return (
    <div>
        <h2>User</h2>
        <table className='table'>
            <thead>
                <tr>
                    {
                        userColumns.map((c, i) => (<th key={i}>{c.replaceAll("_", " ").toUpperCase()}</th>))
                    }
                </tr>
            </thead>
            <tbody>
                {
                    <tr>
                        <td>{record.user_id}</td>
                        <td>{record.first_name}</td>
                        <td>{record.last_name}</td>
                        <td class="hidetext">{record.password}</td>
                        <td>{record.username}</td>
                        <td>{record.email}</td>
                        <td>{record.date_created}</td>
                        <td>{record.is_active}</td>
                        <td>{record.last_login}</td>
                    </tr>
                }
            </tbody>
        </table>
        <button onClick={handleLogout}>Logout</button>
    </div>
  )
}

export default UserProfile