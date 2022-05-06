import React from 'react';
import Home from "./Home.js";
import Navbar from "./Navbar.js";
import Data from "./Data.js";
import About from "./About.js";
import Contact from "./Contact.js"
import {
  BrowserRouter as Router,
  Routes,
  Route
} from "react-router-dom";

function App() {
return (
    <Router>
      <div className="app-container">
        <Navbar />
        <Routes>
            <Route path="/" element={<Home/>} />
            <Route path="/about" element={<About/>} />
            <Route path="/data" element={<Data/>} />
            <Route path="/contact" element={<Contact/>} />
        </Routes>
      </div>
    </Router>
  );
}
      
export default App;
