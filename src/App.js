import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
          <h1>Welcome React Js</h1>
          <h1>This DepOps</h1>
          <h2>This Heading 2</h2>
          <h3>This Heading 3</h3>
          <h3>Hello REACT Location {process.env.REACT_APP_ENVIRONMENT_LOCATION}</h3>
          <button>Submit</button>
        </p>
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
