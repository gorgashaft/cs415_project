import React, {useState} from "react";
import { useNavigate } from "react-router-dom"

export const AddGenre = (props) => {
    const navigate = useNavigate();
    const [value, setValue] = useState('');
    const [comments, setComments] = useState('');
    const [error, setError] = useState('');

    const handleSubmit = (e) => {
        e.preventDefault();
        setError(null)
        let success = true
        let errorText = ''

        const payload = JSON.stringify({
            value: value,
            comments: comments,
        })
        try {
            fetch('http://localhost:8000/genre/',{
            method: 'POST',
            body: payload,
            headers:{
                'Content-Type': 'application/json'
                }
            }).then(res => {
                    console.log(res)
                    if (!res.ok){
                        errorText = "Error: " + res.status + ' - '
                        success = false
                        return res.json()
                    }
                    else {
                        success = true
                        return res.json()
                    }
                 }
              ).then(data => {
                if (!success) {
                    for (const err in data.errors){
                    for (const msg in data.errors[err]) errorText += data.errors[err][msg]
                    }
                    console.log(errorText)
                    setError(errorText)
                }

            })
            .catch(error => {
                success = false
                console.error(error)
            });
            if (success) {
                setValue('')
                setComments('')
                setError('Rating Added!')
            }
            else{
                setError(errorText)
            }
        } catch (error) {
            console.error(error);
            setError('Error Adding Rating - Check Yo Info!')
        }

    }

    return (
        <div >
            <h2>Register</h2>
            <form className="register-form" onSubmit={handleSubmit}>
                <label htmlFor="value">User Rating</label>
                <input required value={value} onChange={(e) => setValue(e.target.value)} type="int" placeholder="1-Horrid, 10-Incredible" id="value" name="value"/>
                
                <label htmlFor="comments">User Comments</label>
                <input required value={comments} onChange={(e) => setComments(e.target.value)} type="text" placeholder="Comments" id="comments" name="comments"/>
                
                <button type="submit">Submit</button>
                
                <p className="text-success"><b>{error}</b></p>
            </form>
        </div>
    )
}

export default AddGenre;