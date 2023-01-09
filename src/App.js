import logo from './logo.svg';
import './App.css';
import './static/css/platform.css'

export default function App() {

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
          {/* //eslint-disable-next-line (Ignoring platformConstants)*/}
          {/*<div className="appFullName"></div>*/}
      </header>
    </div>
  );
}
