import React, { useEffect } from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  
  // store users in a new variable
  const [users, setUsers] = React.useState([]);

  // call to backend that will users and return json
  useEffect(() => {
    let fetchData = async () => {
      let response = await fetch('/api/users')
      let json = await response.json()
      setUsers(json)
    }
    fetchData()
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>Users</h1>
        {users.map((user) => <p>
          {user.username} {user.email}
        </p>)}
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
