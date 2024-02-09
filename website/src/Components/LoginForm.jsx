import React, { useState } from 'react';
import { useNavigate } from "react-router-dom";

const LoginForm = () => {
    const navigate = useNavigate();
    const [email, setEmail] = useState('');
    const [pass, setPass] = useState('');
    const [error, setError] = useState('');

    const handleSubmit = async (e) => {
      e.preventDefault();
      setError('');

      const payload = {
          email: email,
          password: pass
      };

      try {
          const response = await fetch('http://localhost:8000/login/', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json'
              },
              body: JSON.stringify(payload)
          });

          const data = await response.json();

          if (!response.ok) {
              // If the backend responds with an error status, display the error message
              setError(data.error || "Login failed. Please check your credentials.");
          } else {
              // Assuming your backend returns a property `success` and a JWT `token` upon successful authentication
              if (data.success) {
                  // Store the received token in sessionStorage or localStorage
                  sessionStorage.setItem("auth", true); // Consider using localStorage if you want to persist login state across sessions
                  sessionStorage.setItem("token", data.token);
                  sessionStorage.setItem("user_id", data.user_id); // Make sure to handle the user ID securely
                  navigate('/userprofile'); // Redirect the user to their profile
              } else {
                  // If the backend indicates failure without an HTTP error status
                  setError("Login failed. Please check your credentials.");
              }
          }
      } catch (error) {
          console.error("An error occurred during login:", error);
          setError("An unexpected error occurred. Please try again later.");
      }
    };

    return (
        <div>
            <h2>Login</h2>
            <form className="login-form" onSubmit={handleSubmit}>
                <label htmlFor="email">Email</label>
                <input required value={email} onChange={(e) => setEmail(e.target.value)} type="email" placeholder="email@email.com" id="email" name="email"/>
                <label htmlFor="password">Password</label>
                <input required value={pass} onChange={(e) => setPass(e.target.value)} type="password" placeholder="*********" id="password" name="password"/>
                <button type="submit">Login</button>
                {error && <p className="text-error"><b>{error}</b></p>}
            </form>
            <button className="link-btn" onClick={() => navigate('/register')}>Don't have an account? Register here.</button>
        </div>
    );
};

export default LoginForm;
