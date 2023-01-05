import logo from './logo.svg';
import './App.css';
import './static/css/platform.css'
const { platformConstants } = require('./static/js/platform');

export default function App() {

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
          <div><h2 className="appFullName">{platformConstants.appFullName}</h2></div>
      </header>

    </div>
  );
}
