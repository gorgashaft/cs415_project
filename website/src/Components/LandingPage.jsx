import React from 'react'
import { useNavigate } from "react-router-dom"

const LandingPage = () => {
  const navigate = useNavigate();

  return (
    <div>
      <h1>FilmZion Database</h1>
      <p><font color="white">Welcome to the FilmZion Database for Cinefiles</font></p>
    </div>
  )
}

export default LandingPage
